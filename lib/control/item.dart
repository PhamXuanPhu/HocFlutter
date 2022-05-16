import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hocflutter/resource/color.dart';
import 'package:hocflutter/resource/render/dimens.dart';
import '../layout/coin_detail/layout_coin_detail.dart';
import '../layout/coin_detail/layout_coindetail.dart';
import '../models/coin.dart';
import 'package:intl/intl.dart';

class ItemCoin extends StatelessWidget {
  ItemCoin({Key? key, required this.data}) : super(key: key);
  final Coin data;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CoinDetailPage(data: data)),
        );
      },
      child: Container(
        margin: const EdgeInsets.fromLTRB(5, 5, 5, 0),
        width: 1.wf,
        height: 190.w,
        decoration: BoxDecoration(
          border: Border.all(color: colorText.withOpacity(0.4), width: 1),
          color: colorWhite,
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: 25.w,),
            Image.network(data.image ?? '', height: 130.w, width: 130.w),
            Center(
              child: Container(
                width: 835.w,
                height: 155.w,
                margin: const EdgeInsets.all(10),
                color: colorWhite,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(child: title(data.name.toString())),
                        Text(
                          data.marketCapRank.toString(),
                          textAlign: TextAlign.end,
                          style: const TextStyle(
                            color: colorText,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        text(data.currentPrice ?? 0),
                        value(data.priceChangePercentage24h.toString(),
                            data.priceChangePercentage24h ?? 0)
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget title(String data) => Text(
      data,
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(
          color: colorMain, fontSize: 16, fontWeight: FontWeight.bold),
    );

Widget text(double data) => Text(
      NumberFormat.currency(locale: 'en',symbol: 'USD ').format(data),
      overflow: TextOverflow.ellipsis,
      textWidthBasis: TextWidthBasis.parent,
      maxLines: 1,
      style: const TextStyle(
        color: colorText,
        fontSize: 15,
      ),
    );

Widget value(String text, num colorValue) => Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: colorValue > 0
            ? colorGreen.withOpacity(0.1)
            : colorRed.withOpacity(0.1),
        borderRadius: const BorderRadius.all(Radius.circular(5.0)),
      ),
      child: Text(
        '$text %',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: colorValue > 0 ? colorGreen : colorRed,
          fontSize: 15,
        ),
      ),
    );
