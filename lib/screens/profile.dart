import 'dart:math';
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:yundiao_phone/screens/login/login.dart';
import 'package:yundiao_phone/util/Constants.dart';
import 'package:yundiao_phone/util/color_utils.dart';
import 'package:yundiao_phone/util/data.dart';
import 'package:yundiao_phone/util/global_function.dart';
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

  _launchURL() async {
    // todo getPackageName 获取包名
    const url = 'market://details?id=com.tmall.wireless';
//    const url = 'yundiao://yundiao.com/home?pp=big\&uid=123&token=abc';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  // 提现按钮
  handleWithDrawal(startLoading, stopLoading, btnState) async {

    $warn('提现');

    $confirm('确认?', context, btnOkOnPress: () {
      print('ok');
    });
  }

  onBottom(Widget child) => Positioned.fill(
        child: Align(
          alignment: Alignment.bottomCenter,
          child: child,
        ),
      );

  handleLogout() {
    print('handleLogout');
    Navigator.of(context, rootNavigator: true).push(
      MaterialPageRoute(
        builder: (BuildContext context) {
          return Login();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var navList = [
      {'icon': "assets/img/user/nav1.png", 'text': '接单盈利'},
      {'icon': "assets/img/user/nav2.png", 'text': '我的订单'},
      {'icon': "assets/img/user/nav3.png", 'text': '账户设置'},
      {'icon': "assets/img/user/nav4.png", 'text': '财务管理'},
      {'icon': "assets/img/user/nav5.png", 'text': '我的客服'},
    ];
    return Scaffold(
//      appBar: AppBar(
//        title: new Text("AnimBgDemoPage"),
//      ),
      body: SingleChildScrollView(
        child: Container(
          color: Color(0xFFf3f3f3),
          width: MediaQuery.of(context).size.width,

//          height: double.infinity, // <-----
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              // 头部
              Container(
                width: ScreenUtil().setWidth(750),
                height: ScreenUtil().setHeight(350),
                child: Stack(
                  children: <Widget>[
                    // 填充背景,不使用动画
//                    Positioned.fill(child: AnimatedBackground()),
                    Positioned.fill(child: Container(
                      color: Color(0xfffd7e2b),
                    )),
                    onBottom(AnimatedWave(
                      height: 60,
                      speed: 1.0,
                    )),
                    onBottom(AnimatedWave(
                      height: 140,
                      speed: 0.9,
                      offset: pi,
                    )),
                    onBottom(AnimatedWave(
                      height: 80,
                      speed: 1.2,
                      offset: pi / 2,
                    )),
                    // 绝对定位的齿轮
                    Positioned(
                      // 设 top 会有状态栏的高度
                      bottom: ScreenUtil().setHeight(240),
                      right: ScreenUtil().setWidth(30),
                      child: new Container(
                        child: new Icon(
                          Icons.settings,
                          size: ScreenUtil().setWidth(40),
                          color: ColorUtils.lightPrimary,
                        ),
                      ),
                    ),
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
                                    style: styles['textFFF28'],
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
                                  color: Theme.of(context).accentColor,
                                  fontSize: ScreenUtil().setSp(28),
                                ),
                              ),
                              loader: Container(
                                padding: EdgeInsets.all(10),
                                child: SpinKitDoubleBounce(
                                  color: Colors.white,
                                ),
                              ),
                              onTap: handleWithDrawal,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // 可用金额等
              Container(
                padding:
                    EdgeInsets.symmetric(vertical: ScreenUtil().setWidth(26)),
                color: Theme.of(context).accentColor,
                child: DefaultTextStyle(
                  style: styles['textFFF28'],
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Text(
                            random.nextInt(10000).toString(),
                            style: TextStyle(
                              fontSize: ScreenUtil().setSp(34),
                            ),
                          ),
                          SizedBox(height: 4),
                          Text("可用金额"),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Text(
                            random.nextInt(10000).toString(),
                            style: TextStyle(
                              fontSize: ScreenUtil().setSp(34),
                            ),
                          ),
                          SizedBox(height: 4),
                          Text("冻结金额"),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Text(
                            random.nextInt(10000).toString(),
                            style: TextStyle(
                              fontSize: ScreenUtil().setSp(34),
                            ),
                          ),
                          SizedBox(height: 4),
                          Text("可提现金额"),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              // build
              Container(
//                color: Color(0xffF3F3F3),
                padding: EdgeInsets.only(top: ScreenUtil().setHeight(20)),
                decoration: BoxDecoration(
                  color: Color(0xffF3F3F3),
//                  gradient: RadialGradient(colors: [
//                    Colors.grey[800],
//                    Colors.black,
//                  ], radius: 0.85, focal: Alignment.center),
                ),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  primary: false,
                  padding: EdgeInsets.all(0),
                  itemCount: 6,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 1,
                    mainAxisSpacing: 1,
                    crossAxisCount: 3,
                    childAspectRatio: ScreenUtil().setWidth(250) /
                        ScreenUtil().setHeight(190),
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    // dart 获取超过数组长度会报错,超过了就返回一个空白容器,不然会把背景的灰色露出来
                    var len = navList.length;
                    var nav = len - 1 >= index ? navList[index] : null;
                    if (nav == null) {
                      return Container(color: Color(0xffffffff));
                    }
                    // 每一个卡片
                    return Container(
                      color: Color(0xffffffff),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Image.asset(
                            nav['icon'],
                            width: ScreenUtil().setWidth(48),
                            height: ScreenUtil().setWidth(48),
                            fit: BoxFit.cover,
                          ),
                          SizedBox(height: ScreenUtil().setHeight(20)),
                          Text(
                            nav['text'],
                            style: TextStyle(
                              fontSize: ScreenUtil().setSp(30),
                              color: Color(0xff888888),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),

              // todo 底部要占满
              // 退出
              GestureDetector(
                onTap: handleLogout,
                child: Container(
                  width: ScreenUtil().setWidth(750),
                  height: ScreenUtil().setHeight(90),
                  color: Colors.white,
                  margin: EdgeInsets.only(top: ScreenUtil().setHeight(60)),
                  child: Center(
                    child: Text(
                      '安全退出',
                      style: TextStyle(
                          fontSize: ScreenUtil().setSp(30),
                          color: Color(0xff333333)),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: _launchURL,
                child: Container(
                  width: ScreenUtil().setWidth(750),
                  height: ScreenUtil().setHeight(90),
                  color: Colors.white,
                  margin: EdgeInsets.only(top: ScreenUtil().setHeight(60)),
                  child: Center(
                    child: Text(
                      '打开商店',
                      style: TextStyle(
                          fontSize: ScreenUtil().setSp(30),
                          color: Color(0xff333333)),
                    ),
                  ),
                ),
              ),

//              SizedBox.expand(
//                child: Container(
//                  color: Colors.black,
//                  child: Image(
//                    fit: BoxFit.fitHeight,
//                    image: NetworkImage(Constants.defaultAvatar),
//                  ),
//                ),
//              ),
            ],
          ),
        ),
      ),
    );
  }
}

// 要共用样式
var styles = {
  'textFFF28': TextStyle(
    fontSize: ScreenUtil().setSp(28),
    color: ColorUtils.lightPrimary,
  ),
};
