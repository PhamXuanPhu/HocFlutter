import 'package:flutter/material.dart';
import 'package:hocflutter/resource/color.dart';

class Button extends StatelessWidget {
  const Button(
      {Key? key,
      required this.text,
      required this.onClick,
      this.numWith,
      this.numHeight = 40,
      this.styleButton = StyleButton.main,
      this.iconData})
      : super(key: key);
  final String text;
  final Function() onClick;
  final double? numWith;
  final double? numHeight;
  final StyleButton? styleButton;
  final IconData? iconData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: numHeight,
        width: numWith,
        child: iconData != null
            ? ElevatedButton.icon(
                icon: styleButton == StyleButton.main
                    ? iconStyleMain(iconData!)
                    : iconStyleWhite(iconData!),
                onPressed: onClick,
                label: Text(
                  text,
                  style: styleButton == StyleButton.main
                      ? textStyleMain()
                      : textStyleWhite(),
                ),
                style: styleButton == StyleButton.main
                    ? buttonStyleMain()
                    : buttonStyleWhite(),
              )
            : ElevatedButton(
                onPressed: onClick,
                child: Text(
                  text,
                  style: styleButton == StyleButton.main
                      ? textStyleMain()
                      : textStyleWhite(),
                ),
                style: styleButton == StyleButton.main
                    ? buttonStyleMain()
                    : buttonStyleWhite(),
              ));
  }
}

ButtonStyle buttonStyleMain() => ButtonStyle(

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

ButtonStyle buttonStyleWhite() => ButtonStyle(
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

TextStyle textStyleMain() => const TextStyle(
      color: colorWhite,
      fontSize: 15,
    );

TextStyle textStyleWhite() => const TextStyle(
      color: colorBtn,
      fontSize: 15,
    );

Icon iconStyleMain(IconData iconData) =>
    Icon(iconData, color: colorWhite, size: 20);

Icon iconStyleWhite(IconData iconData) =>
    Icon(iconData, color: colorBtn, size: 20);

enum StyleButton { main, white }
