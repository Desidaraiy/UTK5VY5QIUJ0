import 'dart:convert';
import 'package:demo_app/main.dart';
import 'package:demo_app/models/catalog.dart';
import 'package:demo_app/models/shopModel.dart';
import 'package:demo_app/store/store.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import 'dart:math' show cos, sqrt, asin;
import 'package:geolocator/geolocator.dart';
import 'package:location/location.dart';
import 'package:moment_dart/moment_dart.dart';
// import 'package:permission_handler/permission_handler.dart';

class DatabaseHelper {
  DatabaseHelper._privateConstructor();

  final CatalogViewStore store = CatalogViewStore();

  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;
  Future<Database> get database async => _database ??= await _initDatabase();

  Future<Database> _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'godendo.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE test(
        id INTEGER,
        name TEXT,
        value TEXT
      )
    ''');
    await db.execute('''
      CREATE TABLE goodtest(
        id INTEGER PRIMARY KEY,
        external_id INTEGER,
        name TEXT
      )
    ''');
    await db.execute('''
      CREATE TABLE goods(
        id INTEGER PRIMARY KEY,
        external_id INTEGER,
        name TEXT,
        brand TEXT,
        cat_id INTEGER,
        shop_id INTEGER,
        weight REAL,
        price_old INTEGER,
        price INTEGER,
        godendo TEXT,
        filename TEXT,
        active INTEGER
      )
    ''');
    await db.execute('''
      CREATE TABLE shops(
        id INTEGER PRIMARY KEY,
        name TEXT,
        address TEXT,
        org_id INTEGER,
        logo TEXT,
        description TEXT,
        active INTEGER,
        owner_id INTEGER
      )
    ''');
    await db.execute('''
      CREATE TABLE categories(
        id INTEGER PRIMARY KEY,
        external_id INTEGER,
        name TEXT,
        owner_id INTEGER,
        position INTEGER,
        active INTEGER
      )
    ''');
  }

  int calculateDistance(lat1, lon1, lat2, lon2) {
    if (lat1 == 0 && lon1 == 0) {
      return 0;
    }
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((lat2 - lat1) * p) / 2 +
        c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
    var rare = (12742 * asin(sqrt(a))) * 1000;
    var ret = rare.round();
    return ret;
  }

  void enablePositionService() async {
    bool permission = await Geolocator.isLocationServiceEnabled();
    Location loc = new Location();
    bool enabled = false;
    if (!permission) {
      enabled = await loc.requestService();
    }
    print("requested service. users got ${enabled}");

    if (enabled) {
      store.getObsMarkets();
    }
  }

  Future<List> _getCurrentLocation() async {
    Location location = Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;
    List ret = [0, 0];

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return ret;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return ret;
      }
    }

    _locationData = await location.getLocation();
    ret = [_locationData.latitude, _locationData.longitude];

    return ret;
  }

  Future<List<Market>> getMarkets() async {
    List<Market> markets = [];
    int dist = 0;
    List myCoords = [0, 0];
    myCoords = await _getCurrentLocation();
    if (store.getMarkets.isEmpty) {
      final jsondata = await _postMarkets();
      MarketResponse marketResponse = marketResponseFromJson(jsondata);
      markets = marketResponse.shops;
      markets.asMap().forEach((key, value) {
        var _sCoords = [double.parse(value.lat!), double.parse(value.lon!)];
        dist = calculateDistance(
            myCoords[0], myCoords[1], _sCoords[0], _sCoords[1]);
        value.distance = dist;
      });
      markets.sort((a, b) => a.distance.compareTo(b.distance));
      store.setMarkets(markets);
    } else {
      markets = store.getMarkets;
    }

    return markets;
  }

  Future<List<Market>> checkMarkets() async {
    List<Market> markets = [];

    if (store.getMarkets.isEmpty) {
      markets = await getMarkets();
    } else {
      markets = store.markets;
    }

    return markets;
  }

  Future<http.Response> _loadServer() {
    return http.post(
      Uri.parse('https://api.goden-do.ru/show-catalog'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
  }

  Future<http.Response> _loadMarkets() {
    return http.post(Uri.parse('https://api.goden-do.ru/show-all-shops'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        });
  }

  Future<String> _postMarkets() async {
    var post = await _loadMarkets();
    return post.body;
  }

  Future<String> _loadData() async {
    var post = await _loadServer();
    return post.body;
  }

  Future<List<Good>> getGoodsOfMarket(id) async {
    List<Good> list = [];

    List<Good> goods = store.getGoods;

    List<Market> markets = store.getMarkets;

    goods.asMap().forEach((key, value) {
      if (value.shopId == id) {
        list.add(value);
      }
    });

    return list;
  }

  Future<List<Catalog>> getCategories() async {
    Database db = await instance.database;
    var categories = await db.rawQuery(
        "SELECT external_id AS id, name, owner_id, position, active FROM categories");
    List<Catalog> catsList = categories.isNotEmpty
        ? categories.map((c) => Catalog.fromJson(c)).toList()
        : [];
    if (catsList.isEmpty) {
      print('database is empty, downloading');
      String jsonString = await _loadData();
      final allResources = welcomeFromJson(jsonString);
      if (allResources.message == 'ok') {
        allResources.catalog.asMap().forEach((i, v) {
          catsList.add(v);
        });
      }
    } else {
      print('displayed values from database');
    }
    return catsList;
  }

  Future<List<Subcat>> getSubCategories(int id) async {
    Database db = await instance.database;
    var categories = await db.rawQuery(
        "SELECT external_id AS id, name, owner_id, position, active FROM categories");
    List<Subcat> subCatsList = categories.isNotEmpty
        ? categories.map((c) => Subcat.fromJson(c)).toList()
        : [];
    if (subCatsList.isEmpty) {
      print('database is empty, downloading');
      String jsonString = await _loadData();
      final allResources = welcomeFromJson(jsonString);
      if (allResources.message == 'ok') {
        allResources.catalog.asMap().forEach((i, v) {
          v.subcat?.asMap().forEach((k, value) {
            if (value.ownerId == id) {
              subCatsList.add(value);
            }
          });
        });
      }
    } else {
      print('displayed values from database');
    }
    return subCatsList;
  }

  Future<List<Good>> getGoodsById(int id, int subid) async {
    Database db = await instance.database;
    var goods = await db.rawQuery(
        "SELECT external_id AS id, name, owner_id, position, active FROM categories");
    List<Good> goodsList =
        goods.isNotEmpty ? goods.map((c) => Good.fromJson(c)).toList() : [];
    if (goodsList.isEmpty) {
      print('database is empty, downloading');
      String jsonString = await _loadData();
      final allResources = welcomeFromJson(jsonString);
      if (allResources.message == 'ok') {
        allResources.catalog.asMap().forEach((i, v) {
          if (v.id == id) {
            v.subcat?.asMap().forEach((k, value) {
              if (value.id == subid) {
                value.goods.asMap().forEach((key, val) {
                  val.distance = getDistanceToMarket(val.shopId);
                  goodsList.add(val);
                });
              }
            });
          }
        });
      }
    }

    return goodsList;
  }

  bool getStatusOfmarket(marketId) {
    bool ret = false;
    List<Market> markets = store.getMarkets;
    final now = TimeOfDay.now();
    markets.asMap().forEach((key, value) {
      if (value.id == marketId) {
        String time = value.description;
        var arr = time.split(" - ");
        var time1 = int.parse(arr[0].split(":")[0]);
        var time2 = int.parse(arr[1].split(":")[0]);
        if (time1 > now.hour && time2 > now.hour) {
          ret = false;
        } else if (time1 < now.hour && time2 < now.hour) {
          ret = false;
        } else {
          ret = true;
        }
      }
    });
    return ret;
  }

  String getFullNameOfMarket(marketId) {
    List<Market> markets = store.getMarkets;
    String ret = "";
    markets.asMap().forEach((key, value) {
      if (value.id == marketId) {
        ret = "${value.name}, ${value.address}";
      }
    });
    return ret;
  }

  String getNameOfMarket(marketId) {
    List<Market> markets = store.getMarkets;
    String ret = "";
    markets.asMap().forEach((key, value) {
      if (value.id == marketId) {
        ret = value.name;
      }
    });
    return ret;
  }

  String getAddressOfMarket(marketId) {
    List<Market> markets = store.getMarkets;
    String ret = "";
    markets.asMap().forEach((key, value) {
      if (value.id == marketId) {
        ret = value.address;
      }
    });
    return ret;
  }

  int getDistanceToMarket(marketId) {
    int ret = 0;

    List<Market> markets = store.getMarkets;

    markets.asMap().forEach((key, value) {
      if (value.id == marketId) {
        ret = value.distance;
      }
    });

    return ret;
  }

  Future<List<Good>> getGoodsWithQuery(
      query, price, dist, godendo, fastCat) async {
    List<Good> list = store.getGoods;
    List<Good> goods = [];

    if (query.isNotEmpty) {
      list.asMap().forEach((key, value) {
        if (value.name.toLowerCase().contains(query.toLowerCase())) {
          goods.add(value);
        }
      });
    } else {
      goods = list;
    }

    if (price != 1) {
      if (price == 0) {
        goods.sort((a, b) => a.price.compareTo(b.price));
      } else {
        goods.sort((a, b) => b.price.compareTo(a.price));
      }
    }

    if (dist != 1) {
      if (dist == 0) {
        goods.sort((a, b) => a.distance.compareTo(b.distance));
      } else {
        goods.sort((a, b) => b.distance.compareTo(a.distance));
      }
    }

    if (godendo != 1) {}

    if (fastCat != 0) {
      List<Good> goodsWithCats = [];
      switch (fastCat) {
        case 1:
          list.asMap().forEach((key, value) {
            if (value.catId == 14 ||
                value.catId == 15 ||
                value.catId == 16 ||
                value.catId == 27 ||
                value.catId == 48 ||
                value.catId == 49) {
              goodsWithCats.add(value);
            }
          });
          return goodsWithCats;
        case 2:
          list.asMap().forEach((key, value) {
            if (value.catId == 19) {
              goodsWithCats.add(value);
            }
          });
          return goodsWithCats;

        case 3:
          list.asMap().forEach((key, value) {
            if (value.catId == 24) {
              goodsWithCats.add(value);
            }
          });
          return goodsWithCats;
        case 4:
          list.asMap().forEach((key, value) {
            if (value.catId == 42 ||
                value.catId == 28 ||
                value.catId == 20 ||
                value.catId == 9 ||
                value.catId == 7 ||
                value.catId == 2) {
              goodsWithCats.add(value);
            }
          });
          return goodsWithCats;
      }
      goods = goodsWithCats;
    }

    return goods;
  }

  Future<List<Good>> getGoods() async {
    List<Good> goodsList = [];
    int dist;
    if (store.getGoods.isEmpty) {
      String str = await _loadData();
      final allRes = welcomeFromJson(str);

      allRes.catalog.asMap().forEach((i, v) {
        v.subcat?.asMap().forEach((k, value) {
          value.goods.asMap().forEach((key, val) {
            dist = getDistanceToMarket(val.shopId);
            val.distance = dist;
            goodsList.add(val);
          });
        });
      });
      store.setGoods(goodsList);
    } else {
      goodsList = store.getGoods;
    }
    return goodsList;
  }
}
