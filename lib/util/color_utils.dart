import 'package:flutter/material.dart';
class ColorUtils{

  static String appName = "Social app";

  //Colors for theme
//  static Color lightPrimary = Color(0xffffffff);
  static Color lightPrimary = Color(0xfffe7115);
  static Color darkPrimary = Colors.black;
//  static Color lightAccent = Colors.blue;
  // 底部 navbar / 顶部 appBar 主颜色
  static Color lightAccent = Color(0xfffe7115);
  static Color darkAccent = Colors.blueAccent;
  static Color lightBG = Color(0xfffcfcff);
  static Color darkBG = Colors.black;
  static Color badgeColor = Colors.red;

  static ThemeData lightTheme = ThemeData(
    backgroundColor: lightBG,
    primaryColor: lightPrimary,
    accentColor:  lightAccent,
    cursorColor: lightAccent,
    scaffoldBackgroundColor: lightBG,
    appBarTheme: AppBarTheme(
      elevation: 0,
      textTheme: TextTheme(
        title: TextStyle(
          color: darkBG,
          fontSize: 18.0,
          fontWeight: FontWeight.w800,
        ),
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    backgroundColor: darkBG,
    primaryColor: darkPrimary,
    accentColor: darkAccent,
    scaffoldBackgroundColor: darkBG,
    cursorColor: darkAccent,
    appBarTheme: AppBarTheme(
      elevation: 0,
      textTheme: TextTheme(
        title: TextStyle(
          color: lightBG,
          fontSize: 18.0,
          fontWeight: FontWeight.w800,
        ),
      ),
    ),
  );

  // 我们使用十六进制颜色的时候透明度使用的比较少，但是系统的方法总是带上透明度用着很不舒服，所以对十六进制用法做了一层封装处理,但是封装后 as 不会在左侧显示色块,自己取舍
  static Color hexColor(int hex,{double alpha = 1}){
    if (alpha < 0){
      alpha = 0;
    }else if (alpha > 1){
      alpha = 1;
    }
    return Color.fromRGBO((hex & 0xFF0000) >> 16 ,
        (hex & 0x00FF00) >> 8,
        (hex & 0x0000FF) >> 0,
        alpha);
  }

}
