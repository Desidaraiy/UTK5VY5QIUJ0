// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shoplistview.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ShoppingList on _ShoppingList, Store {
  Computed<ObservableList<ShoppingListItem>>? _$pendingTodosComputed;

  @override
  ObservableList<ShoppingListItem> get pendingTodos =>
      (_$pendingTodosComputed ??= Computed<ObservableList<ShoppingListItem>>(
              () => super.pendingTodos,
              name: '_ShoppingList.pendingTodos'))
          .value;

  late final _$itemsAtom = Atom(name: '_ShoppingList.items', context: context);

  @override
  ObservableList<ShoppingListItem> get items {
    _$itemsAtom.reportRead();
    return super.items;
  }

  @override
  set items(ObservableList<ShoppingListItem> value) {
    _$itemsAtom.reportWrite(value, super.items, () {
      super.items = value;
    });
  }

  late final _$_ShoppingListActionController =
      ActionController(name: '_ShoppingList', context: context);

  @override
  void addItem(String title) {
    final _$actionInfo = _$_ShoppingListActionController.startAction(
        name: '_ShoppingList.addItem');
    try {
      return super.addItem(title);
    } finally {
      _$_ShoppingListActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeitem(ShoppingListItem item) {
    final _$actionInfo = _$_ShoppingListActionController.startAction(
        name: '_ShoppingList.removeitem');
    try {
      return super.removeitem(item);
    } finally {
      _$_ShoppingListActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
items: ${items},
pendingTodos: ${pendingTodos}
    ''';
  }
}
