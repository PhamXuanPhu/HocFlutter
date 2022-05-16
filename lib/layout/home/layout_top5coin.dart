import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hocflutter/control/item.dart';
import 'package:hocflutter/resource/color.dart';
import 'package:hocflutter/resource/render/dimens.dart';
import '../../models/coin.dart';
import '../../reposistory/coinReposistory.dart';

class Top5Coin extends StatefulWidget {
  const Top5Coin({Key? key}) : super(key: key);

  @override
  State<Top5Coin> createState() => _Top5CoinState();
}

class _Top5CoinState extends State<Top5Coin> {
  List<Coin> data = [];

  @override
  void initState() {
    getData();
    super.initState();
  }

  void getData() async {
    List<Coin> list = [];
    list.addAll(CoinsReposistory.coins);
    list.sort((a, b) => ((b.priceChangePercentage24h ?? 0)
        .compareTo((a.priceChangePercentage24h ?? 0))));
    data.addAll(list.take(5));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildListView(),
    );
  }

  Widget buildListView() => ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: data.length,
      itemBuilder: (BuildContext context, index) {
        return ItemCoin(data: data[index]);
      });
}
