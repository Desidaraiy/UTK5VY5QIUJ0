// import 'package:demo_app/models/maarket_model_old.dart';
import 'package:demo_app/models/shopModel.dart';
import 'package:demo_app/tools/databasehelper.dart';

import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:demo_app/store/store.dart';
import 'package:flutter/material.dart';
import 'package:animated_overflow/animated_overflow.dart';
import 'package:moment_dart/moment_dart.dart';
import 'package:sqflite/sqflite.dart';

class MarketWidget extends StatefulWidget {
  final Market item;
  MarketWidget({Key? key, required this.item}) : super(key: key);
  @override
  State<MarketWidget> createState() => _MarketWidgetState();
}

class _MarketWidgetState extends State<MarketWidget> {
  @override
  Widget build(BuildContext context) {
    double c_width = MediaQuery.of(context).size.width * 0.8;
    final _catpage = Provider.of<CatalogViewStore>(context);
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(
                195,
                int.parse(widget.item.rgb!.split(",")[0]),
                int.parse(widget.item.rgb!.split(",")[1]),
                int.parse(widget.item.rgb!.split(",")[2])),
            spreadRadius: 1,
            blurRadius: 4,
          ),
          BoxShadow(
            color: Color.fromARGB(
                195,
                int.parse(widget.item.rgb!.split(",")[0]),
                int.parse(widget.item.rgb!.split(",")[1]),
                int.parse(widget.item.rgb!.split(",")[2])),
            spreadRadius: -1,
            blurRadius: 2,
          )
        ],
        color: Colors.white,
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 5, left: 22, right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: widget.item.logo == null ||
                              widget.item.logo!.isEmpty
                          ? Image.network(
                              "https://goden-do.ru/files/placeholder.jpg",
                              height: 120)
                          : Image.network(
                              "https://goden-do.ru/app/files/${widget.item.logo}",
                              height: 120),
                    ),
                  ],
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            child: Icon(
                              Icons.store,
                              color: Colors.green[500],
                              size: 35,
                            ),
                          ),
                          AnimatedOverflow(
                            animatedOverflowDirection:
                                AnimatedOverflowDirection.HORIZONTAL,
                            maxWidth: c_width * 0.3,
                            child: Text(
                              "«${widget.item.name}»",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            child: Icon(
                              DatabaseHelper.instance
                                      .getStatusOfmarket(widget.item.id)
                                  ? Icons.check
                                  : Icons.close,
                              color: DatabaseHelper.instance
                                      .getStatusOfmarket(widget.item.id)
                                  ? Colors.green[500]
                                  : Colors.deepOrange[400],
                              size: 35,
                            ),
                          ),
                          Text(
                            DatabaseHelper.instance
                                    .getStatusOfmarket(widget.item.id)
                                ? "Открыто"
                                : "Закрыто",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                      widget.item.distance != 0
                          ? Row(
                              children: [
                                Container(
                                  child: Icon(
                                    Icons.near_me_rounded,
                                    color: Colors.green[500],
                                    size: 35,
                                  ),
                                ),
                                Text(
                                  widget.item.distance < 1000
                                      ? "${widget.item.distance} м"
                                      : "${(widget.item.distance / 1000).round()} км",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            )
                          : Container(
                              child: IconButton(
                                onPressed: null,
                                icon: Icon(
                                  Icons.near_me_disabled,
                                  color: Colors.green[500],
                                  size: 35,
                                ),
                              ),
                            ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 5, left: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      color: Colors.deepOrange[400],
                      size: 30,
                    ),
                    AnimatedOverflow(
                      animatedOverflowDirection:
                          AnimatedOverflowDirection.HORIZONTAL,
                      maxWidth: c_width * 0.6,
                      child: Text(
                        "${widget.item.address}",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                TextButton(
                  onPressed: () {
                    _catpage.changeInd(5);
                    _catpage.setCurrentShop(widget.item.id, widget.item.name);
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.green[50],
                    shape: CircleBorder(),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.keyboard_arrow_right,
                        size: 35,
                        color: Colors.black87,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );

    // v1 shopwidget
    // return Container(
    //   margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
    //   padding: EdgeInsets.symmetric(vertical: 22),
    //   decoration: BoxDecoration(
    //     borderRadius: BorderRadius.circular(10),
    //     gradient: LinearGradient(
    //         begin: Alignment.topLeft,
    //         end: Alignment.bottomRight,
    //         colors: [
    //           Colors.white,
    //           Color.fromARGB(
    //               195,
    //               int.parse(widget.item.logoBg.split(", ")[0]),
    //               int.parse(widget.item.logoBg.split(", ")[1]),
    //               int.parse(widget.item.logoBg.split(", ")[2]))
    //         ]),
    //   ),
    //   child: Row(
    //     mainAxisAlignment: MainAxisAlignment.spaceAround,
    //     children: [
    //       Container(
    //         padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
    //         child: Column(
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           children: [
    //             Text(
    //               "${widget.item.name}",
    //               style: TextStyle(
    //                   fontSize: 24,
    //                   fontWeight: FontWeight.bold,
    //                   color: Colors.grey[900]),
    //             ),
    //             Text("${widget.item.address}"),
    //             Text("${widget.item.time}"),
    //           ],
    //         ),
    //       ),
    //       Container(
    //         margin: EdgeInsets.only(right: 25),
    //         child: Image.network(
    //           "${widget.item.logo}",
    //           height: 100,
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }
}
