import 'dart:convert';
// import 'package:demo_app/models/marketModel.dart';
import 'package:demo_app/models/shopModel.dart';
import 'package:demo_app/tools/databasehelper.dart';
import 'package:demo_app/widgets/marketWidget.dart';
import 'package:http/http.dart' as http;
import 'package:demo_app/widgets/shopModel.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:demo_app/store/store.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_widget/mobx_widget.dart';

class ShopsWidget extends StatefulWidget {
  @override
  State<ShopsWidget> createState() => _ShopsWidgetState();
}

class _ShopsWidgetState extends State<ShopsWidget> {
  final store = CatalogViewStore();
  // @override
  // void initState() {
  //   store.getObsMarkets();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    final _catpage = Provider.of<CatalogViewStore>(context);

    return Container(
      // v1
      // child: Observer(
      //   builder: (_) => FutureBuilder<List<Market>>(
      //       future: _catpage.obsMarkets,
      //       builder: (BuildContext context, AsyncSnapshot<List<Market>> snap) {
      //         if (!snap.hasData) {
      //           return const Center(
      //             child: CircularProgressIndicator(),
      //           );
      //         }
      //         var items = snap.data as List<Market>;
      //         return Container(
      //             child: ListView.builder(
      //           itemCount: items.length,
      //           itemBuilder: (context, index) {
      //             return MarketWidget(item: items[index]);
      //           },
      //         ));
      //       }),
      // ),

      //v2
      child: Observer(
        builder: (_) => FutureBuilder<List<Market>>(
            future: DatabaseHelper.instance.checkMarkets(),
            builder: (BuildContext context, AsyncSnapshot<List<Market>> snap) {
              if (!snap.hasData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              var items = snap.data as List<Market>;
              return Container(
                  child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return MarketWidget(item: items[index]);
                },
              ));
            }),
      ),

      //v3
      // child: ObserverFuture<List<Market>, Exception>(
      //   retry: 3,
      //   listen: (observableFuture) {
      //     print("shops. ${observableFuture?.status}");
      //   },
      //   fetchData: () {
      //     _catpage.getObsMarkets;
      //   },
      //   observableFuture: () => _catpage.obsMarkets,
      //   onNull: (_) {
      //     return Center(
      //         key: ObserverKeyOnNull,
      //         child: Text('(on null)',
      //             style: TextStyle(color: Colors.white, fontSize: 20)));
      //   },
      //   onUnstarted: (_) => Center(
      //     key: ObserverKeyOnUnstarted,
      //     child: Text(
      //       '(unstarted)',
      //       style: TextStyle(color: Colors.white, fontSize: 20),
      //     ),
      //   ),
      //   onError: (_, error) {
      //     return Center(
      //         key: UniqueKey(),
      //         child: Text(error.toString(),
      //             style: TextStyle(color: Colors.white, fontSize: 20)));
      //   },
      //   onData: (_, data) {
      //     var items = data;

      //     return Container(
      //         child: ListView.builder(
      //       itemCount: items.length,
      //       itemBuilder: (context, index) {
      //         return MarketWidget(item: items[index]);
      //       },
      //     ));
      //   },
      //   onPending: (_) => Center(
      //       key: ObserverKeyOnPending, child: CircularProgressIndicator()),
      // ),
    );
  }
}
