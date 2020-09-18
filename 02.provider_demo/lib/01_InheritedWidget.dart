import 'package:flutter/material.dart';
import 'f_counterwidget.dart';

class InheritedWidgetPage extends StatefulWidget {
  @override
  _InheritedWidgetPageState createState() => _InheritedWidgetPageState();
}

class _InheritedWidgetPageState extends State<InheritedWidgetPage> {
  int _counter = 100;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("InheritedWidget"),
      ),
      body: FCounterWidget(
        counter: _counter,
        child: Center(
          child: Column(
            children: <Widget>[
              Text("当前计数: $_counter", style: TextStyle(fontSize: 30),),
            ],
          ),
        ),
      ),

      floatingActionButton:FloatingActionButton(
        child: Icon(Icons.add),
          onPressed: () {
            setState(() {
              _counter += 1;
            });
          },
      ),
    );
  }
}

