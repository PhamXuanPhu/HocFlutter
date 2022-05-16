import 'package:get/get.dart';
import 'package:hocflutter/models/coin.dart';

import '../../../reposistory/coinReposistory.dart';

class Top5CoinController extends GetxController {
  final List<Coin> data = List<Coin>.empty().obs;
  CoinsReposistory getCoin = CoinsReposistory();

  Top5CoinController() {
    getData();
  }

  getData() async {
    var list = await getCoin.getCoins();
    list.sort((a, b) => ((b.priceChangePercentage24h ?? 0)
        .compareTo((a.priceChangePercentage24h ?? 0))));
    data.addAll(list.take(5));
  }
}
