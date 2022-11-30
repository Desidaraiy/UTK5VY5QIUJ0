import 'package:demo_app/widgets/goodWidget.dart';
import 'package:demo_app/widgets/goodsGridWidget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:demo_app/store/store.dart';
import 'package:mobx_widget/mobx_widget.dart';
import '../models/catalog.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _catpage = Provider.of<CatalogViewStore>(context);
    return Container(
      child: ObserverFuture<List<Good>, Exception>(
        retry: 3,
        autoInitialize: true,
        fetchData: () {
          _catpage.getObsGoods();
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
          return GoodsGrid(
            items: items,
            neverScrollable: true,
          );
        },
        onPending: (_) => Center(
            key: ObserverKeyOnPending, child: CircularProgressIndicator()),
      ),
    );
  }
}
