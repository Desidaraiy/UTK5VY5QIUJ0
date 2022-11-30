import 'dart:ui';

import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'dart:convert';
import 'package:demo_app/appbars/BackAppBar.dart';
import 'package:demo_app/appbars/CustomAppBar.dart';
import 'package:flutter/material.dart';
import 'package:demo_app/models/catalog.dart';
import 'package:flutter/services.dart';
import 'package:demo_app/tools/databasehelper.dart';
import 'package:provider/provider.dart';
import 'package:demo_app/store/store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:animated_overflow/animated_overflow.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class GoodWidget extends StatefulWidget {
  final Good item;
  GoodWidget({Key? key, required this.item}) : super(key: key);

  @override
  State<GoodWidget> createState() => _GoodWidgetState();
}

class _GoodWidgetState extends State<GoodWidget> {
  int getPercent(bigPrice, price) {
    var a = bigPrice;
    var b = price;
    return (((a - b) / a) * 100).round();
  }

  dynamic _currentProduct = [];

  Widget buildSheet(context) {
    double c_width = MediaQuery.of(context).size.width * 0.8;
    return Container(
      color: Colors.white,
      height: 430,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.green[700],
            ),
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(Icons.place, size: 28, color: Colors.white),
                Spacer(),
                Text(
                    "«${DatabaseHelper.instance.getNameOfMarket(widget.item.shopId)}»",
                    style: TextStyle(fontSize: 18, color: Colors.white)),
                Spacer(),
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    setState(() {
                      _currentProduct = [];
                    });
                  },
                  icon: Icon(Icons.close, size: 28, color: Colors.white),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Stack(
                  children: [
                    widget.item.filename.isEmpty
                        ? Image.network(
                            "https://goden-do.ru/files/placeholder.jpg",
                            height: 180,
                            width: 180)
                        : Image.network(
                            "https://goden-do.ru/files/${widget.item.filename}",
                            height: 180,
                            width: 180),
                    Positioned(
                      top: 0,
                      left: 0,
                      child: Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          "-${getPercent(_currentProduct.priceOld, _currentProduct.price)}%",
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Center(
            child: Text(
              "${_currentProduct.brand}",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Colors.grey.shade800),
            ),
          ),
          Container(
            width: c_width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedOverflow(
                  maxWidth: c_width,
                  animatedOverflowDirection:
                      AnimatedOverflowDirection.HORIZONTAL,
                  child: Text(
                    "${_currentProduct.name}, ${_currentProduct.weight}кг",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.grey.shade800),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  child: Text(
                    "${_currentProduct.priceOld}₽",
                    style: TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade500,
                        decoration: TextDecoration.lineThrough),
                  ),
                ),
                Text(
                  "${_currentProduct.price}₽",
                  style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Colors.green[600]),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 40),
            margin: EdgeInsets.only(bottom: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("Годен до:", style: TextStyle(fontSize: 17)),
                Spacer(),
                Text("${_currentProduct.godendo}",
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                        color: Colors.grey.shade800)),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("Расстояние:", style: TextStyle(fontSize: 17)),
                Spacer(),
                Text(
                    widget.item.distance < 1000
                        ? "${widget.item.distance} м"
                        : "${(widget.item.distance / 1000).round()} км",
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                        color: Colors.grey.shade800)),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 40),
            margin: EdgeInsets.only(bottom: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Адрес:", style: TextStyle(fontSize: 17)),
                AnimatedOverflow(
                  animatedOverflowDirection:
                      AnimatedOverflowDirection.HORIZONTAL,
                  maxWidth: c_width * 0.6,
                  child: Text(
                      DatabaseHelper.instance
                          .getAddressOfMarket(widget.item.shopId),
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                          color: Colors.grey.shade800)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final catpage = Provider.of<CatalogViewStore>(context);
    return Container(
      // padding: EdgeInsets.only(top: 15.sp, right: 15.sp, left: 15.sp),
      padding: EdgeInsets.all(15.sp),
      margin: EdgeInsets.symmetric(vertical: 8.sp, horizontal: 10.sp),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.sp),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.all(8.5.sp),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  "-${getPercent(widget.item.priceOld, widget.item.price)}%",
                  style: TextStyle(
                    fontSize: 3.5.mm,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    widget.item.distance > 0
                        ? const Icon(Icons.near_me,
                            color: Colors.indigo, size: 20)
                        : IconButton(
                            onPressed: () {
                              DatabaseHelper.instance.enablePositionService();
                            },
                            icon: const Icon(
                              size: 20,
                              Icons.near_me_disabled,
                              color: Colors.indigo,
                            ),
                          ),
                    widget.item.distance > 0
                        ? Text(
                            widget.item.distance < 1000
                                ? "${widget.item.distance} м"
                                : "${(widget.item.distance / 1000).round()} км",
                            style: TextStyle(fontSize: 3.5.mm))
                        : Text(""),
                  ],
                ),
              ),
              // Icon(Icons.favorite_border, color: Colors.red),
            ],
          ),
          InkWell(
            onTap: () {
              setState(() {
                _currentProduct = widget.item; // передаю ключ
              });
              showBottomSheet(
                  context: context,
                  enableDrag: true,
                  builder: (context) => buildSheet(context));
            },
            child: Container(
              margin: EdgeInsets.all(15),
              child: widget.item.filename.isEmpty
                  ? Image.network("https://goden-do.ru/files/placeholder.jpg",
                      height: 12.h)
                  : Image.network(
                      "https://goden-do.ru/app/files/${widget.item.filename}",
                      height: 12.h),
            ),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 8),
            alignment: Alignment.centerLeft,
            child: Text(
              "${widget.item.name.toString()}, ${widget.item.weight.toString()}кг",
              maxLines: 3,
              overflow: TextOverflow.fade,
              style: TextStyle(
                fontSize: 4.mm,
                color: Colors.indigo,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              // "${items[index].subtitle.toString()}",
              // "«Слата», Б-р Рябикова, 20Б",
              "${DatabaseHelper.instance.getFullNameOfMarket(widget.item.shopId)}",
              maxLines: 3,
              overflow: TextOverflow.fade,
              style: TextStyle(
                fontSize: 4.mm,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${widget.item.priceOld.toString()} ₽",
                  style: TextStyle(
                      fontSize: 3.5.mm,
                      fontWeight: FontWeight.w700,
                      color: Colors.indigo,
                      decoration: TextDecoration.lineThrough),
                ),
                Text(
                  "${widget.item.price.toString()} ₽",
                  style: TextStyle(
                    fontSize: 4.5.mm,
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
