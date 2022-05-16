import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:hocflutter/layout/home/layout_100coin.dart';
import 'package:hocflutter/resource/color.dart';
import 'package:hocflutter/resource/render/dimens.dart';
import 'package:hocflutter/resource/assets.dart';
import '../../control/button.dart';
import '../../control/textfiled_custom.dart';
import '../home/layout_home.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[background(), body(context)],
    );
  }
}

/// setup background hình ảnh ở sau
Widget background() => Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 60.w,
            left: 20.w,
            child: Image.asset(Images.login),
          ),
          Positioned(
              right: 0,
              bottom: 0,
              child: Image.asset(
                Images.loginBottom,
                width: 75.w,
                height: 75.w,
              )),
          Positioned(
              top: 0,
              left: 0,
              child: Image.asset(
                Images.loginTop,
                width: 75.w,
                height: 75.w,
              ))
        ],
      ),
    );

/// setup form login ??? không đưa được vào body
Widget formLogin() => Scaffold(
      body: Column(
        children: [
          TextFieldCustom(
            onChanged: (newString) => {print(newString)},
            text: "text",
            icon: const Icon(
              CommunityMaterialIcons.email_outline,
              color: colorText,
              size: 20,
            ),
          ),
          SizedBox(
            height: 30.w,
          ),
          TextFieldCustom(
            onChanged: (newString) => {print(newString)},
            text: "text",
            isPassword: IsPassword.password,
            icon: const Icon(
              CommunityMaterialIcons.lock_outline,
              color: colorText,
              size: 20,
            ),
          ),
          SizedBox(
            height: 30.w,
          ),
          Button(
            text: 'Login',
            onClick: () => {print('da click')},
            numWith: 1000.w,
          ),
          SizedBox(
            height: 30.w,
          ),
          Button(
            text: 'Login',
            onClick: () => {print('da click')},
            numWith: 1000.w,
            styleButton: StyleButton.white,
          ),
        ],
      ),
    );

/// setup body
Widget body(BuildContext context) => Scaffold(
      backgroundColor: colorTrain,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SizedBox(
          height: 1.2.hf,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(30, 30, 30, 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Image.asset(
                      Images.logoApp,
                      width: 90.w,
                      height: 50.w,
                    )
                  ],
                ),
                SizedBox(
                  height: 100.w,
                ),
                TextFieldCustom(
                  onChanged: (newString) => {print(newString)},
                  text: "text",
                  icon: const Icon(
                    CommunityMaterialIcons.email_outline,
                    color: colorText,
                    size: 20,
                  ),
                ),
                SizedBox(
                  height: 20.w,
                ),
                TextFieldCustom(
                  onChanged: (newString) => {print(newString)},
                  text: "text",
                  isPassword: IsPassword.password,
                  icon: const Icon(
                    CommunityMaterialIcons.lock_outline,
                    color: colorText,
                    size: 20,
                  ),
                ),
                SizedBox(
                  height: 20.w,
                ),
                Button(
                  text: 'Login',
                  onClick: () => {print('da click')},
                  numWith: 1000.w,
                ),
                SizedBox(
                  height: 20.w,
                ),
                Button(
                  text: 'Login',
                  onClick: () => {
                    print('da click'),
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Coin100())),
                  },
                  numWith: 1000.w,
                  styleButton: StyleButton.white,
                  iconData: CommunityMaterialIcons.application_import,
                ),
                SizedBox(
                  height: 0.2.hf,
                ),
              ],
            ),
          ),
        ),
      ),
    );
