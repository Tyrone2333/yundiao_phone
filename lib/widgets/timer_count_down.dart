import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'dart:async';

class TimerCountDownWidget extends StatefulWidget {
//  Function onTimerFinish;
  final Function onTap;

  /// 倒计时按钮组件
  TimerCountDownWidget({
//    this.onTimerFinish,
    this.onTap,
  }) : super();

  @override
  State<StatefulWidget> createState() => TimerCountDownWidgetState();
}

class TimerCountDownWidgetState extends State<TimerCountDownWidget> {
  Timer _timer;
  int _countdownTime = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(160),
      height: ScreenUtil().setHeight(60),
      child: OutlineButton(
        padding: EdgeInsets.all(0),
        highlightedBorderColor: Color(0xffCCCCCC),
        onPressed: () {
          widget.onTap(_countdownTime);
          if (_countdownTime == 0) {
            setState(() {
              _countdownTime = 60;
            });
            //开始倒计时
            startCountdownTimer();
          }
        },
//        color: Colors.black12,
        child: Text(
          _countdownTime > 0 ? '$_countdownTime S' : '获取验证码',
          style: TextStyle(
            fontSize: ScreenUtil().setSp(24),
            color: Color(0xff999999),
//            color: _countdownTime > 0
//                ? Colors.white
//                : Color.fromARGB(255, 17, 132, 255),
          ),
        ),
      ),
    );
  }

  void startCountdownTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      setState(() {
        if (_countdownTime < 1) {
//          widget.onTimerFinish();
          _timer.cancel();
        } else {
          _countdownTime = _countdownTime - 1;
        }
      });
    });
  }

  @override
  void dispose() {
    if (_timer != null) {
      _timer.cancel();
    }
    super.dispose();
  }
}
