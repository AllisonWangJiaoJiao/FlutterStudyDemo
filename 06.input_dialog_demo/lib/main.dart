import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'input_dialog.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      builder: (context, child) => Scaffold(
        body: child,
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
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Just a demo'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(title: Text('Item $index'));
              },
              itemCount: 100,
            ),
          ),
          SafeArea(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: IconButton(
                    icon: Icon(Icons.question_answer),
                    onPressed: _onShowModalBottomSheet,
                  ),
                ),
                Expanded(
                  child: IconButton(
                    icon: Icon(Icons.share),
                    onPressed: () {},
                  ),
                )
              ],
            ),
          )
        ],
      )
    );
  }

  _onShowModalBottomSheet() {
    print("点击弹框");
    InputDialog.showInputDialog(context,
      submitCallback: (value) {
        print("callBack:$value");
      },
    );
  }
}