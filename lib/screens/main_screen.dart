import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:yundiao_phone/screens/chats.dart';
import 'package:yundiao_phone/screens/friends.dart';
import 'package:yundiao_phone/screens/home.dart';
import 'package:yundiao_phone/screens/login/login.dart';
import 'package:yundiao_phone/screens/notifications.dart';
import 'package:yundiao_phone/screens/profile.dart';
import 'package:yundiao_phone/screens/viewpager_demo_page.dart';
import 'package:yundiao_phone/widgets/icon_badge.dart';

import 'NestedScrollViewPage.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  PageController _pageController;
  int _page = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _page);
  }

  // 底部图标大小
  double navigationBarSize = 20;

  @override
  Widget build(BuildContext context) {
    //填入设计稿中设备的屏幕尺寸

    //默认 width : 1080px , height:1920px , allowFontScaling:false
    //设置字体大小根据系统的“字体大小”辅助选项来进行缩放,默认为false
    ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: true);

    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        onPageChanged: onPageChanged,
        children: <Widget>[
          Login(),
          Friends(),
          ViewPagerDemoPage(),
          NestedScrollViewPage(),
          Profile(),
          Notifications(),
          Chats(),

          Home(),
        ],
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          // sets the background color of the `BottomNavigationBar`
          canvasColor: Theme.of(context).primaryColor,
          // sets the active color of the `BottomNavigationBar` if `Brightness` is light
          primaryColor: Theme.of(context).accentColor,
          textTheme: Theme.of(context).textTheme.copyWith(
                caption: TextStyle(color: Colors.grey[500]),
              ),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.message,
              ),
              title: Container(height: 0.0),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.group,
              ),
              title: Container(height: 0.0),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              title: Container(height: 0.0),
            ),
            BottomNavigationBarItem(
              icon: IconBadge(
                icon: Icons.notifications,
              ),
              title: Container(height: 0.0),
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/img/footer_4.png',
                width: navigationBarSize,
              ),
              activeIcon: Image.asset(
                'assets/img/footer_4_on.png',
                width: navigationBarSize,
              ),
              title: Container(height: 0.0),
            ),
          ],
          onTap: navigationTapped,
          currentIndex: _page,
        ),
      ),
    );
  }

  void navigationTapped(int page) {
    _pageController.jumpToPage(page);
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  void onPageChanged(int page) {
    setState(() {
      this._page = page;
    });
  }
}
