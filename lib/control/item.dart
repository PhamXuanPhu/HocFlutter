import 'package:flutter/cupertino.dart';
import 'package:hocflutter/resource/color.dart';
import 'package:hocflutter/resource/render/dimens.dart';

import '../resource/assets.dart';

Widget item(String data) => Padding(
      padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
      child: Container(
        color: colorMain,
        width: 100.w,
        height: 150.w,
        child: Stack(
          children: <Widget>[
            Positioned(
                top: 0,
                left: 0,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                  child: Image.asset(
                    Images.productImage,
                    fit : BoxFit.contain,
                    width: 85.w,
                    height: 140.w,
                  ),
                )),
            Positioned(
                bottom: 0,
                left: 0,
                height: 25.w,
                width: 100.w,
                child: Container(
                  color: colorTextTop,
                  child: Center(
                    child: Text(data,
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: colorWhite, fontSize: 15)),
                  ),
                ))
          ],
        ),
      ),
    );
