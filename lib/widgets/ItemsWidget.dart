import 'package:demo_app/main.dart';
import 'package:demo_app/tools/databasehelper.dart';
import 'package:demo_app/widgets/goodWidget.dart';
import 'package:demo_app/widgets/productDataModel.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'dart:async';
import 'dart:convert';
import 'package:sqflite/sqflite.dart';
import 'package:demo_app/tools/databasehelper.dart';
import 'package:provider/provider.dart';
import 'package:demo_app/store/store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_widget/mobx_widget.dart';
import '../models/catalog.dart';

class ItemsWidget extends StatefulWidget {
  @override
  State<ItemsWidget> createState() => _ItemsWidgetState();
}

class _ItemsWidgetState extends State<ItemsWidget> {
  final store = CatalogViewStore();
  @override
  void initState() {
    store.getObsMarkets().then((value) {
      store.getObsGoods();
    });
    // store.getObsMarkets();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _catpage = Provider.of<CatalogViewStore>(context);
    return Container(
      // child: Observer(
      //   builder: (_) => FutureBuilder<List<Good>>(
      //       future: _catpage.isSearching
      //           ? _catpage.obsGoodsSearchResult
      //           : _catpage.obsGoods,
      //       builder:
      //           (BuildContext context, AsyncSnapshot<List<Good>> snapshot) {
      //         if (!snapshot.hasData) {
      //           return const Center(
      //             child: CircularProgressIndicator(),
      //           );
      //         }
      //         var items = snapshot.data as List<Good>;
      //         return snapshot.data!.isEmpty
      //             ? Center(child: Text('Нет данных'))
      //             : GridView.builder(
      //                 itemCount: items == [] ? 0 : items.length,
      //                 physics: NeverScrollableScrollPhysics(),
      //                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //                   crossAxisCount: 2,
      //                   childAspectRatio: (1 / 1.6),
      //                 ),
      //                 shrinkWrap: true,
      //                 itemBuilder: (context, index) {
      //                   return GoodWidget(item: items[index]);
      //                 },
      //               );
      //       }),
      // ),
      child: ObserverFuture<List<Good>, Exception>(
        retry: 3,
        autoInitialize: true,
        fetchData: () {
          _catpage.getObsGoods;
        },
        observableFuture: () => _catpage.isSearching
            ? _catpage.obsGoodsSearchResult
            : store.obsGoods,
        onNull: (_) {
          return Center(
              key: ObserverKeyOnNull,
              child: Text('(on null)',
                  style: TextStyle(color: Colors.white, fontSize: 20)));
        },
        onUnstarted: (_) => Center(
          key: ObserverKeyOnUnstarted,
          child: Text(
            '(unstarted)',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
        onError: (_, error) {
          return Center(
              key: UniqueKey(),
              child: Text(error.toString(),
                  style: TextStyle(color: Colors.white, fontSize: 20)));
        },
        onData: (_, data) {
          var items = data;
          return GridView.builder(
            itemCount: items.length,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: (1 / 1.67),
            ),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return GoodWidget(item: items[index]);
            },
          );
        },
        onPending: (_) => Center(
            key: ObserverKeyOnPending, child: CircularProgressIndicator()),
      ),
    );
  }
}
