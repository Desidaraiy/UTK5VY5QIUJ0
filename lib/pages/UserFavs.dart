import 'package:demo_app/appbars/BackAppBar.dart';
import 'package:demo_app/appbars/CustomAppBar.dart';
import 'package:flutter/material.dart';

class UserFavorites extends StatelessWidget {
  const UserFavorites({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        height: 100,
        child: BackAppBar(title: "Избранное"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Избранных товаров не найдено",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey.shade700),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
            ),
            Text(
              "Чтобы добавить в этот список товар, нажмите иконку «сердце» на карточке товара",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey.shade700),
            ),
          ],
        ),
      ),
    );
  }
}
