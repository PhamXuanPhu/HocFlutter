import 'package:get/get.dart';
import '../../../dao/coindao.dart';
import '../../../dao/database.dart';
import '../../../models/coin.dart';
import '../../../reposistory/coinReposistory.dart';

class FavoriteController extends GetxController {
  final List<Coin> data = List<Coin>.empty().obs;
  CoinDao? coinDao;

  FavoriteController() {
    initDatabase();
    getData();
  }

  getData() async {
    await initDatabase();
    final list = await coinDao?.findAllCoins();
    data.addAll(list ?? List<Coin>.empty());
  }

  Future<void> initDatabase() async {
    final database =
        await $FloorAppDatabase.databaseBuilder('app_database.db').build();
    coinDao = database.coinDao;
  }
}
