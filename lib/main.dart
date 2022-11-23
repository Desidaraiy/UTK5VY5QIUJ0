import 'package:demo_app/pages/Approot.dart';
import 'package:demo_app/store/shoplistview.dart';
import 'package:flutter/material.dart';
import 'package:demo_app/store/store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());
final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider<CatalogViewStore>(create: (context) => CatalogViewStore()),
          Provider<ShoppingList>(create: (context) => ShoppingList()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          navigatorKey: navigatorKey,
          routes: {"/": (context) => AppRoot()},
        ));
  }
}
