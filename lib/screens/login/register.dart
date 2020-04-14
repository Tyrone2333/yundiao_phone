import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:yundiao_phone/widgets/argon_buttons_flutter.dart';
import 'package:yundiao_phone/screens/login/login_role_switcher.dart';
import 'package:yundiao_phone/widgets/rounded_loading_button.dart';

import 'package:yundiao_phone/widgets/appbar/sample_appbar.dart';
import 'package:yundiao_phone/widgets/sample_input.dart';
import 'package:yundiao_phone/widgets/timer_count_down.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final RoundedLoadingButtonController _btnController =
      new RoundedLoadingButtonController();

  String currentRole = '媒体主';

  var textController = new TextEditingController();
  var pwd = '';

  // 用户协议勾选
  var checked = false;

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
      appBar: sampleAppBar(context: context, title: "注册账号"),
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
                icon: 'assets/img/register/icon-1.png',
                initValue: pwd,
                iconWidth: 46,
                onTextChange: (text) {
                  setState(() {
                    pwd = text;
                  });
                },
              ),

              // 请输入验证码 输入框
              SampleInput(
                placeholder: '请输入验证码',
                icon: 'assets/img/register/icon-4.png',
                initValue: pwd,
                iconWidth: 46,
                onTextChange: (text) {
                  setState(() {
                    pwd = text;
                  });
                },
                suffixIcon: Container(
                  // 只有这样才能设置宽高
                  width: ScreenUtil().setWidth(160),
                  alignment: Alignment(-0.5, 0.0),
                  child: TimerCountDownWidget(onTap: (countdownTime) {
                    print('countdownTime $countdownTime');
                  }),
                ),
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
              // 确认密码 输入框
              SampleInput(
                placeholder: '确认密码',
                icon: 'assets/img/login/pwd.png',
                initValue: pwd,
                onTextChange: (text) {
                  setState(() {
                    pwd = text;
                  });
                },
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    checked = !checked;
                  });
                },
                child: Container(
                  // 加大可操作面积
                  color: Color(0x00cccccc),
                  padding: EdgeInsets.symmetric(
                    vertical: ScreenUtil().setHeight(34),
                  ),
                  child: Flex(
                    direction: Axis.horizontal,
//                  mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(
                          top: ScreenUtil().setWidth(4),
                          right: ScreenUtil().setWidth(22),
                        ),
                        child: Image.asset(
                          checked
                              ? 'assets/img/register/gou_on.png'
                              : 'assets/img/register/gou.png',
                          width: ScreenUtil().setWidth(32),
                          height: ScreenUtil().setWidth(32),
                        ),
                      ),
                      Expanded(
                        child: RichText(
                          text: TextSpan(
                            style: TextStyle(
                              fontSize: ScreenUtil().setSp(26),
                              color: Color(0xff999999),
                            ),
//                      '我已阅读并同意',
                            children: [
                              TextSpan(text: '我已阅读并同意'),
                              TextSpan(
                                  text: '《云貂盈利平台用户注册协议》',
                                  style: TextStyle(
                                    color: Theme.of(context).accentColor,
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
//              Container(
//                child: Row(
//                  children: <Widget>[
//                    Image.asset(
//                      'assets/img/register/gou_on.png',
//                      width: ScreenUtil().setWidth(32),
//                      height: ScreenUtil().setWidth(32),
//                    ),
//                    Wrap(children: <Widget>[
//                      Text('text 1'),
//                      Text('我已阅读并同意《云貂盈利平台用户注册协议》'),
//
//                    ],),
//                  ],
//                ),
//              ),

              // 可做登录
              ArgonButton(
                width: ScreenUtil().setWidth(588),
                // 按钮太矮在执行动画的时候会不够圆
                height: ScreenUtil().setWidth(100),
                text: '立即注册',
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

              // 总高度没有一屏,在底部填充一个空盒子高度,否则上面按钮的阴影会被截断
              SizedBox(height: ScreenUtil().setHeight(10)),
            ],
          ),
        ),
      ),
    );
  }
}
