import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String center = 'long long long center';
  String left = 'short left';
  String right = 'short right';

  List<String> strings = [
    'long long long long string',
    'medium medium string',
    'short string',
    '长长长长长长长长长长长长长长长长长字符串',
    '中等中等中等中等字符串',
    '字符串',
  ];
  Random random = Random();
  String nextString() {
    return strings[random.nextInt(strings.length - 1)];
  }

  void _incrementCounter() {
    setState(() {
      center = nextString();
      left = nextString();
      right = nextString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
//      body: SingleChildScrollView(
//        scrollDirection: Axis.horizontal,
//        child: Row(
//          children: <Widget>[
//            Column(
//              children: <Widget>[
//                Container(
//                  width: 400,
//                  height: 200,
//                  color: Colors.red,
//                ),
//                Container(
//                  width: 400,
//                  height: 200,
//                  color: Colors.redAccent,
//                ),
//              ],
//            ),
//            Column(
//              children: <Widget>[
//                Container(
//                  width: 400,
//                  height: 200,
//                  color: Colors.green,
//                ),
//                Container(
//                  width: 400,
//                  height: 200,
//                  color: Colors.greenAccent,
//                ),
//              ],
//            ),
//            Column(
//              children: <Widget>[
//                Container(
//                  width: 400,
//                  height: 200,
//                  color: Colors.blue,
//                ),
//                Container(
//                  width: 400,
//                  height: 200,
//                  color: Colors.blueAccent,
//                ),
//              ],
//            ),
//          ],
//        ),
//      ),
      body: createBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget createBody() {
    List<int> values = [0, 1, 2];
//    return CustomScrollView(
//      slivers: <Widget>[
//        SliverList(
//          delegate: SliverChildListDelegate([create(), create(), create()]),
//        )
//      ],
//    );
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[for (var i in values) create()],
      ),
    );
  }

  Widget create() {
    List<int> values = [0, 1, 2, 3, 4, 5, 6];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: IntrinsicWidth(
        child: Row(
          children: <Widget>[
            for (var i in values)
              Flexible(
                flex: 1,
                child: createPage(30),
              )
          ],
        ),
      ),
    );
  }

  Widget createPage(int currentLevel) {
    if (currentLevel <= 1) {
      return createBasisContainer();
    }
    return createBasisContainer(child: createPage(currentLevel - 1));
  }

  Widget createBasisContainer({Widget child}) {
    return RepaintBoundary(
      child: Container(
        decoration: BoxDecoration(border: Border.all()),
        child: Padding(
          padding: EdgeInsets.all(2.5),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[child ?? Container(), rowContainer()],
          ),
        ),
      ),
    );
  }

  Widget rowContainer() {
    TextStyle style = TextStyle(fontSize: 10, height: 1.0);

    return RepaintBoundary(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(border: Border.all()),
            child: Text(
              '$left',
              style: style,
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(border: Border.all()),
              child: Text(
                '$center',
                textAlign: TextAlign.center,
                style: style,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(border: Border.all()),
            child: Text(
              '$right',
              style: style,
            ),
          ),
        ],
      ),
    );
  }
}
