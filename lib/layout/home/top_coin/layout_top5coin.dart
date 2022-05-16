import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hocflutter/layout/home/top_coin/controller_top5coin.dart';
import '../../../control/item.dart';

class Top5Coin extends StatelessWidget {
  Top5Coin({Key? key}) : super(key: key);
  var controller = Get.put(Top5CoinController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildListView(),
    );
  }

  Widget buildListView() => Obx(
        () => ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: controller.data.length,
        itemBuilder: (BuildContext context, index) {
          return ItemCoin(data: controller.data[index]);
        }),
  );
}
