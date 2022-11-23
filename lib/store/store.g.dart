// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CatalogViewStore on CatPage, Store {
  Computed<bool>? _$isGpsServiceEnabledComputed;

  @override
  bool get isGpsServiceEnabled => (_$isGpsServiceEnabledComputed ??=
          Computed<bool>(() => super.isGpsServiceEnabled,
              name: 'CatPage.isGpsServiceEnabled'))
      .value;
  Computed<List<Good>>? _$getGoodsComputed;

  @override
  List<Good> get getGoods => (_$getGoodsComputed ??=
          Computed<List<Good>>(() => super.getGoods, name: 'CatPage.getGoods'))
      .value;
  Computed<List<Market>>? _$getMarketsComputed;

  @override
  List<Market> get getMarkets =>
      (_$getMarketsComputed ??= Computed<List<Market>>(() => super.getMarkets,
              name: 'CatPage.getMarkets'))
          .value;
  Computed<String>? _$sQueryComputed;

  @override
  String get sQuery => (_$sQueryComputed ??=
          Computed<String>(() => super.sQuery, name: 'CatPage.sQuery'))
      .value;

  late final _$cviewAtom = Atom(name: 'CatPage.cview', context: context);

  @override
  int get cview {
    _$cviewAtom.reportRead();
    return super.cview;
  }

  @override
  set cview(int value) {
    _$cviewAtom.reportWrite(value, super.cview, () {
      super.cview = value;
    });
  }

  late final _$catIdAtom = Atom(name: 'CatPage.catId', context: context);

  @override
  int get catId {
    _$catIdAtom.reportRead();
    return super.catId;
  }

  @override
  set catId(int value) {
    _$catIdAtom.reportWrite(value, super.catId, () {
      super.catId = value;
    });
  }

  late final _$currentShopAtom =
      Atom(name: 'CatPage.currentShop', context: context);

  @override
  int get currentShop {
    _$currentShopAtom.reportRead();
    return super.currentShop;
  }

  @override
  set currentShop(int value) {
    _$currentShopAtom.reportWrite(value, super.currentShop, () {
      super.currentShop = value;
    });
  }

  late final _$currentShopNameAtom =
      Atom(name: 'CatPage.currentShopName', context: context);

  @override
  String get currentShopName {
    _$currentShopNameAtom.reportRead();
    return super.currentShopName;
  }

  @override
  set currentShopName(String value) {
    _$currentShopNameAtom.reportWrite(value, super.currentShopName, () {
      super.currentShopName = value;
    });
  }

  late final _$currentPriceFilterAtom =
      Atom(name: 'CatPage.currentPriceFilter', context: context);

  @override
  int get currentPriceFilter {
    _$currentPriceFilterAtom.reportRead();
    return super.currentPriceFilter;
  }

  @override
  set currentPriceFilter(int value) {
    _$currentPriceFilterAtom.reportWrite(value, super.currentPriceFilter, () {
      super.currentPriceFilter = value;
    });
  }

  late final _$currentDistanceFilterAtom =
      Atom(name: 'CatPage.currentDistanceFilter', context: context);

  @override
  int get currentDistanceFilter {
    _$currentDistanceFilterAtom.reportRead();
    return super.currentDistanceFilter;
  }

  @override
  set currentDistanceFilter(int value) {
    _$currentDistanceFilterAtom.reportWrite(value, super.currentDistanceFilter,
        () {
      super.currentDistanceFilter = value;
    });
  }

  late final _$currentGodenDoFilterAtom =
      Atom(name: 'CatPage.currentGodenDoFilter', context: context);

  @override
  int get currentGodenDoFilter {
    _$currentGodenDoFilterAtom.reportRead();
    return super.currentGodenDoFilter;
  }

  @override
  set currentGodenDoFilter(int value) {
    _$currentGodenDoFilterAtom.reportWrite(value, super.currentGodenDoFilter,
        () {
      super.currentGodenDoFilter = value;
    });
  }

  late final _$currentCategoryFilterAtom =
      Atom(name: 'CatPage.currentCategoryFilter', context: context);

  @override
  int get currentCategoryFilter {
    _$currentCategoryFilterAtom.reportRead();
    return super.currentCategoryFilter;
  }

  @override
  set currentCategoryFilter(int value) {
    _$currentCategoryFilterAtom.reportWrite(value, super.currentCategoryFilter,
        () {
      super.currentCategoryFilter = value;
    });
  }

  late final _$subCatIdAtom = Atom(name: 'CatPage.subCatId', context: context);

  @override
  int get subCatId {
    _$subCatIdAtom.reportRead();
    return super.subCatId;
  }

  @override
  set subCatId(int value) {
    _$subCatIdAtom.reportWrite(value, super.subCatId, () {
      super.subCatId = value;
    });
  }

  late final _$isSearchingAtom =
      Atom(name: 'CatPage.isSearching', context: context);

  @override
  bool get isSearching {
    _$isSearchingAtom.reportRead();
    return super.isSearching;
  }

  @override
  set isSearching(bool value) {
    _$isSearchingAtom.reportWrite(value, super.isSearching, () {
      super.isSearching = value;
    });
  }

  late final _$searchQueryAtom =
      Atom(name: 'CatPage.searchQuery', context: context);

  @override
  String get searchQuery {
    _$searchQueryAtom.reportRead();
    return super.searchQuery;
  }

  @override
  set searchQuery(String value) {
    _$searchQueryAtom.reportWrite(value, super.searchQuery, () {
      super.searchQuery = value;
    });
  }

  late final _$gpsServiceEnabledAtom =
      Atom(name: 'CatPage.gpsServiceEnabled', context: context);

  @override
  bool get gpsServiceEnabled {
    _$gpsServiceEnabledAtom.reportRead();
    return super.gpsServiceEnabled;
  }

  @override
  set gpsServiceEnabled(bool value) {
    _$gpsServiceEnabledAtom.reportWrite(value, super.gpsServiceEnabled, () {
      super.gpsServiceEnabled = value;
    });
  }

  late final _$marketsAtom = Atom(name: 'CatPage.markets', context: context);

  @override
  List<Market> get markets {
    _$marketsAtom.reportRead();
    return super.markets;
  }

  @override
  set markets(List<Market> value) {
    _$marketsAtom.reportWrite(value, super.markets, () {
      super.markets = value;
    });
  }

  late final _$goodsAtom = Atom(name: 'CatPage.goods', context: context);

  @override
  List<Good> get goods {
    _$goodsAtom.reportRead();
    return super.goods;
  }

  @override
  set goods(List<Good> value) {
    _$goodsAtom.reportWrite(value, super.goods, () {
      super.goods = value;
    });
  }

  late final _$foundGoodsAtom =
      Atom(name: 'CatPage.foundGoods', context: context);

  @override
  List<Good> get foundGoods {
    _$foundGoodsAtom.reportRead();
    return super.foundGoods;
  }

  @override
  set foundGoods(List<Good> value) {
    _$foundGoodsAtom.reportWrite(value, super.foundGoods, () {
      super.foundGoods = value;
    });
  }

  late final _$obsGoodsAtom = Atom(name: 'CatPage.obsGoods', context: context);

  @override
  ObservableFuture<List<Good>> get obsGoods {
    _$obsGoodsAtom.reportRead();
    return super.obsGoods;
  }

  @override
  set obsGoods(ObservableFuture<List<Good>> value) {
    _$obsGoodsAtom.reportWrite(value, super.obsGoods, () {
      super.obsGoods = value;
    });
  }

  late final _$obsGoodsSearchResultAtom =
      Atom(name: 'CatPage.obsGoodsSearchResult', context: context);

  @override
  ObservableFuture<List<Good>> get obsGoodsSearchResult {
    _$obsGoodsSearchResultAtom.reportRead();
    return super.obsGoodsSearchResult;
  }

  @override
  set obsGoodsSearchResult(ObservableFuture<List<Good>> value) {
    _$obsGoodsSearchResultAtom.reportWrite(value, super.obsGoodsSearchResult,
        () {
      super.obsGoodsSearchResult = value;
    });
  }

  late final _$obsMarketsAtom =
      Atom(name: 'CatPage.obsMarkets', context: context);

  @override
  ObservableFuture<List<Market>> get obsMarkets {
    _$obsMarketsAtom.reportRead();
    return super.obsMarkets;
  }

  @override
  set obsMarkets(ObservableFuture<List<Market>> value) {
    _$obsMarketsAtom.reportWrite(value, super.obsMarkets, () {
      super.obsMarkets = value;
    });
  }

  late final _$getObsMarketsAsyncAction =
      AsyncAction('CatPage.getObsMarkets', context: context);

  @override
  Future<dynamic> getObsMarkets() {
    return _$getObsMarketsAsyncAction.run(() => super.getObsMarkets());
  }

  late final _$getObsGoodsAsyncAction =
      AsyncAction('CatPage.getObsGoods', context: context);

  @override
  Future<dynamic> getObsGoods() {
    return _$getObsGoodsAsyncAction.run(() => super.getObsGoods());
  }

  late final _$getObsGoodsWithQueryAsyncAction =
      AsyncAction('CatPage.getObsGoodsWithQuery', context: context);

  @override
  Future<dynamic> getObsGoodsWithQuery() {
    return _$getObsGoodsWithQueryAsyncAction
        .run(() => super.getObsGoodsWithQuery());
  }

  late final _$CatPageActionController =
      ActionController(name: 'CatPage', context: context);

  @override
  void setCurrentCategoryFilterIndex(dynamic index) {
    final _$actionInfo = _$CatPageActionController.startAction(
        name: 'CatPage.setCurrentCategoryFilterIndex');
    try {
      return super.setCurrentCategoryFilterIndex(index);
    } finally {
      _$CatPageActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCurrentPriceFilter(dynamic index) {
    final _$actionInfo = _$CatPageActionController.startAction(
        name: 'CatPage.setCurrentPriceFilter');
    try {
      return super.setCurrentPriceFilter(index);
    } finally {
      _$CatPageActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCurrentDistanceFilter(dynamic index) {
    final _$actionInfo = _$CatPageActionController.startAction(
        name: 'CatPage.setCurrentDistanceFilter');
    try {
      return super.setCurrentDistanceFilter(index);
    } finally {
      _$CatPageActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCurrentGodenDoFilter(dynamic index) {
    final _$actionInfo = _$CatPageActionController.startAction(
        name: 'CatPage.setCurrentGodenDoFilter');
    try {
      return super.setCurrentGodenDoFilter(index);
    } finally {
      _$CatPageActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearSearchResults() {
    final _$actionInfo = _$CatPageActionController.startAction(
        name: 'CatPage.clearSearchResults');
    try {
      return super.clearSearchResults();
    } finally {
      _$CatPageActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setGpsEnabled(dynamic k) {
    final _$actionInfo =
        _$CatPageActionController.startAction(name: 'CatPage.setGpsEnabled');
    try {
      return super.setGpsEnabled(k);
    } finally {
      _$CatPageActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setGoods(dynamic arr) {
    final _$actionInfo =
        _$CatPageActionController.startAction(name: 'CatPage.setGoods');
    try {
      return super.setGoods(arr);
    } finally {
      _$CatPageActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setMarkets(dynamic arr) {
    final _$actionInfo =
        _$CatPageActionController.startAction(name: 'CatPage.setMarkets');
    try {
      return super.setMarkets(arr);
    } finally {
      _$CatPageActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeInd(dynamic ind) {
    final _$actionInfo =
        _$CatPageActionController.startAction(name: 'CatPage.changeInd');
    try {
      return super.changeInd(ind);
    } finally {
      _$CatPageActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeIsSearching(dynamic k) {
    final _$actionInfo = _$CatPageActionController.startAction(
        name: 'CatPage.changeIsSearching');
    try {
      return super.changeIsSearching(k);
    } finally {
      _$CatPageActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCurrentShop(dynamic id, dynamic name) {
    final _$actionInfo =
        _$CatPageActionController.startAction(name: 'CatPage.setCurrentShop');
    try {
      return super.setCurrentShop(id, name);
    } finally {
      _$CatPageActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeSearchQuery(dynamic q) {
    final _$actionInfo = _$CatPageActionController.startAction(
        name: 'CatPage.changeSearchQuery');
    try {
      return super.changeSearchQuery(q);
    } finally {
      _$CatPageActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeCat(dynamic id) {
    final _$actionInfo =
        _$CatPageActionController.startAction(name: 'CatPage.changeCat');
    try {
      return super.changeCat(id);
    } finally {
      _$CatPageActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeSubCat(dynamic id) {
    final _$actionInfo =
        _$CatPageActionController.startAction(name: 'CatPage.changeSubCat');
    try {
      return super.changeSubCat(id);
    } finally {
      _$CatPageActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
cview: ${cview},
catId: ${catId},
currentShop: ${currentShop},
currentShopName: ${currentShopName},
currentPriceFilter: ${currentPriceFilter},
currentDistanceFilter: ${currentDistanceFilter},
currentGodenDoFilter: ${currentGodenDoFilter},
currentCategoryFilter: ${currentCategoryFilter},
subCatId: ${subCatId},
isSearching: ${isSearching},
searchQuery: ${searchQuery},
gpsServiceEnabled: ${gpsServiceEnabled},
markets: ${markets},
goods: ${goods},
foundGoods: ${foundGoods},
obsGoods: ${obsGoods},
obsGoodsSearchResult: ${obsGoodsSearchResult},
obsMarkets: ${obsMarkets},
isGpsServiceEnabled: ${isGpsServiceEnabled},
getGoods: ${getGoods},
getMarkets: ${getMarkets},
sQuery: ${sQuery}
    ''';
  }
}
