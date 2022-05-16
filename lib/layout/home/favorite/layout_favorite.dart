import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hocflutter/layout/home/Favorite/controller_favorite.dart';
import '../../../control/item.dart';

class Favorite extends StatelessWidget {
  Favorite({Key? key}) : super(key: key);
  var controller = Get.put(FavoriteController());

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
