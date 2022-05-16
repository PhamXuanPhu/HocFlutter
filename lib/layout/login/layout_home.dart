import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../resource/color.dart';
import '../home/100coin/layout_100coin.dart';
import '../home/Favorite/layout_favorite.dart';
import '../home/search/layout_search.dart';
import '../home/top_coin/layout_top5coin.dart';

class Hom extends StatelessWidget {
  Hom({Key? key}) : super(key: key);
  RxInt currentIndex = 0.obs;
  final screens = [
    Coin100(),
    Top5Coin(),
    Search(),
    Favorite()
  ];
  final titles = ['Coin', 'Top 5 Coin', 'Search', 'favorite'];

  @override
  Widget build(BuildContext context) {
    return Obx(()=>Scaffold(
        appBar: AppBar(
          title: Text(titles[currentIndex.toInt()]),
          centerTitle: true,
        ),
        body: screens[currentIndex.toInt()],
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
            currentIndex: currentIndex.toInt(),
            onTap: (index) => {currentIndex = index.obs, print(currentIndex)},
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(CommunityMaterialIcons.home),
                  label: 'Coin',
                  backgroundColor: colorMain),
              BottomNavigationBarItem(
                  icon: Icon(CommunityMaterialIcons.trending_up),
                  label: 'Top 5',
                  backgroundColor: colorMain),
              BottomNavigationBarItem(
                  icon: Icon(CommunityMaterialIcons.account_search_outline),
                  label: 'Search',
                  backgroundColor: colorMain),
              BottomNavigationBarItem(
                  icon: Icon(CommunityMaterialIcons.heart_outline),
                  label: 'favorite',
                  backgroundColor: colorMain)
            ],
          ),
        ),
      ),
    );
  }
}
