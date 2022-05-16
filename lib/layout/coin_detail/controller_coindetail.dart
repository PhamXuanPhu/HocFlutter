import 'package:get/get.dart';
import 'package:hocflutter/models/coin.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import '../../../reposistory/coinReposistory.dart';
import '../../dao/coindao.dart';
import '../../dao/database.dart';
import '../../models/ChartCoinModel.dart';

class CoinDetailController extends GetxController {
  final Rx<Coin> data = Coin().obs;
  List<charts.Series<ChartCoinModel, DateTime>> history =
      List<charts.Series<ChartCoinModel, DateTime>>.empty().obs;
  RxInt selected = 6.obs;
  RxBool isFavorite = false.obs;
  CoinsReposistory getCoin = CoinsReposistory();
  CoinDao? coinDao;

  CoinDetailController() {
    initDatabase();
    getFavorite();
    getDataChart();
  }

  void Getdata(Coin coin)
  {
    data.value = coin;
    initDatabase();
    getFavorite();
    getDataChart();
  }

  void getFavorite() async {
    var coin = await coinDao?.findCoinById(data.value.id ?? '');
    if (coin != null) {
      isFavorite.value = true;
    } else {
      isFavorite.value = false;
    }
  }

  getDataChart() async {
    /* var list =
        await getCoin.getHistoryOfCoin(selected.value, data.value.id ?? '');
    var chartData = Future.value([
      charts.Series<ChartCoinModel, DateTime>(
        data: list ?? List<ChartCoinModel>.empty(),
        id: data.value.id ?? '',
        colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
        domainFn: (ChartCoinModel item, _) => item.time ?? DateTime.now(),
        measureFn: (ChartCoinModel item, _) => item.price,
      )
    ]);
    history = chartData as List<charts.Series<ChartCoinModel, DateTime>>;
     */
  }

  void initDatabase() async {
    final database =
        await $FloorAppDatabase.databaseBuilder('app_database.db').build();
    coinDao = database.coinDao;
  }

  void actionCoin(Coin coin) {
    isFavorite.value
        ? {removeCoin(coin), isFavorite.value = false}
        : {insertCoin(coin), isFavorite.value = true};
  }

  void removeCoin(Coin coin) {
    coinDao?.deleteCoin(coin);
  }

  void insertCoin(Coin coin) {
    coinDao?.insertCoin(coin);
  }
}
