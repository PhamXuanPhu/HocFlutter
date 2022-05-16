import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:hocflutter/models/ChartCoinModel.dart';
import 'package:hocflutter/models/coin.dart';
import '../config/config.dart';
import 'package:charts_flutter/flutter.dart' as charts;

import '../dao/coindao.dart';
import '../dao/database.dart';

class CoinsReposistory {
  static List<Coin> coins = [];
  static CoinDao? coinDao;

  void initDatabase() async {
    final database = await $FloorAppDatabase.databaseBuilder('app_database.db').build();
    coinDao = database.coinDao;
  }

  Future<List<Coin>?> getAllCoin() async {
   return await coinDao?.findAllCoins();
  }

  void removeCoin(Coin coin) {
      coinDao?.deleteCoin(coin);
  }

  void insertCoin(Coin coin) {
    coinDao?.insertCoin(coin);
  }

  Future<bool> isFavorite(String id) async {
    var coin = await coinDao?.findCoinById(id) ;
    return coin != null;
  }

  Future<List<Coin>> getCoins() async {
    if (coins.isEmpty) {
      try {
        var response = await Dio().get(coint_100);
        final listCoin = List<Coin>.from(
            (response.data).map((e) => Coin.fromJson(e)));
        coins.addAll(listCoin);
        return coins;
      } catch (e) {
        print(e);
        return List<Coin>.empty();
      }
    }
    return coins;
  }

  Future<List<charts.Series<ChartCoinModel, DateTime>>> getHistoryOfCoin(
      int hour, String id) async {
    try {
      String from = (DateTime.now()
                  .subtract(Duration(hours: hour))
                  .toUtc()
                  .millisecondsSinceEpoch /
              1000)
          .round()
          .toString();
      String to = (DateTime.now().toUtc().millisecondsSinceEpoch / 1000)
          .round()
          .toString();
      final response = await Dio().get(
          'https://api.coingecko.com/api/v3/coins/$id/market_chart/range?vs_currency=usd&from=$from&to=$to');
      List<ChartCoinModel> list = [];
      var bcs = jsonDecode(response.toString())['prices'];
      for (var item in bcs) {
        list.add(ChartCoinModel(
            price: item[1],
            time: DateTime.fromMicrosecondsSinceEpoch(item[0])));
      }
      return Future.value([
        charts.Series<ChartCoinModel, DateTime>(
          data: list,
          id: id,
          colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
          domainFn: (ChartCoinModel item, _) => item.time ?? DateTime.now(),
          measureFn: (ChartCoinModel item, _) => item.price,
        )
      ]);
    } catch (e) {
      print(e);
      return List<charts.Series<ChartCoinModel, DateTime>>.empty();
    }
  }
}
