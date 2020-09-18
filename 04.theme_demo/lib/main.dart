import 'package:flutter/material.dart';
import 'size_fit.dart';
import 'theme_demo.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //屏幕适配初始化(这里一定要写，否则会报错)
    SizeFit.initialize();
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ThemeDemoPage(),
    );
  }
}
