import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void $warn(
  String text, {
  gravity: ToastGravity.TOP,
  toastLength: Toast.LENGTH_SHORT,
}) {
  Fluttertoast.cancel();

  Fluttertoast.showToast(
    msg: text,
    toastLength: toastLength,
    gravity: gravity,
//    timeInSecForIosWeb: 1,
//    backgroundColor: Color(0x55000000),
//    textColor: Colors.white,
//    fontSize: 16.0,
  );
}

// 连个提示框都要自己封装...
Future<void> $confirm(
  text,
  context, {
  final Function btnOkOnPress,
  title = '提示',
}) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(text),
            ],
          ),
        ),
        actions: <Widget>[
          FlatButton(
            child: Text('确定'),
            onPressed: () {
              if (btnOkOnPress != null) {
                btnOkOnPress();
              }
              Navigator.of(context).pop();
            },
          ),
          FlatButton(
            child: Text('取消'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
