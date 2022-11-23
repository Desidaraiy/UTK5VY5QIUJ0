import 'package:demo_app/main.dart';
import 'package:demo_app/store/store.dart';
import 'package:flutter/material.dart';
import 'package:demo_app/appbars/CustomAppBar.dart';
import 'package:demo_app/appbars/HomeAppBar.dart';
import 'package:demo_app/widgets/ItemsWidget.dart';
import 'package:demo_app/widgets/CategoriesWidget.dart';
// import 'package:geolocator/geolocator.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          height: 100,
          child: HomeAppBar(),
        ),
        body: ListView(
          children: [
            Container(
              padding: EdgeInsets.only(top: 5),
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                children: [
                  // Container(
                  //   alignment: Alignment.centerLeft,
                  //   margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  //   child: Text(
                  //     "Активные фильтры:",
                  //     style: TextStyle(
                  //         fontSize: 15,
                  //         fontWeight: FontWeight.w100,
                  //         color: Colors.black87),
                  //   ),
                  // ),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Text(
                      "Быстрые категории",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.green[700]),
                    ),
                  ),
                  CategoriesWidget(),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Text(
                      "Доступно в вашем городе",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.green[700]),
                    ),
                  ),
                  ItemsWidget(),
                ],
              ),
            ),
          ],
        ));
  }
}
