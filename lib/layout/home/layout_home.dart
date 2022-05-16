import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:hocflutter/layout/home/layout_top5coin.dart';
import 'package:hocflutter/layout/login/layout_login.dart';
import 'package:hocflutter/resource/color.dart';
import 'layout_100coin.dart';
import 'layout_favorite.dart';
import 'layout_search.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;
  final screens = [
    const Coin100(),
    const Top5Coin(),
    const SearchCoin(),
    const Favorite()
  ];
  final titles = ['Coin', 'Top 5 Coin', 'Search', 'Favorite'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titles[currentIndex]),
        centerTitle: true,
      ),
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
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
              label: 'Favorite',
              backgroundColor: colorMain)
        ],
      ),
    );
  }
}
