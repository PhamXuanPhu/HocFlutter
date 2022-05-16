import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../control/item.dart';
import 'controler_coin100.dart';

class Coin100 extends StatelessWidget {
  Coin100({Key? key}) : super(key: key);
  var controller = Get.put(Coin100Controller());

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
