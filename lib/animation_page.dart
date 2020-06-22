import 'package:flutter/material.dart';
import 'dart:math' as math;

class AnimationPage extends StatefulWidget {
  AnimationPage({Key key}) : super(key: key);

  @override
  _AnimationPageState createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage> {
  double offset = 0;
  double maxOffset = 1;
  ColorTween colorTween = ColorTween(begin: Colors.blue, end: Colors.red);

  bool _onScrollNotification(ScrollNotification notification) {
    setState(() {
      maxOffset = notification.metrics.maxScrollExtent;
      offset = math.min(math.max(0, notification.metrics.pixels), maxOffset) ;
    });
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animation'),
      ),
      body: Stack(
        children: <Widget>[
          Transform.scale(
            scale: 1 + offset / 100,
            child: Transform.translate(
              offset: Offset(offset, 0),
              child: Transform.rotate(
                angle: offset / 180 * math.pi,
                child: SizedBox.fromSize(
                  size: Size.square(100),
                  child: Container(
                    color: colorTween.lerp(offset * 20 / maxOffset),
                    child: Center(
                      child: Text('Target'),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 300 + offset / 10),
            child: NotificationListener<ScrollNotification>(
              onNotification: _onScrollNotification,
              child: ListView.builder(
                itemCount: 100,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    color: Colors.grey,
                    child: ListTile(
                      title: Text('hello world ${index + 1}'),
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
