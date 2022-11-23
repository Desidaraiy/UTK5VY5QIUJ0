import 'package:demo_app/appbars/BackAppBar.dart';
import 'package:demo_app/appbars/CustomAppBar.dart';
import 'package:demo_app/models/catalog.dart';
import 'package:demo_app/tools/databasehelper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:demo_app/store/store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:demo_app/widgets/goodWidget.dart';
import 'package:sqflite/sqflite.dart';

class GoodsOfMarket extends StatefulWidget {
  const GoodsOfMarket({Key? key}) : super(key: key);

  @override
  State<GoodsOfMarket> createState() => _GoodsByCatPageState();
}

class _GoodsByCatPageState extends State<GoodsOfMarket> {
  int getPercent(bigPrice, price) {
    var a = bigPrice;
    var b = price;
    return (((a - b) / a) * 100).round();
  }

  dynamic _currentProduct = [];

  @override
  Widget build(BuildContext context) {
    final _catpage = Provider.of<CatalogViewStore>(context);
    return ListView(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.green[400],
          ),
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _catpage.changeInd(0);
                      });
                    },
                    iconSize: 34,
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "Назад",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ],
              ),
              Observer(builder: (_) {
                return Text(
                  _catpage.currentShopName,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                );
              }),
            ],
          ),
        ),
        Container(
          child: FutureBuilder<List<Good>>(
              future: DatabaseHelper.instance
                  .getGoodsOfMarket(_catpage.currentShop),
              builder:
                  (BuildContext context, AsyncSnapshot<List<Good>> snapshot) {
                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                var items = snapshot.data as List<Good>;
                return snapshot.data!.isEmpty
                    ? Center(child: Text('Нет данных'))
                    : GridView.builder(
                        itemCount: items == [] ? 0 : items.length,
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
              }),
        ),
      ],
    );
  }
}
