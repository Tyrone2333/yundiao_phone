import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

/// 简单 appbar
Widget sampleAppBar({context, title}) {
  return PreferredSize(
    preferredSize: Size.fromHeight(ScreenUtil().setHeight(88)),
    child: AppBar(
      leading: IconButton(
        padding: EdgeInsets.all(0.0),
//          设计图的太细了
        icon: Image.asset(
          'assets/img/goback.png',
          width: ScreenUtil().setWidth(20),
          height: ScreenUtil().setHeight(34),
        ),
//          icon: Icon(
//            Icons.arrow_back_ios,
//            size: ScreenUtil().setWidth(32),
//          ),
        onPressed: () => Navigator.of(context).pop(),
      ),
//        leading: Icon(Icons.add),
      title: Text(
        title,
        style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: ScreenUtil().setSp(36),
            fontWeight: FontWeight.normal),
      ),
      centerTitle: true,
      iconTheme: IconThemeData(
        color: Theme.of(context).primaryColor,
      ),
      backgroundColor: Theme.of(context).accentColor,
      brightness: Brightness.dark,
    ),
  );
}
