// import 'package:demo_app/store/shoplistitem.dart';
import 'package:demo_app/models/catalog.dart';
import 'package:demo_app/models/shopModel.dart';
import 'package:demo_app/tools/databasehelper.dart';
import 'package:mobx/mobx.dart';

part 'store.g.dart';

class CatalogViewStore = CatPage with _$CatalogViewStore;

abstract class CatPage with Store {
  @observable
  int cview = 0;
  @observable
  int catId = 0;

  @observable
  int currentShop = 0;

  @observable
  String currentShopName = '';

  @observable
  int currentPriceFilter = 1;

  @observable
  int currentDistanceFilter = 1;

  @observable
  int currentGodenDoFilter = 1;

  @observable
  int currentCategoryFilter = 0;

  @action
  void setCurrentCategoryFilterIndex(index) {
    currentCategoryFilter = index;
  }

  @action
  void setCurrentPriceFilter(index) {
    currentPriceFilter = index;
  }

  @action
  void setCurrentDistanceFilter(index) {
    currentDistanceFilter = index;
  }

  @action
  void setCurrentGodenDoFilter(index) {
    currentGodenDoFilter = index;
  }

  @observable
  int subCatId = 0;
  @observable
  bool isSearching = false;
  @observable
  String searchQuery = '';

  @observable
  bool gpsServiceEnabled = false;

  @observable
  List<Market> markets = [];

  @observable
  List<Good> goods = [];

  @observable
  List<Good> foundGoods = [];

  static ObservableFuture<List<Good>> emptyResponse =
      ObservableFuture.value([]);

  static ObservableFuture<List<Market>> emptyRes = ObservableFuture.value([]);

  @observable
  ObservableFuture<List<Good>> obsGoods = emptyResponse;

  @observable
  ObservableFuture<List<Good>> obsGoodsSearchResult = emptyResponse;

  @observable
  ObservableFuture<List<Market>> obsMarkets = emptyRes;

  @action
  Future getObsMarkets() async {
    obsMarkets = ObservableFuture(DatabaseHelper.instance.getMarkets());
    markets = await obsMarkets;
  }

  @action
  Future getObsGoods() async {
    obsGoods = ObservableFuture(DatabaseHelper.instance.getGoods());
    goods = await obsGoods;
  }

  @action
  Future getObsGoodsWithQuery() async {
    obsGoodsSearchResult = ObservableFuture(DatabaseHelper.instance
        .getGoodsWithQuery(
            searchQuery,
            currentPriceFilter,
            currentDistanceFilter,
            currentGodenDoFilter,
            currentCategoryFilter));

    foundGoods = await obsGoodsSearchResult;
  }

  @action
  void clearSearchResults() {
    obsGoodsSearchResult = emptyResponse;
  }

  @computed
  bool get isGpsServiceEnabled => gpsServiceEnabled;

  @computed
  List<Good> get getGoods => goods;

  @computed
  List<Market> get getMarkets => markets;

  @computed
  String get sQuery => searchQuery;

  @action
  void setGpsEnabled(k) {
    gpsServiceEnabled = k;
  }

  @action
  void setGoods(arr) {
    goods = arr;
  }

  @action
  void setMarkets(arr) {
    markets = arr;
  }

  @action
  void changeInd(ind) {
    cview = ind;
  }

  @action
  void changeIsSearching(k) {
    isSearching = k;
  }

  @action
  void setCurrentShop(id, name) {
    currentShop = id;
    currentShopName = name;
  }

  @action
  void changeSearchQuery(q) {
    searchQuery = q;
  }

  @action
  void changeCat(id) {
    catId = id;
  }

  @action
  void changeSubCat(id) {
    subCatId = id;
  }
}
