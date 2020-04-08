import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:yundiao_phone/widgets/argon_buttons_flutter.dart';
import 'package:yundiao_phone/widgets/rounded_loading_button.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final RoundedLoadingButtonController _btnController =
  new RoundedLoadingButtonController();

  void _doSomething() async {
    Timer(Duration(seconds: 1), () {
      _btnController.success();

      Timer(Duration(seconds: 1), () {
//        _btnController. stop();
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Container(child: Column(
      children: <Widget>[
        // 按钮变✔
        RoundedLoadingButton(
          child: Text('Tap me!', style: TextStyle(color: Colors.white)),
          controller: _btnController,
          onPressed: _doSomething,
        ),

        // 可做登录
        ArgonButton(
          height: 50,
          width: 300,
          borderRadius: 5.0,
          color: Color(0xFF7866FE),
          child: Text(
            "Continue",
            style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w700),
          ),
          loader: Container(
            padding: EdgeInsets.all(10),
            child: SpinKitDoubleBounce(
              color: Colors.white,
            ),
          ),
          onTap: (startLoading, stopLoading, btnState) async {
            if (btnState == ButtonState.Idle) {
              startLoading();
//                      await doNetworkRequest();
              // 延时1s执行返回
              await Future.delayed(Duration(seconds: 2), () {
//                        Navigator.of(context).pop();
                print('延时1s执行');
              });
              stopLoading();
            }
          },
        ),

        SizedBox(height: 20),

      ],
    ),);
  }
}

