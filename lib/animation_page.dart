import 'package:flutter/material.dart';

class AnimationPage extends StatefulWidget {
  AnimationPage({Key key}) : super(key: key);

  @override
  _AnimationPageState createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage> {

  void _onScrollNotification(ScrollNotification notification) {

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animation'),
      ),
      body: Stack(
        children: <Widget>[
          SizedBox.fromSize(
            size: Size.square(100),
            child: Container(
              color: Colors.blue,
              child: Center(
                child: Text('Target'),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 300),
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
