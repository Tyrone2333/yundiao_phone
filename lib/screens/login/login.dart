import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:yundiao_phone/widgets/argon_buttons_flutter.dart';
import 'package:yundiao_phone/widgets/icon_badge.dart';
import 'package:yundiao_phone/screens/login/login_role_switcher.dart';
import 'package:yundiao_phone/widgets/rounded_loading_button.dart';

import 'package:yundiao_phone/util/data.dart';
import 'package:yundiao_phone/widgets/appbar/sample_appbar.dart';
import 'package:yundiao_phone/widgets/sample_input.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final RoundedLoadingButtonController _btnController =
      new RoundedLoadingButtonController();

  String currentRole = '媒体主';

  var textController = new TextEditingController();
  var pwd = '';

  void _doSomething() async {
    Timer(Duration(seconds: 1), () {
      _btnController.success();

      Timer(Duration(seconds: 1), () {
//        _btnController. stop();
      });
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: sampleAppBar(context: context, title: "用户登录"),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(80)),
          child: Column(
//            mainAxisAlignment: MainAxisAlignment.center,
//            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              // logo
              Container(
                padding: EdgeInsets.only(
                  top: ScreenUtil().setHeight(90),
                  bottom: ScreenUtil().setHeight(47),
                ),
                child: Image.asset(
                  'assets/img/login/logo-text.png',
                  width: ScreenUtil().setWidth(245),
                  height: ScreenUtil().setHeight(213),
                ),
              ),

              LoginRoleSwitcher(
                role: currentRole,
                onRoleChange: (res) => setState(() {
                  currentRole = res;
                }),
              ),

              // 请输入手机号码 输入框
              SampleInput(
                placeholder: '请输入手机号码',
                icon: 'assets/img/login/user.png',
                initValue: pwd,
                onTextChange: (text) {
                  setState(() {
                    pwd = text;
                  });
                },
              ),
              // 请输入密码 输入框
              SampleInput(
                placeholder: '请输入密码',
                icon: 'assets/img/login/pwd.png',
                initValue: pwd,
                onTextChange: (text) {
                  setState(() {
                    pwd = text;
                  });
                },
              ),

              // 找回密码？立即注册
              Container(
                padding: EdgeInsets.only(
                  top: ScreenUtil().setHeight(20),
                  bottom: ScreenUtil().setHeight(60),
                ),
                child: DefaultTextStyle(
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(26),
                    color: Color(0xff555555),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('找回密码？'),
                      Text('立即注册'),
                    ],
                  ),
                ),
              ),

              // 可做登录
              ArgonButton(
                width: ScreenUtil().setWidth(588),
                // 按钮太矮在执行动画的时候会不够圆
                height: ScreenUtil().setWidth(100),
                text: '立即登录',
                onTap: (startLoading, stopLoading, btnState) async {
                  if (btnState == ButtonState.Idle) {
                    startLoading();
//                      await doNetworkRequest();
                    // 延时1s执行返回
                    await Future.delayed(Duration(seconds: 1), () {
//                        Navigator.of(context).pop();
                      print('延时1s执行');
                    });
                    print('当前 pwd : ${pwd}');

                    textController.text = '13546';
                    stopLoading();
                  }
                },
              ),
              Text(textController.text),
              SizedBox(
                height: ScreenUtil().setHeight(100),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    width: ScreenUtil().setWidth(216),
                    height: ScreenUtil().setHeight(2),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.centerRight,
                            end: Alignment.centerLeft,
//                        stops: [0.3, 0.5 ],
                            colors: [Color(0xffeaeaea), Color(0xfff4f4f4)])),
                  ),
                  Container(
                    child: Column(
                      children: <Widget>[
                        Image.asset(
                          'assets/img/login/wechat.png',
                          width: ScreenUtil().setWidth(120),
                          height: ScreenUtil().setWidth(120),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: ScreenUtil().setWidth(216),
                    height: ScreenUtil().setHeight(2),
                    decoration: BoxDecoration(gradient: LinearGradient(
//                        begin: Alignment.center,
//                        end: Alignment(1,0),
//                        stops: [0.3, 0.5 ],
                        colors: [Color(0xffe7e7e7), Color(0xfffafafa)])),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(
                  top: ScreenUtil().setHeight(30),
                  bottom: ScreenUtil().setHeight(100),
                ),
//                padding: EdgeInsets.only(
//                  top: ScreenUtil().setHeight(100),
//                  bottom: ScreenUtil().setHeight(100),
//                ),
                child: Text('微信登录',
                    style: TextStyle(
                      color: Color(0xff333333),
                      fontSize: ScreenUtil().setSp(28),
                    )),
              ),

              // 按钮变✔
//              RoundedLoadingButton(
//                child: Text('Tap me!', style: TextStyle(color: Colors.white)),
//                controller: _btnController,
//                onPressed: _doSomething,
//              ),
            ],
          ),
        ),
      ),
    );
  }
}
