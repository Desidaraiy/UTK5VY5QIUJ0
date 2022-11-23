import 'package:flutter/material.dart';

class ShopModel {
  String? name;
  String? address;
  String? logo;
  dynamic? logoBg;
  String? time;

  ShopModel({this.name, this.address, this.logo, this.logoBg, this.time});

  factory ShopModel.fromJson(Map<String, dynamic> json) {
    return ShopModel(
      name: json['name'] as String,
      address: json['address'] as String,
      logo: json['logo'] as String,
      logoBg: json['logoBg'] as String,
      time: json['time'] as String,
    );
  }
}
