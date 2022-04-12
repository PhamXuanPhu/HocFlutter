import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import '../resource/color.dart';

class TextFieldCustom extends StatefulWidget {
  TextFieldCustom({
    Key? key,
    required this.text,
    this.fontSize,
    this.icon,
    required this.isPassword,
    this.onChanged,
  }) : super(key: key);
  final String text;
  final double? fontSize;
  final Widget? icon;
  final bool isPassword;
  final Function(String)? onChanged;

  @override
  State<TextFieldCustom> createState() => _TextFieldCustomState();
}

class _TextFieldCustomState extends State<TextFieldCustom> {
  final controller = TextEditingController();
  bool enableIsPassword = true;

  @override
  void initState() {
    super.initState();
    controller.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      textAlignVertical: TextAlignVertical.center,
      controller: controller,
      onChanged: (newString) {
        widget.onChanged!(newString);
      },
      keyboardType: TextInputType.emailAddress,

      /// thay đổi kiểu của password
      obscureText: widget.isPassword ? enableIsPassword : false,
      style: TextStyle(
        fontSize: widget.fontSize,
        color: colorText,
      ),
      decoration: InputDecoration(

        ///labelText: text,
          hintText: widget.text,

          /// thêm icon trước
          prefixIcon: widget.icon,

          /// icon clear or password
          ///  suffixIcon: widget.isPassWord
          ///       ? ShowIconPassword()
          ///     : showIconClear(clearController),

          suffixIcon: widget.isPassword
              ? IconButton(
              icon: enableIsPassword
                  ? const Icon(
                CommunityMaterialIcons.eye_off_outline,
                color: colorText,
                size: 20,
              )
                  : const Icon(
                CommunityMaterialIcons.eye_outline,
                color: colorText,
                size: 20,
              ),
              onPressed: () => setState(() =>
              {enableIsPassword = !enableIsPassword}))
              : showIconClear(controller),

          ///fillColor, filled thay đổi màu background textfield
          fillColor: Colors.white,
          filled: true,
          hintStyle: TextStyle(
            fontSize: widget.fontSize,
            color: colorHint
          ),
          border: OutlineInputBorder(
            
              /// thay đổi border
              borderSide: const BorderSide(color: colorWhite),
              borderRadius: BorderRadius.circular(10))),
      maxLines: 1,
    );
  }
}

/// setup icon clear
IconButton? showIconClear(TextEditingController clearController) =>
    (clearController.text.isEmpty
        ? null
        : IconButton(
      onPressed: () => clearController.clear(),
      icon: const Icon(
        CommunityMaterialIcons.close_circle_outline,
        color: colorText,
        size: 20,
      ),
    ));

/// chưa sài, không work

class ShowIconPassword extends StatefulWidget {
  const ShowIconPassword({Key? key}) : super(key: key);

  @override
  State<ShowIconPassword> createState() => _ShowIconPasswordState();
}

class _ShowIconPasswordState extends State<ShowIconPassword> {
  bool enableIsPassword = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: enableIsPassword
            ? const Icon(
          CommunityMaterialIcons.eye_off_outline,
          color: colorText,
          size: 20,
        )
            : const Icon(
          CommunityMaterialIcons.eye_outline,
          color: colorText,
          size: 20,
        ),
        onPressed: () => setState(() => enableIsPassword = !enableIsPassword));
  }
}
