import 'dart:math' as Math;
import 'package:flutter/material.dart';
import 'package:transformer_page_view/transformer_page_view.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

class ViewPagerDemoPage extends StatelessWidget {
  final List<Color> colorList = [
    Colors.redAccent,
    Colors.blueAccent,
    Colors.greenAccent
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColorDark,
      appBar: AppBar(
        title: new Text("ViewPagerDemoPage"),
      ),
      body: Container(
        alignment: Alignment.topCenter,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            new Expanded(
              child: new TransformerPageView(
                  loop: false,
                  itemBuilder: (BuildContext context, int index) {
                    return new Container(
                      decoration: BoxDecoration(
                          color: colorList[index % colorList.length],
                          border: Border.all(color: Colors.white)),
                      child: new Center(
                        child: new Text(
                          "$index",
                          style: new TextStyle(
                              fontSize: 80.0, color: Colors.white),
                        ),
                      ),
                    );
                  },
                  itemCount: 3),
            ),
          ],
        ),
      ),
    );
  }
}
