import 'package:demo_app/store/shoplistview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class ShoppingListVu extends StatelessWidget {
  const ShoppingListVu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final list = Provider.of<ShoppingList>(context);
    return Observer(
        builder: (context) => Container(
              margin: EdgeInsets.only(top: 10),
              child: ListView.builder(
                  itemCount: list.pendingTodos.length,
                  itemBuilder: (_, index) {
                    final todo = list.pendingTodos[index];
                    return Observer(
                        builder: (_) => CheckboxListTile(
                              controlAffinity: ListTileControlAffinity.leading,
                              value: todo.done,
                              onChanged: (checked) {
                                todo.done = checked!;
                              },
                              title: Row(
                                children: <Widget>[
                                  Expanded(
                                      child: Text(
                                    todo.title,
                                    overflow: TextOverflow.ellipsis,
                                  )),
                                  IconButton(
                                    icon: const Icon(Icons.delete),
                                    onPressed: () => list.removeitem(todo),
                                  )
                                ],
                              ),
                            ));
                  }),
            ));
  }
}
