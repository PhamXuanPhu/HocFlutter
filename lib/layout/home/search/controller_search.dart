import 'package:get/get.dart';
import 'package:hocflutter/models/coin.dart';
import '../../../reposistory/coinReposistory.dart';

class SearchController extends GetxController {
  final List<Coin> data = [];
  final List<Coin> listSearch = List<Coin>.empty().obs;
  CoinsReposistory getCoin = CoinsReposistory();

  SearchController() {
    getData();
  }

  void searchCoin(String key) {
    listSearch.clear();
    if (key.isNotEmpty) {
      final list = data.where((element) =>
          element.name?.toLowerCase().contains(key.toLowerCase()) == true);
      listSearch.addAll(list);
    } else {
      listSearch.addAll(data);
    }
  }

  getData() async {
    var list = await getCoin.getCoins();
    data.addAll(list);
    listSearch.addAll(data);
  }
}
