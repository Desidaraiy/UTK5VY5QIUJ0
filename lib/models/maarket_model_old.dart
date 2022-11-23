// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

List<Market> marketFromJson(String str) =>
    List<Market>.from(json.decode(str).map((x) => Market.fromJson(x)));

String marketToJson(List<Market> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Market {
  Market({
    required this.id,
    required this.name,
    required this.address,
    required this.logo,
    required this.logoBg,
    required this.time,
    required this.latLong,
    this.distance,
  });

  int id;
  String name;
  String address;
  String logo;
  String logoBg;
  String time;
  String latLong;
  dynamic? distance;

  factory Market.fromJson(Map<String, dynamic> json) => Market(
        id: json["id"],
        name: json["name"],
        address: json["address"],
        logo: json["logo"],
        logoBg: json["logoBg"],
        time: json["time"],
        latLong: json["lat_long"],
        distance: json["distance"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "address": address,
        "logo": logo,
        "logoBg": logoBg,
        "time": time,
        "lat_long": latLong,
        "distance": distance,
      };
}
