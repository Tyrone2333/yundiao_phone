import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:yundiao_phone/util/color_utils.dart';

var activeStyle = TextStyle(
  fontSize: ScreenUtil().setSp(30),
);
// 放外面不能用 Theme.of,现在还不清楚 Theme.of 和直接取 ColorUtils 定义的值有什么区别
//var selectedColor = Theme.of(context).accentColor;
var selectedColor = ColorUtils.lightAccent;
var unselectedColor = Color(0xff333333);

class LoginRoleSwitcher extends StatelessWidget {
  final role;
  final Function onRoleChange;

  LoginRoleSwitcher({
    @required this.role,
    @required this.onRoleChange,
  });

  Widget RoleText(text, bool selected) {
    return GestureDetector(
      onTap: () {
        onRoleChange(text);
      },
      child: Container(
        padding: EdgeInsets.only(bottom: ScreenUtil().setHeight(8)),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 1,
              color: selected ? selectedColor : Colors.transparent,
            ),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: selected ? selectedColor : unselectedColor,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: DefaultTextStyle(
        style: TextStyle(
          fontSize: ScreenUtil().setSp(30),
          color: unselectedColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            RoleText('媒体主', role == '媒体主'),
            // 中间的线
            Container(
              width: ScreenUtil().setWidth(1),
              height: ScreenUtil().setHeight(30),
              color: Color(0xffcccccc),
              margin:
                  EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(40)),
            ),
            RoleText('广告主', role == '广告主'),
          ],
        ),
      ),
    );
  }
}
