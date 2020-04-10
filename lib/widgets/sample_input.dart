import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

class SampleInput extends StatefulWidget {
  /// 只能初始化时候变更
  final initValue;
  final placeholder;
  final String icon;
  final Function onTextChange;

  /// 图标宽度,设计稿的像素
  final iconWidth;

  SampleInput({
    this.initValue,
    this.placeholder,
    this.icon,
    this.onTextChange,
    this.iconWidth = 42,
  });

  @override
  _SampleInputState createState() => _SampleInputState();
}

class _SampleInputState extends State<SampleInput> {
  var textController = new TextEditingController();

  @override
  void initState() {
    textController.text = widget.initValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(133),
      padding: EdgeInsets.only(
        top: ScreenUtil().setWidth(45),
      ),
      decoration: BoxDecoration(
          // 输入框底部的线
          border:
              Border(bottom: BorderSide(width: 1, color: Color(0xffe5e5e5)))),
      child: TextField(
        autofocus: true,
        controller: textController,
        onChanged: (text) {
          //内容改变的回调
          print('change $text');
          widget.onTextChange(text);
        },
//                  maxLines: 1,
        style: TextStyle(
          fontSize: 18.0,
          color: Theme.of(context).textTheme.title.color,
        ),
//                  keyboardType: TextInputType.numberWithOptions(),
////                  // 如果你想只输入数字,需要加上这个
//                  inputFormatters: <TextInputFormatter>[
//                    WhitelistingTextInputFormatter.digitsOnly
//                  ],
        decoration: InputDecoration(
          /// 搜索出来调整高度都是用这种方式,但是 input 始终还是有一个最小高度.<del>如果在外层 Container 强设高度,input 输入内容超过一行显示就会异常</del>,后来不知道为什么显示又正常了
          contentPadding: EdgeInsets.all(0),
          //here your padding
          // 设置的是 only,但是上下都会改变
//                         contentPadding: EdgeInsets.only(
////                           left: ScreenUtil().setWidth(13),
//                           top: ScreenUtil().setWidth(150),
////                           right: ScreenUtil().setWidth(13),
////                           bottom: ScreenUtil().setWidth(13),
//                         ),
//                          contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: BorderSide.none,
          ),
//                          enabledBorder: OutlineInputBorder(
//                            borderSide: BorderSide(
//                              color: Theme.of(context).accentColor,
//                            ),
//                            borderRadius: BorderRadius.circular(5.0),
//                          ),
          hintText: widget.placeholder,
          hintStyle: TextStyle(
            fontSize: ScreenUtil().setSp(26),
            color: Color(0xff999999),
          ),
          // icon 是在输入框的外部
//                          icon: new Icon(Icons.people),
          // prefixIcon 是在输入框的内部,前缀图标的最小尺寸为48px x 48px,直接传入一个 Image.asset 尺寸会无法设置
          prefixIcon: Container(
            width: 0,
            alignment: Alignment(-0.5, 0.0),
            child: Image.asset(
              widget.icon,
              width: ScreenUtil().setWidth(widget.iconWidth),
              height: ScreenUtil().setWidth(50),
            ),
          ),
//                            prefixStyle: TextStyle(
//                              width: ScreenUtil().setWidth(42),
//                              height: ScreenUtil().setWidth(50),
//                            )
        ),
      ),
    );
  }
}
