// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  Welcome({
    required this.message,
    required this.catalog,
  });

  String message;
  List<Catalog> catalog;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        message: json["message"],
        catalog:
            List<Catalog>.from(json["catalog"].map((x) => Catalog.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "catalog": List<dynamic>.from(catalog.map((x) => x.toJson())),
      };
}

class Catalog {
  Catalog({
    required this.id,
    required this.ownerId,
    required this.name,
    required this.position,
    required this.active,
    required this.subcat,
    this.goods,
  });

  int id;
  int ownerId;
  String name;
  int position;
  int active;
  List<Subcat>? subcat;
  List<Good>? goods;

  factory Catalog.fromJson(Map<String, dynamic> json) => Catalog(
      id: json["id"],
      ownerId: json["owner_id"],
      name: json["name"],
      position: json["position"],
      active: json["active"],
      subcat: json['subcat'] == null
          ? null
          : List<Subcat>.from(json["subcat"].map((x) => Subcat.fromJson(x))),
      goods: json["goods"] == null
          ? null
          : List<Good>.from(json["goods"].map((x) => Good.fromJson(x))));

  Map<String, dynamic> toJson() => {
        "id": id,
        "owner_id": ownerId,
        "name": name,
        "position": position,
        "active": active,
        "subcat": subcat == null
            ? null
            : List<dynamic>.from(subcat!.map((x) => x.toJson())),
        "goods": goods == null
            ? null
            : List<dynamic>.from(goods!.map((x) => x.toJson())),
      };
}

class Subcat {
  Subcat({
    required this.id,
    required this.ownerId,
    required this.name,
    required this.position,
    required this.active,
    required this.goods,
  });

  int id;
  int ownerId;
  String name;
  int position;
  int active;
  List<Good> goods;

  factory Subcat.fromJson(Map<String, dynamic> json) => Subcat(
        id: json["id"],
        ownerId: json["owner_id"],
        name: json["name"],
        position: json["position"],
        active: json["active"],
        goods: List<Good>.from(json["goods"].map((x) => Good.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "owner_id": ownerId,
        "name": name,
        "position": position,
        "active": active,
        "goods": List<dynamic>.from(goods.map((x) => x.toJson())),
      };
}

class Good {
  Good(
      {required this.id,
      required this.shopId,
      required this.catId,
      required this.name,
      required this.brand,
      required this.weight,
      required this.priceOld,
      required this.price,
      required this.active,
      required this.godendo,
      required this.filename,
      this.distance});

  int id;
  int shopId;
  int catId;
  String name;
  String brand;
  double weight;
  int priceOld;
  int price;
  int active;
  String godendo;
  String filename;
  dynamic? distance;

  factory Good.fromJson(Map<String, dynamic> json) => Good(
      id: json["id"],
      shopId: json["shop_id"],
      catId: json["cat_id"],
      name: json["name"],
      brand: json["brand"],
      weight: json["weight"].toDouble(),
      priceOld: json["price_old"],
      price: json["price"],
      active: json["active"],
      godendo: json['godendo'],
      filename: json['filename'],
      distance: json['distance']);

  Map<String, dynamic> toJson() => {
        "id": id,
        "shop_id": shopId,
        "cat_id": catId,
        "name": name,
        "brand": brand,
        "weight": weight,
        "price_old": priceOld,
        "price": price,
        "active": active,
        "godendo": godendo,
        "filename": filename,
        "distance": distance,
      };
}
