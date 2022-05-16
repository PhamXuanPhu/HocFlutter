import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hocflutter/control/item.dart';
import 'package:hocflutter/resource/color.dart';
import 'package:hocflutter/resource/render/dimens.dart';
import '../../models/coin.dart';
import '../../reposistory/coinReposistory.dart';

class Coin100 extends StatefulWidget {
  const Coin100({Key? key}) : super(key: key);

  @override
  State<Coin100> createState() => _Coin100State();
}

class _Coin100State extends State<Coin100> {
  List<Coin> data = [];

  @override
  void initState() {
    getData();
    super.initState();
  }

  void getData() async {
    CoinsReposistory getcoin = CoinsReposistory();
    await getcoin.getCoins();
    data.addAll(CoinsReposistory.coins);
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

  Widget buildGridView() => GridView.builder(
      itemCount: data.length,
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (BuildContext context, index) {
        return ItemCoin(data: data[index]);
      });
}
