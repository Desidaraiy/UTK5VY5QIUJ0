import 'package:flutter/material.dart';

class ProductDataModel {
  String? title;
  String? subtitle;
  String? mediaImage;
  String? bigPrice;
  String? price;
  String? distance;

  ProductDataModel(
      {this.title,
      this.subtitle,
      this.mediaImage,
      this.bigPrice,
      this.price,
      this.distance});

  factory ProductDataModel.fromJson(Map<String, dynamic> json) {
    return ProductDataModel(
      title: json['title'] as String,
      subtitle: json['subtitle'] as String,
      mediaImage: json['media_image'] as String,
      bigPrice: json['big_price'] as String,
      price: json['price'] as String,
      distance: json['distance'] as String,
    );
  }
}
