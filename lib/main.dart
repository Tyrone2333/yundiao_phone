import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yundiao_phone/screens/main_screen.dart';
import 'package:yundiao_phone/util/color_utils.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDark = false;

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: isDark ? ColorUtils.darkPrimary : ColorUtils.lightPrimary,
      statusBarIconBrightness: isDark ? Brightness.light : Brightness.dark,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: ColorUtils.appName,
      theme: isDark ? ColorUtils.darkTheme : ColorUtils.lightTheme,
      home: MainScreen(),
    );
  }
}
