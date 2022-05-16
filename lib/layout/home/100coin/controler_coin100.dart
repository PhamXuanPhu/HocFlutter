import 'package:get/get.dart';
import 'package:hocflutter/models/coin.dart';

import '../../../reposistory/coinReposistory.dart';

class Coin100Controller extends GetxController {
  final List<Coin> data = List<Coin>.empty().obs;
  CoinsReposistory getCoin = CoinsReposistory();

  Coin100Controller()
  {
    getData();
  }

  getData() async {
    var list = await getCoin.getCoins();
    data.addAll(list);
  }
}
