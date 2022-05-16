import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hocflutter/control/item.dart';
import 'package:hocflutter/resource/color.dart';
import 'package:hocflutter/resource/render/dimens.dart';

import '../../models/coin.dart';
import '../../reposistory/coinReposistory.dart';

class Favorite extends StatefulWidget {
  const Favorite({Key? key}) : super(key: key);

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  List<Coin> data = [];

  @override
  void initState() {
    getData();
    super.initState();
  }

  void getData() async {
    CoinsReposistory coinsReposistory = CoinsReposistory();
    coinsReposistory.initDatabase();
    final list = await coinsReposistory.getAllCoin();
    data.addAll(list ?? List<Coin>.empty());
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
