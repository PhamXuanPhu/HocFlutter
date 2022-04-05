import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hocflutter/resource/color.dart';
import 'package:hocflutter/control/text_field_input.dart';

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
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color_main,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30, 50, 30, 100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
           const Image(
               image: NetworkImage('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
                width: 200,
                height: 200),
            const SizedBox(height:30),
            TextFieldInput(text: "User Name", fontsize: 15,),
            const SizedBox(height:30),
            TextFieldInput(text: "Password", fontsize: 15,),
            const SizedBox(height:30),
            Container(
              width: 300,
              child: ElevatedButton(child: const Text("Login"
              ,style: TextStyle(
                  color: color_main,
                  fontSize: 20,
                ),),
                onPressed:(){
                  print("login");
                },
                style: ButtonStyle(
                  // thay đổi màu background button
                  backgroundColor: MaterialStateProperty.all(color_white),
                ),
              ),
            ),
            const SizedBox(height: 30,),
            Container(
              width: 300,
              child: OutlinedButton(
                onPressed: (){
                  print("object");
                }, child: const Text("Signout"
              ,style: TextStyle(
                  fontSize: 20,
                  color: Colors.red,
                ),),

              ),
            )
          ],
        ),
      ),
    );
  }
}



