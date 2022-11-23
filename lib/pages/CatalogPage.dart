import 'package:demo_app/pages/GoodsByCatPage.dart';
import 'package:demo_app/pages/GoodsOfMarket.dart';
import 'package:demo_app/pages/SubCat.dart';
import 'package:demo_app/widgets/Fullcategorieswidget.dart';
import 'package:demo_app/widgets/ItemsWidget.dart';
import 'package:demo_app/widgets/ShopsWidget.dart';
import 'package:flutter/material.dart';
import 'package:demo_app/appbars/CustomAppBar.dart';
import 'package:demo_app/appbars/Catalogappbar.dart';
import 'package:provider/provider.dart';
import 'package:demo_app/store/store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class CatalogPage extends StatefulWidget {
  const CatalogPage({Key? key}) : super(key: key);

  @override
  State<CatalogPage> createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> {
  final screens = [
    ShopsWidget(),
    FullCategoriesWidget(),
    ListView(
      children: [ItemsWidget()],
    ),
    SubCatPage(),
    GoodsByCatPage(),
    const GoodsOfMarket(),
  ];

  // final CatalogViewStore _catpage = CatalogViewStore();

  @override
  Widget build(BuildContext context) {
    final _catpage = Provider.of<CatalogViewStore>(context);
    return Scaffold(
      appBar: CustomAppBar(height: 100, child: CatalogAppBar()),
      body: Container(
        color: Colors.green[50],
        child: Observer(
          builder: (context) => screens[_catpage.cview],
        ),
      ),
    );
  }
}
