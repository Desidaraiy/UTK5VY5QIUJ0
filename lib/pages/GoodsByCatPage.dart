import 'package:demo_app/appbars/BackAppBar.dart';
import 'package:demo_app/appbars/CustomAppBar.dart';
import 'package:demo_app/models/catalog.dart';
import 'package:demo_app/tools/databasehelper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:demo_app/store/store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:demo_app/widgets/goodWidget.dart';
import 'package:demo_app/widgets/goodsGridWidget.dart';

class GoodsByCatPage extends StatefulWidget {
  const GoodsByCatPage({Key? key}) : super(key: key);

  @override
  State<GoodsByCatPage> createState() => _GoodsByCatPage();
}

class _GoodsByCatPage extends State<GoodsByCatPage> {
  int getPercent(bigPrice, price) {
    var a = bigPrice;
    var b = price;
    return (((a - b) / a) * 100).round();
  }

  dynamic _currentProduct = [];

  @override
  Widget build(BuildContext context) {
    final _catpage = Provider.of<CatalogViewStore>(context);
    return Container(
      child: FutureBuilder<List<Good>>(
          future: DatabaseHelper.instance
              .getGoodsById(_catpage.catId, _catpage.subCatId),
          builder: (BuildContext context, AsyncSnapshot<List<Good>> snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            var items = snapshot.data as List<Good>;
            return snapshot.data!.isEmpty
                ? Center(child: Text('Нет данных'))
                : GoodsGrid(items: items, neverScrollable: false);
          }),
    );
  }
}
