import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:hocflutter/models/ChartCoinModel.dart';
import 'package:hocflutter/models/coin.dart';
import 'package:hocflutter/reposistory/coinReposistory.dart';
import 'package:hocflutter/resource/render/dimens.dart';
import '../../resource/color.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class CoinDetailPage extends StatefulWidget {
  const CoinDetailPage({Key? key, required this.data}) : super(key: key);
  final Coin data;

  @override
  State<CoinDetailPage> createState() => _CoinDetailPageState();
}

class _CoinDetailPageState extends State<CoinDetailPage> {
  List<charts.Series<ChartCoinModel, DateTime>> history = [];
  int selected = 6;
  late bool isFavorite = false;
  CoinsReposistory coinsReposistory = CoinsReposistory();

  @override
  void initState() {
    getData(24);
    getFavorite();
    super.initState();
  }

  void getFavorite() {
    coinsReposistory.initDatabase();
    coinsReposistory
        .isFavorite(widget.data.id ?? '')
        .then((value) => {isFavorite = value, setState(() {})});
  }

  void getData(int hour) async {
    history =
        await coinsReposistory.getHistoryOfCoin(hour, widget.data.id ?? '');
    setState(() {});
  }

  Future<void> actionCoin(Coin coin) async {
    isFavorite
        ? {coinsReposistory.removeCoin(coin), isFavorite = false}
        : {coinsReposistory.insertCoin(coin), isFavorite = true};
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Coin Detail'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Container(
              margin: const EdgeInsets.fromLTRB(0, 30, 0, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.data.name.toString(),
                    style: const TextStyle(
                      color: colorText,
                      fontSize: 22,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      actionCoin(widget.data);
                    },
                    icon: Icon(
                      isFavorite
                          ? CommunityMaterialIcons.heart
                          : CommunityMaterialIcons.heart_outline,
                      color: colorText,
                      size: 25,
                    ),
                  )
                ],
              ),
            ),
          ),
          buildHeader(),
          buildChart(),
          buildTimeButton()
        ],
      ),
    );
  }

  Widget buildHeader() => SizedBox(
        height: 300.w,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 530.w,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.data.currentPrice.toString(),
                    style: const TextStyle(
                        color: colorText,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    'Price',
                    style: TextStyle(color: colorText, fontSize: 15),
                  )
                ],
              ),
            ),
            Container(
              color: colorText,
              width: 1.w,
            ),
            Container(
              width: 530.w,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.data.priceChangePercentage24h.toString(),
                    style: const TextStyle(
                        color: colorText,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    'Price Changed',
                    style: TextStyle(color: colorText, fontSize: 15),
                  )
                ],
              ),
            ),
          ],
        ),
      );

  Widget buildChart() => Container(
        padding: const EdgeInsets.all(10),
        height: 1000.w,
        child: charts.TimeSeriesChart(
          history,
          animate: true,
          dateTimeFactory: const charts.LocalDateTimeFactory(),
        ),
      );

  Widget buildTimeButton() => SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              width: 50.w,
            ),
            customRadio('6 Giờ', 6),
            SizedBox(
              width: 50.w,
            ),
            customRadio('12 Giờ', 12),
            SizedBox(
              width: 50.w,
            ),
            customRadio('1 Ngày', 24),
            SizedBox(
              width: 50.w,
            ),
            customRadio('1 Tuần', 168),
            SizedBox(
              width: 50.w,
            ),
            customRadio('1 Tháng', 720),
            SizedBox(
              width: 50.w,
            ),
            customRadio('2 Tháng', 1440),
            SizedBox(
              width: 50.w,
            ),
            customRadio('3 Tháng', 2160),
            SizedBox(
              width: 50.w,
            ),
          ],
        ),
      );

  Widget customRadio(String text, int index) => ElevatedButton(
        onPressed: () {
          setState(() {
            selected = index;
            getData(index);
          });
        },
        child: Text(
          text,
          style: TextStyle(
              color: (selected == index) ? colorWhite : colorText,
              fontSize: 15),
        ),
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
                (selected == index) ? colorGreen : colorWhite),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
              side: const BorderSide(
                color: colorGreen,
                width: 2,
              ),
            ))),
      );
}
