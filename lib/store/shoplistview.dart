import 'package:demo_app/store/shoplistitem.dart';
import 'package:mobx/mobx.dart';

part 'shoplistview.g.dart';

class ShoppingList = _ShoppingList with _$ShoppingList;

abstract class _ShoppingList with Store {
  @observable
  ObservableList<ShoppingListItem> items = ObservableList<ShoppingListItem>();

  @computed
  ObservableList<ShoppingListItem> get pendingTodos =>
      ObservableList.of(items.where((item) => item.done != true));

  @action
  void addItem(String title) {
    final item = ShoppingListItem(title);
    items.add(item);
  }

  @action
  void removeitem(ShoppingListItem item) {
    items.removeWhere((x) => x == item);
  }
}
