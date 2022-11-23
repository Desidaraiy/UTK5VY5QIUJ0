import 'package:flutter/material.dart';
import 'package:demo_app/tools/databasehelper.dart';
import 'package:provider/provider.dart';
import 'package:demo_app/store/store.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class CategoriesWidget extends StatefulWidget {
  @override
  State<CategoriesWidget> createState() => _CategoriesWidgetState();
}

class _CategoriesWidgetState extends State<CategoriesWidget> {
  @override
  Widget build(BuildContext context) {
    final _catpage = Provider.of<CatalogViewStore>(context);

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (int i = 1; i < 5; i++)
            Observer(builder: (_) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 13, vertical: 15),
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        setState(() {
                          if (i == _catpage.currentCategoryFilter) {
                            _catpage.changeIsSearching(false);
                            _catpage.setCurrentCategoryFilterIndex(0);
                          } else {
                            _catpage.changeIsSearching(true);
                            _catpage.setCurrentCategoryFilterIndex(i);
                            _catpage.getObsGoodsWithQuery();
                          }
                        });
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.green[300],
                        shape: CircleBorder(
                            side: i == _catpage.currentCategoryFilter
                                ? BorderSide(
                                    color: Colors.yellow.shade900, width: 2)
                                : BorderSide()),
                      ),
                      child: Image.asset(
                        "assets/icns/${i}.png",
                        fit: BoxFit.contain,
                        width: 52,
                      ),
                    ),
                  ],
                ),
              );
            }
                // child:
                // Container(
                //   margin: EdgeInsets.symmetric(horizontal: 13, vertical: 15),
                //   padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                //   child: Row(
                //     crossAxisAlignment: CrossAxisAlignment.center,
                //     children: [
                //       TextButton(
                //         onPressed: () {
                //           setState(() {
                //             if (i == _catpage.currentCategoryFilter) {
                //               _catpage.changeIsSearching(false);
                //               _catpage.setCurrentCategoryFilterIndex(0);
                //             } else {
                //               _catpage.changeIsSearching(true);
                //               _catpage.setCurrentCategoryFilterIndex(i);
                //               _catpage.getObsGoodsWithQuery();
                //             }
                //           });
                //         },
                //         style: TextButton.styleFrom(
                //           backgroundColor: Colors.green[300],
                //           shape: CircleBorder(),
                //         ),
                //         child: Image.asset(
                //           "assets/icns/${i}.png",
                //           fit: BoxFit.contain,
                //           width: 52,
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                ),
        ],
      ),
    );
  }
}
