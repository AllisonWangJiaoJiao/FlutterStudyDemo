import 'package:flutter/material.dart';

import 'one_page.dart';

class ThemeDemoPage extends StatefulWidget {
  @override
  _ThemeDemoPageState createState() => _ThemeDemoPageState();
}

class _ThemeDemoPageState extends State<ThemeDemoPage> {

  @override
  Widget build(BuildContext context) {
    return   MaterialApp(
      title: 'Flutter Demo',
      // 全局主题
      theme: ThemeData(
        // 1.亮度
          brightness: Brightness.light,
          // 2.primarySwatch传入不是Color, 而是MaterialColor(包含了primaryColor和accentColor)
          primarySwatch: Colors.red,
          // 3.primaryColor: 单独设置导航和TabBar的颜色
          primaryColor: Colors.orange,
          // 4.accentColor: 单独设置FloatingActionButton\Switch
          accentColor: Colors.green,
          // 5.Button的主题
          buttonTheme: ButtonThemeData(
              height: 25,
              minWidth: 10,
              buttonColor: Colors.yellow
          ),
          // 6.Card的主题
          cardTheme: CardTheme(
              color: Colors.greenAccent,
              elevation: 10
          ),
          // 7.Text的主题
          textTheme: TextTheme(
            body1: TextStyle(fontSize: 16, color: Colors.red),
            body2: TextStyle(fontSize: 20),
            display1: TextStyle(fontSize: 14),
            display2: TextStyle(fontSize: 16),
            display3: TextStyle(fontSize: 18),
            display4: TextStyle(fontSize: 20),
          )
      ),
      home:Scaffold(
        appBar: AppBar(
          title: Text("主题"),
        ),
        body: Text("Hello World",
          style: Theme.of(context).textTheme.display3,), // This trailing comma makes auto-formatting nicer for build methods.

        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (ctx) {
                  return OnePage();
                }
            ));
          },
        ),
      ),
    );
  }
}
