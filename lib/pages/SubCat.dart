import 'package:demo_app/appbars/BackAppBar.dart';
import 'package:demo_app/appbars/CustomAppBar.dart';
import 'package:demo_app/models/catalog.dart';
import 'package:demo_app/tools/databasehelper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:demo_app/store/store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class SubCatPage extends StatefulWidget {
  const SubCatPage({Key? key}) : super(key: key);

  @override
  State<SubCatPage> createState() => _SubCatPageState();
}

class _SubCatPageState extends State<SubCatPage> {
  @override
  Widget build(BuildContext context) {
    final _catpage = Provider.of<CatalogViewStore>(context);
    return FutureBuilder<List<Subcat>>(
        future: DatabaseHelper.instance.getSubCategories(_catpage.catId),
        builder: (context, snap) {
          if (snap.hasError) {
            return Center(child: Text("Ошибка"));
          } else if (snap.hasData) {
            var items = snap.data as List<Subcat>;
            return Container(
                child: ListView.builder(
              itemCount: items == null ? 0 : items.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.green.shade100,
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: Row(
                    children: [
                      Text(
                        items[index].name,
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black87,
                        ),
                      ),
                      Spacer(),
                      TextButton(
                        onPressed: () {
                          _catpage.changeInd(4);
                          _catpage.changeSubCat(items[index].id);
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.green[50],
                          shape: CircleBorder(),
                        ),
                        child: Icon(
                          Icons.keyboard_arrow_right,
                          size: 32,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ));
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
