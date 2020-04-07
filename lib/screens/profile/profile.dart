import 'dart:math';
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:yundiao_phone/util/Constants.dart';
import 'package:yundiao_phone/util/color_utils.dart';
import 'package:yundiao_phone/util/data.dart';
import 'package:yundiao_phone/widgets/anim_bg_demo_page.dart';
import 'package:yundiao_phone/widgets/argon_buttons_flutter.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:yundiao_phone/widgets/rounded_loading_button.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  static Random random = Random();

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

  onBottom(Widget child) => Positioned.fill(
        child: Align(
          alignment: Alignment.bottomCenter,
          child: child,
        ),
      );

  @override
  Widget build(BuildContext context) {
    print(ScreenUtil.statusBarHeight);

    return Scaffold(
      body: SingleChildScrollView(
//        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
//              SizedBox(height: 40),
              Container(
                width: ScreenUtil().setWidth(750),
                height: ScreenUtil().setHeight(350),
                child: Stack(
                  children: <Widget>[
                    Positioned.fill(child: AnimatedBackground()),
                    onBottom(AnimatedWave(
                      height: 180,
                      speed: 1.0,
                    )),
                    onBottom(AnimatedWave(
                      height: 120,
                      speed: 0.9,
                      offset: pi,
                    )),
                    onBottom(AnimatedWave(
                      height: 220,
                      speed: 1.2,
                      offset: pi / 2,
                    )),
                    Positioned(
//                      top: ScreenUtil().setHeight(150),
                      bottom: ScreenUtil().setHeight(80),

                      // 头部,头像,个人信息
                      child: Container(
                        width: ScreenUtil().setWidth(750),
                        padding: EdgeInsets.only(left: 20, right: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  width: ScreenUtil().setWidth(120),
                                  height: ScreenUtil().setWidth(120),
                                  child: CircleAvatar(
                                    backgroundImage:
                                        NetworkImage(Constants.defaultAvatar),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(left: 12),
                                  // 如果要继承文本样式
                                  child: DefaultTextStyle(
                                    style: TextStyle(
                                      fontSize: ScreenUtil().setSp(28),
                                      color: ColorUtils.lightPrimary,
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          '云貂',
                                          style: TextStyle(
                                            fontSize: ScreenUtil().setSp(34),
                                            height: 2,
                                          ),
                                        ),
                                        Text('15555555555'),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
//                            RaisedButton(
//                              onPressed: () {
//                                print('提现');
//                              },
//                              child: Text('提现'),
//                            ),
                            ArgonButton(
                              width: ScreenUtil().setWidth(120),
                              height: ScreenUtil().setHeight(55),
                              borderRadius: ScreenUtil().setWidth(5),
                              color: Color(0xFFffffff),
                              child: Text(
                                "提现",
                                style: TextStyle(
                                  color: ColorUtils.lightAccent,
                                  fontSize: ScreenUtil().setSp(28),
                                ),
                              ),
                              loader: Container(
                                padding: EdgeInsets.all(10),
                                child: SpinKitDoubleBounce(
                                  color: Colors.white,
                                ),
                              ),
                              onTap:
                                  (startLoading, stopLoading, btnState) async {
                                print('提现');
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

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
                  }),

              SizedBox(height: 10),
              Text(
                names[random.nextInt(10)],
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
              SizedBox(height: 3),

              Text(
                "Status should be here",
                style: TextStyle(),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  FlatButton(
                    child: Icon(
                      Icons.message,
                      color: Colors.white,
                    ),
                    color: Colors.grey,
                    onPressed: () {},
                  ),
                  SizedBox(width: 10),
                  FlatButton(
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                    color: Theme.of(context).accentColor,
                    onPressed: () {},
                  ),
                ],
              ),

              SizedBox(height: 40),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Text(
                          random.nextInt(10000).toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "Posts",
                          style: TextStyle(),
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Text(
                          random.nextInt(10000).toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "Friends",
                          style: TextStyle(),
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Text(
                          random.nextInt(10000).toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "Groups",
                          style: TextStyle(),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                primary: false,
                padding: EdgeInsets.all(5),
                itemCount: 15,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 200 / 200,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Image.asset(
                      "assets/cm${random.nextInt(10)}.jpeg",
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
