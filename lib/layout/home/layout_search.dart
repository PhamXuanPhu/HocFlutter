import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hocflutter/control/item.dart';
import 'package:hocflutter/resource/color.dart';
import 'package:hocflutter/resource/render/dimens.dart';

import '../../control/textfiled_custom.dart';
import '../../models/coin.dart';
import '../../reposistory/coinReposistory.dart';

class SearchCoin extends StatefulWidget {
  const SearchCoin({Key? key}) : super(key: key);

  @override
  State<SearchCoin> createState() => _SearchCoinState();
}

class _SearchCoinState extends State<SearchCoin> {
  List<Coin> data = [];
  final TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    data.addAll(CoinsReposistory.coins);
    super.initState();
    setState(() {});
  }

  void searchData(String key) {
    data.clear();
    if (key.isNotEmpty) {
      final list = CoinsReposistory.coins.where((element) =>
          element.name?.toLowerCase().contains(key.toLowerCase()) == true);
      data.addAll(list);
    } else {
      data.addAll(CoinsReposistory.coins);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[body()],
    );
  }

  Widget buildListView() => ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: data.length,
      itemBuilder: (BuildContext context, index) {
        return ItemCoin(data: data[index]);
      });

  Widget body() => Scaffold(
        body: Column(
          children: [
            Container(
              height: 180.w,
              padding: const EdgeInsets.all(10),
              child: TextFieldCustom(
                onChanged: (newString) => {searchData(newString)},
                text: "Search",
                icon: const Icon(
                  CommunityMaterialIcons.magnify,
                  color: colorText,
                  size: 20,
                ),
              ),
            ),
            Expanded(
              child: buildListView(),
            )
          ],
        ),
      );
}
