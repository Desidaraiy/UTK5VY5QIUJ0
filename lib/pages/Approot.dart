import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:demo_app/pages/CatalogPage.dart';
import 'package:demo_app/pages/HomePage.dart';
import 'package:demo_app/pages/Userpage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:demo_app/store/store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class AppRoot extends StatefulWidget {
  const AppRoot({Key? key}) : super(key: key);
  @override
  State<AppRoot> createState() => _AppRootState();
}

class _AppRootState extends State<AppRoot> {
  int currentIndex = 0;

  final screens = [
    HomePage(),
    CatalogPage(),
    UserPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: screens,
      ),
      bottomNavigationBar: CurvedNavigationBar(
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        height: 50,
        color: Colors.green,
        backgroundColor: Color.fromARGB(255, 232, 245, 233),
        items: [
          Icon(
            Icons.home,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.view_list,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.person,
            size: 30,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
