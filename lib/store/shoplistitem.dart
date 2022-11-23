import 'package:mobx/mobx.dart';
part 'shoplistitem.g.dart';

class ShoppingListItem = _ShoppingListItem with _$ShoppingListItem;

abstract class _ShoppingListItem with Store {
  _ShoppingListItem(this.title);

  @observable
  String title = '';

  @observable
  bool done = false;
}
