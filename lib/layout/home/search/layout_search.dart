import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hocflutter/layout/home/search/controller_search.dart';
import 'package:hocflutter/resource/render/dimens.dart';

import '../../../control/item.dart';
import '../../../control/textfiled_custom.dart';
import '../../../resource/color.dart';

class Search extends StatelessWidget {
  Search({Key? key}) : super(key: key);
  var controller = Get.put(SearchController());

  @override
  Widget build(BuildContext context) {
    return body();
  }

  Widget body() => Scaffold(
        body: Column(
          children: [
            Container(
              height: 180.w,
              padding: const EdgeInsets.all(10),
              child: TextFieldCustom(
                onChanged: (newString) => {controller.searchCoin(newString)},
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

  Widget buildListView() => Obx(
        () => ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: controller.listSearch.length,
            itemBuilder: (BuildContext context, index) {
              return ItemCoin(data: controller.listSearch[index]);
            }),
      );
}
