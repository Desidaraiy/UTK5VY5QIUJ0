import 'package:demo_app/pages/Shoppinglist.dart';
import 'package:demo_app/pages/UserFavs.dart';
import 'package:demo_app/pages/testPage.dart';
import 'package:flutter/material.dart';
import 'package:demo_app/appbars/CustomAppBar.dart';
import 'package:demo_app/appbars/Userappbar.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);
  @override
  State<UserPage> createState() => _UserPageState();
}

Route _openPageWithAnimation(Widget widget) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) {
      return widget;
    },
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.ease;
      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

class _UserPageState extends State<UserPage> {
  int dropdownonevalue = 0;
  var itemsone = ['Спрашивать', 'Не спрашивать'];
  int dropdowntwovalue = 0;
  var itemstwo = ['Авто.', 'Ввести'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        height: 100,
        child: UserAppBar(),
      ),
      body: Container(
        color: Colors.green[50],
        padding: EdgeInsets.only(top: 10),
        child: ListView(
          children: [
            // Container(
            //   padding: EdgeInsets.all(20),
            //   margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            //   decoration: BoxDecoration(
            //     color: Colors.white,
            //     borderRadius: BorderRadius.circular(20),
            //   ),
            //   child: Row(
            //     children: [
            //       Text(
            //         "Избранное",
            //         style: TextStyle(
            //           fontSize: 21,
            //           color: Colors.black87,
            //         ),
            //       ),
            //       Spacer(),
            //       TextButton(
            //         onPressed: () {
            //           Navigator.of(context)
            //               .push(_openPageWithAnimation(UserFavorites()));
            //         },
            //         style: TextButton.styleFrom(
            //           backgroundColor: Colors.green[50],
            //           shape: CircleBorder(),
            //         ),
            //         child: Icon(
            //           Icons.keyboard_arrow_right,
            //           size: 32,
            //           color: Colors.black87,
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            Container(
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Text(
                    "Список покупок",
                    style: TextStyle(
                      fontSize: 21,
                      color: Colors.black87,
                    ),
                  ),
                  Spacer(),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context)
                          .push(_openPageWithAnimation(ShoppingListView()));
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
            ),
            Container(
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Text(
                    "Геолокация",
                    style: TextStyle(
                      fontSize: 21,
                      color: Colors.black87,
                    ),
                  ),
                  Spacer(),
                  DropdownButton(
                    dropdownColor: Colors.green[300],
                    value: itemsone[dropdownonevalue],
                    icon: const Icon(Icons.keyboard_arrow_down,
                        color: Colors.black87),
                    items: itemsone.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(
                          items,
                          style: TextStyle(fontSize: 18, color: Colors.black54),
                        ),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownonevalue = itemsone.indexOf(newValue!);
                      });
                    },
                  ),
                ],
              ),
            ),
            // Container(
            //   padding: EdgeInsets.all(20),
            //   margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            //   decoration: BoxDecoration(
            //     color: Colors.white,
            //     borderRadius: BorderRadius.circular(20),
            //   ),
            //   child: Row(
            //     children: [
            //       Text(
            //         "Мой адрес",
            //         style: TextStyle(
            //           fontSize: 21,
            //           color: Colors.black87,
            //         ),
            //       ),
            //       Spacer(),
            //       DropdownButton(
            //         dropdownColor: Colors.green[300],
            //         value: itemstwo[dropdowntwovalue],
            //         icon: const Icon(Icons.keyboard_arrow_down,
            //             color: Colors.black87),
            //         items: itemstwo.map((String items) {
            //           return DropdownMenuItem(
            //             value: items,
            //             child: Text(
            //               items,
            //               style: TextStyle(fontSize: 18, color: Colors.black54),
            //             ),
            //           );
            //         }).toList(),
            //         onChanged: (String? newValue) {
            //           setState(() {
            //             dropdowntwovalue = itemstwo.indexOf(newValue!);
            //           });
            //         },
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
