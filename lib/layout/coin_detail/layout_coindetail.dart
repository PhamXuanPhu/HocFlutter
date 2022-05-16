import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hocflutter/layout/coin_detail/controller_coindetail.dart';
import 'package:hocflutter/resource/render/dimens.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import '../../control/button.dart';
import '../../models/coin.dart';
import '../../resource/color.dart';

class CoinDetail extends StatelessWidget {
  CoinDetail({Key? key, required this.data}) : super(key: key);
  var controller = Get.put(CoinDetailController());
  final Coin data;

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
                  Button(
                    text: 'Login',
                    onClick: () => {
                      controller.Getdata(data),
                    },
                    numWith: 1000.w,
                    styleButton: StyleButton.white,
                    iconData: CommunityMaterialIcons.application_import,
                  ),
                  Obx(
                    () => Text(
                      controller.data.value.name.toString(),
                      style: const TextStyle(
                        color: colorText,
                        fontSize: 22,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      controller.actionCoin(controller.data.value);
                    },
                    icon: Icon(
                      controller.isFavorite.value
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
                  Obx(
                    () => Text(
                      controller.data.value.currentPrice.toString(),
                      style: const TextStyle(
                          color: colorText,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
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
                  Obx(
                    () => Text(
                      controller.data.value.priceChangePercentage24h.toString(),
                      style: const TextStyle(
                          color: colorText,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
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

  Widget buildChart() => Obx(
        () => Container(
          padding: const EdgeInsets.all(10),
          height: 1000.w,
          child: charts.TimeSeriesChart(
            controller.history,
            animate: true,
            dateTimeFactory: const charts.LocalDateTimeFactory(),
          ),
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
          controller.selected.value = index;
          controller.getDataChart();
        },
        child: Obx(
          () => Text(
            text,
            style: TextStyle(
                color: (controller.selected.value == index)
                    ? colorWhite
                    : colorText,
                fontSize: 15),
          ),
        ),
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
                (controller.selected.value == index) ? colorGreen : colorWhite),
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
