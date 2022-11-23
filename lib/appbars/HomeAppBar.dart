import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:provider/provider.dart';
import 'package:demo_app/store/store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class HomeAppBar extends StatefulWidget {
  @override
  State<HomeAppBar> createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar> {
  // final store = CatalogViewStore();

  int dropdown1value = 1;
  var items1 = ["Дешевле", "По умолч.", "Дороже"];
  int dropdown2value = 1;
  var items2 = ["Ближе", "По умолч.", "Дальше"];
  int dropdown4value = 1;
  var items4 = ["Больше", "По умолч.", "Меньше"];

  bool _folded = true;

  final searchController = TextEditingController();

  Widget _child = Container(
    margin: EdgeInsets.only(bottom: 5),
    child: Text(
      "ГоденДо",
      style: TextStyle(
          fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
    ),
  );

  Widget buildSheet(context) {
    final _catpagea = Provider.of<CatalogViewStore>(context);
    return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
        child: Container(
          color: Colors.white,
          height: 320,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    border:
                        Border(top: BorderSide(color: Colors.grey.shade400))),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 12),
                      child: Text("Фильтр",
                          style: TextStyle(
                            fontSize: 18,
                          )),
                    ),
                    Spacer(),
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(Icons.close, size: 28, color: Colors.black),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Column(
                  children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          Text(
                            "Цена",
                            style: TextStyle(
                              fontSize: 21,
                              color: Colors.black87,
                            ),
                          ),
                          Spacer(),
                          Observer(builder: (_) {
                            return DropdownButton(
                              value: items1[_catpagea.currentPriceFilter],
                              icon: const Icon(Icons.keyboard_arrow_down,
                                  color: Colors.black87),
                              items: items1.map((String items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: Text(
                                    items,
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.black54),
                                  ),
                                );
                              }).toList(),
                              onChanged: (dynamic newValue) {
                                setState(() {
                                  dropdown1value = items1.indexOf(newValue);
                                  var ind = items1.indexOf(newValue);
                                  _catpagea.setCurrentPriceFilter(ind);
                                  if (ind != 1) {
                                    if (_catpagea.searchQuery.isEmpty) {
                                      _catpagea.changeIsSearching(true);
                                      _catpagea.getObsGoodsWithQuery();
                                    }
                                  } else {
                                    if (_catpagea.searchQuery.isEmpty) {
                                      _catpagea.changeIsSearching(false);
                                      _catpagea.clearSearchResults();
                                    }
                                  }
                                });
                              },
                            );
                          }),
                        ],
                      ),
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          Text(
                            "Расстояние",
                            style: TextStyle(
                              fontSize: 21,
                              color: Colors.black87,
                            ),
                          ),
                          Spacer(),
                          Observer(builder: (_) {
                            return DropdownButton(
                              value: items2[_catpagea.currentDistanceFilter],
                              icon: const Icon(Icons.keyboard_arrow_down,
                                  color: Colors.black87),
                              items: items2.map((String items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: Text(
                                    items,
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.black54),
                                  ),
                                );
                              }).toList(),
                              onChanged: (dynamic newValue) {
                                setState(() {
                                  dropdown1value = items2.indexOf(newValue);
                                  var ind = items2.indexOf(newValue);
                                  _catpagea.setCurrentDistanceFilter(ind);
                                  if (ind != 1) {
                                    if (_catpagea.searchQuery.isEmpty) {
                                      _catpagea.changeIsSearching(true);
                                      _catpagea.getObsGoodsWithQuery();
                                    }
                                  } else {
                                    if (_catpagea.searchQuery.isEmpty) {
                                      _catpagea.changeIsSearching(false);
                                      _catpagea.clearSearchResults();
                                    }
                                  }
                                });
                              },
                            );
                          }),
                        ],
                      ),
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          Text(
                            "Срок годности",
                            style: TextStyle(
                              fontSize: 21,
                              color: Colors.black87,
                            ),
                          ),
                          Spacer(),
                          DropdownButton(
                            // dropdownColor: Colors.green[300],
                            value: items4[dropdown4value],
                            icon: const Icon(Icons.keyboard_arrow_down,
                                color: Colors.black87),
                            items: items4.map((String items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Text(
                                  items,
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.black54),
                                ),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdown4value = items4.indexOf(newValue!);
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    final _catpage = Provider.of<CatalogViewStore>(context);
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.green[700],
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            width: _folded ? 100 : 220,
            margin: _folded
                ? EdgeInsets.only(top: 25)
                : EdgeInsets.only(top: 14, left: 8),
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 100),
              child: _child,
            ),
          ),
          const Spacer(),
          Container(
            margin: const EdgeInsets.only(
              top: 18,
              left: 5,
            ),
            child: IconButton(
              onPressed: () {
                setState(() {
                  _folded = !_folded;
                  _catpage.setCurrentCategoryFilterIndex(0);
                  _catpage.setCurrentDistanceFilter(1);
                  _catpage.setCurrentPriceFilter(1);
                  switch (_folded) {
                    case true:
                      searchController.text = '';
                      _catpage.changeSearchQuery('');
                      _catpage.changeIsSearching(false);
                      _catpage.clearSearchResults();
                      _child = Text(
                        "ГоденДо",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      );
                      break;
                    case false:
                      _catpage.changeIsSearching(true);
                      _catpage.getObsGoodsWithQuery();
                      _child = TextField(
                        controller: searchController,
                        onChanged: (e) {
                          setState(() {
                            _catpage.changeSearchQuery(searchController.text);
                            _catpage.getObsGoodsWithQuery();
                          });
                        },
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                        decoration: InputDecoration(
                          hintText: "Поиск...",
                          border: InputBorder.none,
                          hintStyle: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      );

                      break;
                  }
                });
              },
              icon: Icon(
                _folded ? Icons.search : Icons.close,
                color: Colors.white,
                size: 30,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: 18,
              left: 25,
            ),
            child: IconButton(
              onPressed: () {
                showBottomSheet(
                    context: context,
                    enableDrag: true,
                    builder: (context) => buildSheet(context));
              },
              icon: Icon(
                Icons.filter_alt_sharp,
                color: Colors.white,
                size: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
