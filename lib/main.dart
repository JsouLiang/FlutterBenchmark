import 'package:flutter/material.dart';
import 'package:flutterbenchmark/animation_page.dart';
import 'package:flutterbenchmark/complex_layout_page.dart';
import 'package:flutterbenchmark/list_page.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        children: ListTile.divideTiles(context: context, tiles: [
          ListTile(
            title: Text('Complex Layout'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ComplexLayoutPage()));
            },
          ),
          ListTile(
            title: Text('List'),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => ListPage()));
            },
          ),
          ListTile(
            title: Text('Animation'),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => AnimationPage()));
            },
          ),
        ]).toList(),
      ),
    );
  }
}
