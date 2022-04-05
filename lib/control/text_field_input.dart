import 'package:flutter/material.dart';

import '../resource/color.dart';

class TextFieldInput extends StatefulWidget {
  const TextFieldInput({Key? key,required this.text,required this.fontsize}) : super(key: key);
  final String text;
  final double fontsize;

  @override
  State<TextFieldInput> createState() => _TextFieldInputState(text,fontsize);
}

class _TextFieldInputState extends State<TextFieldInput> {
  final String text;
  final double fontsize;

  _TextFieldInputState(this.text, this.fontsize);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      child: TextField(
        onChanged: (newString){},
        keyboardType: TextInputType.emailAddress,
        style: TextStyle(
            fontSize: fontsize,
            color: color_text,
        ),
        decoration: InputDecoration(
            labelText: text,
            hintText: text,
            //fillColor, filled thay đổi màu background textfield
            fillColor: Colors.white,
            filled: true,
            hintStyle: TextStyle(
              fontSize: fontsize,

            ),
            border: OutlineInputBorder(
              borderSide: const BorderSide(color: color_white),
                borderRadius: BorderRadius.circular(10)
            )
        ),
        maxLines: 1,
      ),
    );
  }
}
