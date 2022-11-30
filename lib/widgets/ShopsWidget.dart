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
  @override
  Widget build(BuildContext context) {
    final _catpage = Provider.of<CatalogViewStore>(context);
    return Container(
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
    );
  }
}
