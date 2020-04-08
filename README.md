# yundiao_phone

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

# 还原设计稿
[flutter_screenutil](https://github.com/OpenFlutter/flutter_screenutil/blob/master/README_CN.md)
##  API
```
    ScreenUtil().setWidth(540)  (sdk>=2.6 : 540.w) //根据屏幕宽度适配尺寸
    ScreenUtil().setHeight(200) (sdk>=2.6 : 200.h) //根据屏幕高度适配尺寸
    ScreenUtil().setSp(24)      (sdk>=2.6 : 24.sp)  //适配字体
    ScreenUtil().setSp(24, allowFontScalingSelf: true)  (sdk>=2.6 : 24.ssp) //适配字体(根据系统的“字体大小”辅助选项来进行缩放)

    ScreenUtil.pixelRatio       //设备的像素密度
    ScreenUtil.screenWidth      //设备宽度
    ScreenUtil.screenHeight     //设备高度
    ScreenUtil.bottomBarHeight  //底部安全区距离，适用于全面屏下面有按键的
    ScreenUtil.statusBarHeight  //状态栏高度 刘海屏会更高  单位px
    ScreenUtil.textScaleFactor //系统字体缩放比例

    ScreenUtil().scaleWidth  // 实际宽度的dp与设计稿px的比例
    ScreenUtil().scaleHeight // 实际高度的dp与设计稿px的比例
```
## 适配尺寸
传入设计稿的px尺寸：

根据屏幕宽度适配 width: ScreenUtil().setWidth(540),

根据屏幕高度适配 height: ScreenUtil().setHeight(200),

高度也根据setWidth来做适配可以保证不变形(当你想要一个正方形的时候)

setHeight方法主要是在高度上进行适配, 在你想控制UI上一屏的高度与实际中显示一样时使用.

例如:
```
//UI上是长方形:
Container(
           width: ScreenUtil().setWidth(375),
           height: ScreenUtil().setHeight(200),
            ),
            
//如果你想显示一个正方形:
Container(
           width: ScreenUtil().setWidth(300),
           height: ScreenUtil().setWidth(300),
            ),
```
# 打包
先决条件,把 `flutter\bin` 目录添加到环境变量 PATH. 如`E:\enzo\development\flutter_windows_v1.12.13+hotfix.8-stable_2\bin`

参考教程<https://flutterchina.club/android-release/>

1. 生成 keystore 放到 android/app 下
2. 生成 android/key.properties 文件,写入:
   ```
    storePassword=123456
    keyPassword=123456
    keyAlias=my-key-alias
    storeFile=my-release-key.keystore
   ```
3. 修改 android/app/build.gradle
4. 执行 `flutter build apk -v`,打包好的发布APK位于 <app dir>/build/app/outputs/apk/app-release.apk
5. 执行 flutter install 安装


# url schema

不同终端的元字符不同, cmd 中 `&` 就需要转义,执行下面的命令可以拉起app,但是只能接收到 `{pp: [big], uid: [123]}`,第三个参数没有传入
```
adb shell am start -W -a android.intent.action.VIEW -c android.intent.category.BROWSABLE -d "yundiao://yundiao.com/home?pp=big\&uid=123&token=abc"
```
