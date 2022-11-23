// To parse this JSON data, do
//
//     final market = marketFromJson(jsonString);

import 'dart:convert';

MarketResponse marketResponseFromJson(String str) =>
    MarketResponse.fromJson(json.decode(str));

String marketResponseToJson(Market data) => json.encode(data.toJson());

class MarketResponse {
  MarketResponse({
    required this.message,
    required this.shops,
  });

  String message;
  List<Market> shops;

  factory MarketResponse.fromJson(Map<String, dynamic> json) => MarketResponse(
        message: json["message"],
        shops: List<Market>.from(json["shops"].map((x) => Market.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "shops": List<dynamic>.from(shops.map((x) => x.toJson())),
      };
}

class Market {
  Market({
    required this.id,
    required this.ownerId,
    required this.name,
    required this.address,
    required this.orgId,
    this.logo,
    this.rgb,
    required this.lat,
    required this.lon,
    required this.description,
    required this.active,
    this.distance,
  });

  int id;
  int ownerId;
  String name;
  String address;
  int orgId;
  String? logo;
  String? rgb;
  String? lat;
  String? lon;
  String description;
  int active;
  dynamic? distance;

  factory Market.fromJson(Map<String, dynamic> json) => Market(
        id: json["id"],
        ownerId: json["owner_id"],
        name: json["name"],
        address: json["address"],
        orgId: json["org_id"],
        logo: json["logo"],
        rgb: json["rgb"],
        lat: json["lat"],
        lon: json["lon"],
        description: json["description"],
        active: json["active"],
        distance: json["distance"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "owner_id": ownerId,
        "name": name,
        "address": address,
        "org_id": orgId,
        "logo": logo,
        "rgb": rgb,
        "lat": lat,
        "lon": lon,
        "description": description,
        "active": active,
        "distance": distance,
      };
}
