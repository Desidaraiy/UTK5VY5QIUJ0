import 'package:demo_app/pages/Approot.dart';
import 'package:demo_app/store/shoplistview.dart';
import 'package:flutter/material.dart';
import 'package:demo_app/store/store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() => runApp(MyApp());
final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  Orientation orientation = Orientation.portrait;
  ScreenType screenType = ScreenType.mobile;
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider<CatalogViewStore>(create: (context) => CatalogViewStore()),
          Provider<ShoppingList>(create: (context) => ShoppingList()),
        ],
        child: ResponsiveSizer(builder: (context, orientation, screenType) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            navigatorKey: navigatorKey,
            routes: {"/": (context) => AppRoot()},
          );
        }));
  }
}
