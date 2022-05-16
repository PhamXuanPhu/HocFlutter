import 'package:flutter/material.dart';
import 'package:hocflutter/resource/color.dart';
import 'package:hocflutter/control/textfiled_custom.dart';

import 'layout/home/layout_home.dart';
import 'layout/login/layout_login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
    );
  }
}



