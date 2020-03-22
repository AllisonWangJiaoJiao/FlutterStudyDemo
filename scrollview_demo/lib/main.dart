import 'package:flutter/material.dart';

import 'scrollview/custom_scrollview_demo.dart';
import 'scrollview/gridView_demo.dart';
import 'scrollview/listview_demo.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
//        title: Text('自定义滚动视图'),
      ),
//      body: ListViewDemo()
      body: GridViewDemo(),
//      body: CustomScrollViewDemo(),
    );
  }
}
