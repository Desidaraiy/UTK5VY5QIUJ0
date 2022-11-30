import 'package:demo_app/widgets/goodWidget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:demo_app/store/store.dart';
import 'package:mobx_widget/mobx_widget.dart';
import '../models/catalog.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class GoodsGrid extends StatefulWidget {
  final List<Good> items;
  final bool neverScrollable;
  const GoodsGrid(
      {super.key, required this.items, required this.neverScrollable});

  @override
  State<GoodsGrid> createState() => _GoodsGridState();
}

class _GoodsGridState extends State<GoodsGrid> {
  @override
  Widget build(BuildContext context) {
    return MasonryGridView.count(
      itemCount: widget.items.length,
      physics: widget.neverScrollable ? NeverScrollableScrollPhysics() : null,
      crossAxisCount: 2,
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return GoodWidget(item: widget.items[index]);
      },
    );
  }
}
