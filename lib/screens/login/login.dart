import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:yundiao_phone/widgets/argon_buttons_flutter.dart';
import 'package:yundiao_phone/widgets/icon_badge.dart';
import 'package:yundiao_phone/screens/login/login_role_switcher.dart';
import 'package:yundiao_phone/widgets/rounded_loading_button.dart';

import 'package:yundiao_phone/util/data.dart';
import 'package:yundiao_phone/widgets/appbar/sample_appbar.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final RoundedLoadingButtonController _btnController =
      new RoundedLoadingButtonController();

  String currentRole = '媒体主';

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
              Container(
                height: ScreenUtil().setHeight(105),
                padding: EdgeInsets.only(
                  top: ScreenUtil().setHeight(17),
                ),
                decoration: BoxDecoration(
                    // 输入框底部的线
                    border: Border(
                        bottom:
                            BorderSide(width: 1, color: Color(0xffe5e5e5)))),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(
                        left: ScreenUtil().setWidth(9),
                      ),
                      child: Image.asset(
                        'assets/img/login/user.png',
                        width: ScreenUtil().setWidth(42),
                        height: ScreenUtil().setWidth(50),
                      ),
                    ),
                    Flexible(
                      child: TextField(
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Theme.of(context).textTheme.title.color,
                        ),
                        decoration: InputDecoration(
                          // 设置的是 only,但是上下都会改变
//                         contentPadding: EdgeInsets.only(
////                           left: ScreenUtil().setWidth(13),
//                           top: ScreenUtil().setWidth(150),
////                           right: ScreenUtil().setWidth(13),
////                           bottom: ScreenUtil().setWidth(13),
//                         ),
//                          contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide: BorderSide.none),
//                          enabledBorder: OutlineInputBorder(
//                            borderSide: BorderSide(
//                              color: Theme.of(context).accentColor,
//                            ),
//                            borderRadius: BorderRadius.circular(5.0),
//                          ),
                          hintText: "请输入手机号码",
                          hintStyle: TextStyle(
                            fontSize: ScreenUtil().setSp(26),
                            color: Color(0xff999999),
                          ),
                        ),
                        maxLines: 1,
                      ),
                    ),
                  ],
                ),
              ),

              // 请输入密码 输入框
              Container(
                height: ScreenUtil().setHeight(133),
                padding: EdgeInsets.only(
                  top: ScreenUtil().setWidth(45),
                ),
                decoration: BoxDecoration(
                    // 输入框底部的线
                    border: Border(
                        bottom:
                            BorderSide(width: 1, color: Color(0xffe5e5e5)))),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(
                        left: ScreenUtil().setWidth(9),
                      ),
                      child: Image.asset(
                        'assets/img/login/pwd.png',
                        width: ScreenUtil().setWidth(42),
                        height: ScreenUtil().setWidth(50),
                      ),
                    ),
                    Flexible(
                      child: TextField(
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Theme.of(context).textTheme.title.color,
                        ),
                        decoration: InputDecoration(
                          // 设置的是 only,但是上下都会改变
//                         contentPadding: EdgeInsets.only(
////                           left: ScreenUtil().setWidth(13),
//                           top: ScreenUtil().setWidth(150),
////                           right: ScreenUtil().setWidth(13),
////                           bottom: ScreenUtil().setWidth(13),
//                         ),
//                          contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide: BorderSide.none),
//                          enabledBorder: OutlineInputBorder(
//                            borderSide: BorderSide(
//                              color: Theme.of(context).accentColor,
//                            ),
//                            borderRadius: BorderRadius.circular(5.0),
//                          ),
                          hintText: "请输入密码",
                          hintStyle: TextStyle(
                            fontSize: ScreenUtil().setSp(26),
                            color: Color(0xff999999),
                          ),
                        ),
                        maxLines: 1,
                      ),
                    ),
                  ],
                ),
              ),

              // 密码

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
                height: ScreenUtil().setHeight(100),
                text: '立即登录',
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

              // todo 微信的渐变横线
              Container(
                padding: EdgeInsets.only(
                  top: ScreenUtil().setHeight(100),
                  bottom: ScreenUtil().setHeight(100),
                ),
                child: Column(
                  children: <Widget>[
                    Image.asset(
                      'assets/img/login/wechat.png',
                      width: ScreenUtil().setWidth(120),
                      height: ScreenUtil().setWidth(120),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        top: ScreenUtil().setHeight(30),
                      ),
                      child: Text('微信登录',
                          style: TextStyle(
                            color: Color(0xff333333),
                            fontSize: ScreenUtil().setSp(28),
                          )),
                    ),
                  ],
                ),
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
