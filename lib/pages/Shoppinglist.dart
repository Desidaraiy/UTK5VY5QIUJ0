import 'package:demo_app/appbars/BackAppBar.dart';
import 'package:demo_app/appbars/CustomAppBar.dart';
import 'package:demo_app/widgets/ShoppingListEmpty.dart';
import 'package:demo_app/widgets/ShoppingListVu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:demo_app/store/shoplistview.dart';

class ShoppingListView extends StatefulWidget {
  const ShoppingListView({Key? key}) : super(key: key);

  @override
  State<ShoppingListView> createState() => _ShoppingListViewState();
}

class _ShoppingListViewState extends State<ShoppingListView> {
  String currentItemText = '';
  @override
  Widget build(BuildContext context) {
    final shoppinglist = Provider.of<ShoppingList>(context);

    void _dismissDialog() {
      Navigator.pop(context);
    }

    void _showMaterialDialog() {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Добавить в список'),
              content: Container(
                child: TextField(
                  onChanged: (val) {
                    setState(() {
                      currentItemText = val;
                    });
                  },
                  minLines: 2,
                  maxLines: 5,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    hintText: 'Название, вес',
                    hintStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(3.0)),
                    ),
                  ),
                ),
              ),
              actions: <Widget>[
                TextButton(
                    onPressed: () {
                      _dismissDialog();
                    },
                    child: Text('Отмена')),
                TextButton(
                  onPressed: () {
                    shoppinglist.addItem(currentItemText);
                    setState(() {
                      currentItemText = '';
                    });
                    _dismissDialog();
                  },
                  child: Text('Добавить'),
                )
              ],
            );
          });
    }

    return Scaffold(
      appBar: CustomAppBar(
        height: 100,
        child: BackAppBar(title: "Список покупок"),
      ),
      // body: ShoppingListEmptyPage(),
      body: Container(
        child: Observer(
          builder: (context) => shoppinglist.pendingTodos.isEmpty
              ? ShoppingListEmptyPage()
              : ShoppingListVu(),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.green[700],
        onPressed: () {
          _showMaterialDialog();
        },
        label: Row(
          children: [Icon(Icons.add), Text("Добавить")],
        ),
      ),
    );
  }
}
