import 'package:flutter/material.dart';

class CatalogDropModel extends ChangeNotifier {
  int? cdi; // cuurent catalog dropdown index

  CatalogDropModel({@required this.cdi});

  void changeIndex(int index) {
    cdi = index;
    notifyListeners();
  }
}
