import 'dart:ui';

import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:hocflutter/resource/color.dart';

class Button extends StatelessWidget {
  const Button(
      {Key? key,
      required this.text,
      required this.onClick,
      this.numWith,
      this.numHeight = 40,
      this.styleButton = false,
      this.iconData})
      : super(key: key);
  final String text;
  final Function() onClick;
  final double? numWith;
  final double? numHeight;
  final bool? styleButton;
  final IconData? iconData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: numHeight,
        width: numWith,
        child: iconData != null
            ? ElevatedButton.icon(
                icon: styleButton != null && styleButton == true
                    ? iconStyleTrue(iconData!)
                    : iconStyleFalse(iconData!),
                onPressed: onClick,
                label: Text(
                  text,
                  style: styleButton != null && styleButton == true
                      ? textStyleTrue()
                      : textStyleFalse(),
                ),
                style: styleButton != null && styleButton == true
                    ? buttonStyleTrue()
                    : buttonStyleFalse(),
              )
            : ElevatedButton(
                onPressed: onClick,
                child: Text(
                  text,
                  style: styleButton != null && styleButton == true
                      ? textStyleTrue()
                      : textStyleFalse(),
                ),
                style: styleButton != null && styleButton == true
                    ? buttonStyleTrue()
                    : buttonStyleFalse(),
              ));
  }
}

ButtonStyle buttonStyleTrue() => ButtonStyle(

    /// màu khi focus
    /// overlayColor: MaterialStateProperty.all(color_red),
    /// chưa biết
    ///foregroundColor: MaterialStateProperty.all(color_red),
    /// shadowColor: MaterialStateProperty.all(color_red),
    backgroundColor: MaterialStateProperty.all(colorBtn),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
      side: const BorderSide(
        color: colorBtn,
        width: 1,
      ),
    )));

ButtonStyle buttonStyleFalse() => ButtonStyle(
    overlayColor: MaterialStateProperty.all(colorBtnFocus),

    ///foregroundColor: MaterialStateProperty.all(color_red),
    /// shadowColor: MaterialStateProperty.all(color_red),
    backgroundColor: MaterialStateProperty.all(colorWhite),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
      side: const BorderSide(
        color: colorBtn,
        width: 1,
      ),
    )));

TextStyle textStyleTrue() => const TextStyle(
      color: colorWhite,
      fontSize: 15,
    );

TextStyle textStyleFalse() => const TextStyle(
      color: colorBtn,
      fontSize: 15,
    );

Icon iconStyleTrue(IconData iconData) =>
    Icon(iconData, color: colorWhite, size: 20);

Icon iconStyleFalse(IconData iconData) =>
    Icon(iconData, color: colorBtn, size: 20);
