import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hocflutter/control/item.dart';
import 'package:hocflutter/resource/color.dart';
import 'package:hocflutter/resource/render/dimens.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final data = ['item1','item2','item3','item4','item5','item6','item7','item8','item9','item10'
  ,'item1','item2','item3','item4','item5','item6','item7','item8','item9','item10'
  ,'item1','item2','item3','item4','item5','item6','item7','item8','item9','item10'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 0.2.hf,
            child: buildListView(),
          ),
          Container(
            height: 0.8.hf,
            child:  buildGridView()
          )],
      ),
    );
  }
  Widget buildListView() => ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: data.length,
      itemBuilder: (BuildContext context, index) {
        return item(data[index]);
      });

  Widget buildGridView() => GridView.builder(
      itemCount: data.length,
      gridDelegate:
      const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
      itemBuilder: (BuildContext context, index) {
        return item(data[index]);
      });
}
