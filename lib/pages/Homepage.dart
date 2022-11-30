import 'package:flutter/material.dart';
import 'package:demo_app/appbars/CustomAppBar.dart';
import 'package:demo_app/appbars/HomeAppBar.dart';
import 'package:demo_app/widgets/ItemsWidget.dart';
import 'package:demo_app/widgets/CategoriesWidget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

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
                  Container(
                    alignment: Alignment.centerLeft,
                    margin:
                        EdgeInsets.symmetric(vertical: 5.sp, horizontal: 10.sp),
                    child: Text(
                      "Быстрые категории",
                      style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.green[700]),
                    ),
                  ),
                  CategoriesWidget(),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin:
                        EdgeInsets.symmetric(vertical: 5.sp, horizontal: 10.sp),
                    child: Text(
                      "Доступно в вашем городе",
                      style: TextStyle(
                          fontSize: 18.sp,
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
