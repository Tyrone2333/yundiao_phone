import 'dart:math';
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yundiao_phone/util/data.dart';
import 'package:yundiao_phone/widgets/argon_buttons_flutter.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:yundiao_phone/widgets/rounded_loading_button.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  static Random random = Random();

  final RoundedLoadingButtonController _btnController = new RoundedLoadingButtonController();

  void _doSomething() async {
    Timer(Duration(seconds: 1), () {
      _btnController.success();

      Timer(Duration(seconds: 1), () {
//        _btnController. stop();


      });
    });


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
//        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 40),
//              Container(
//                child:
//
//              ),
              RoundedLoadingButton(
                child: Text('Tap me!', style: TextStyle(color: Colors.white)),
                controller: _btnController,
                onPressed: _doSomething,
              ),
              ArgonButton(
                  height: 50,
                  width: 300,
                  borderRadius: 5.0,
                  color: Color(0xFF7866FE),
                  child: Text(
                    "Continue",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w700),
                  ),
                  loader: Container(
                    padding: EdgeInsets.all(10),
                    child: SpinKitDoubleBounce(
                      color: Colors.white,
                    ),
                  ),
                  onTap: (startLoading, stopLoading, btnState) async {
                    print( random);
                    if (btnState == ButtonState.Idle) {
                      startLoading();
//                      await doNetworkRequest();
                      // 延时1s执行返回
                      await Future.delayed(Duration(seconds: 2), () {
//                        Navigator.of(context).pop();
                        print('延时1s执行');
                      });
                      stopLoading();
                    }
                  }),
              Container(
                padding: EdgeInsets.only(left: 20, right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        CircleAvatar(
                          backgroundImage: AssetImage(
                            "assets/cm${random.nextInt(10)}.jpeg",
                          ),
                          radius: 50,
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text('云貂'),
                              Text('15555555555'),
                            ],
                          ),
                        )
                      ],
                    ),
                    RaisedButton(
                      onPressed: () {
                        print('提现');
                      },
                      child: Text('提现'),
                    )
                  ],
                ),
              ),

              // 头部,头像,个人信息

              SizedBox(height: 10),
              Text(
                names[random.nextInt(10)],
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
              SizedBox(height: 3),

              Text(
                "Status should be here",
                style: TextStyle(),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  FlatButton(
                    child: Icon(
                      Icons.message,
                      color: Colors.white,
                    ),
                    color: Colors.grey,
                    onPressed: () {},
                  ),
                  SizedBox(width: 10),
                  FlatButton(
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                    color: Theme.of(context).accentColor,
                    onPressed: () {},
                  ),
                ],
              ),

              SizedBox(height: 40),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Text(
                          random.nextInt(10000).toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "Posts",
                          style: TextStyle(),
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Text(
                          random.nextInt(10000).toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "Friends",
                          style: TextStyle(),
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Text(
                          random.nextInt(10000).toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "Groups",
                          style: TextStyle(),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                primary: false,
                padding: EdgeInsets.all(5),
                itemCount: 15,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 200 / 200,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Image.asset(
                      "assets/cm${random.nextInt(10)}.jpeg",
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
