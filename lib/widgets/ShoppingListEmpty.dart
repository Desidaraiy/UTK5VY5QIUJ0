import 'package:flutter/material.dart';

class ShoppingListEmptyPage extends StatelessWidget {
  const ShoppingListEmptyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Составьте список покупок!",
              style: TextStyle(
                  color: Colors.grey.shade700,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            Padding(padding: EdgeInsets.only(top: 20)),
            Icon(Icons.keyboard_double_arrow_down_sharp),
            Padding(padding: EdgeInsets.only(top: 20)),
            Text(
              "Нажмите добавить.",
              style: TextStyle(color: Colors.grey.shade700),
            ),
          ],
        ),
      ),
    );
  }
}
