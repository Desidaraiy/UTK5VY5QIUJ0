import 'package:flutter/material.dart';
import 'package:demo_app/store/store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class CatalogAppBar extends StatefulWidget {
  @override
  State<CatalogAppBar> createState() => _CatalogAppBarState();
}

class _CatalogAppBarState extends State<CatalogAppBar> {
  int dropdownvalue = 0;
  var items = ['Магазины', 'Категории', 'Ближайшее'];
  @override
  Widget build(BuildContext context) {
    final _catpage = Provider.of<CatalogViewStore>(context);
    return Container(
      padding: EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: Colors.green[700],
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 5),
            child: Text(
              "Каталог",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Spacer(),
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Observer(
              builder: (context) {
                return DropdownButton(
                  dropdownColor: Colors.green[300],
                  value: (_catpage.cview > 2)
                      ? "Категории"
                      : items[_catpage.cview],
                  underline: Container(height: 0, color: Colors.transparent),
                  icon: const Icon(Icons.keyboard_arrow_down,
                      color: Colors.white),
                  items: items.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(
                        items,
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    _catpage.changeInd(items.indexOf(newValue!));
                    // setState(() {
                    //   dropdownvalue = items.indexOf(newValue);
                    // });
                  },
                );
              },
            ),
          ),
          Spacer(),
          Container(
            margin: EdgeInsets.only(bottom: 5),
            child: Text(
              "ГоденДо",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
