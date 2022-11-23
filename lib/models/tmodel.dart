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
    required this.name,
    required this.subcategories,
  });

  int id;
  String name;
  List<Subcategory> subcategories;

  factory Catalog.fromJson(Map<String, dynamic> json) => Catalog(
        id: json["id"],
        name: json["name"],
        subcategories: List<Subcategory>.from(
            json["subcategories"].map((x) => Subcategory.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "subcategories":
            List<dynamic>.from(subcategories.map((x) => x.toJson())),
      };
}

class Subcategory {
  Subcategory({
    required this.id,
    required this.name,
    required this.goods,
  });

  int id;
  String name;
  List<Good> goods;

  factory Subcategory.fromJson(Map<String, dynamic> json) => Subcategory(
        id: json["id"],
        name: json["name"],
        goods: List<Good>.from(json["goods"].map((x) => Good.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "goods": List<dynamic>.from(goods.map((x) => x.toJson())),
      };
}

class Good {
  Good({
    required this.id,
    required this.name,
  });

  int id;
  String name;

  factory Good.fromJson(Map<String, dynamic> json) => Good(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
