import 'package:flutter/material.dart';

import 'size_fit_page.dart';

class OnePage extends StatefulWidget {
  @override
  _OnePageState createState() => _OnePageState();
}

class _OnePageState extends State<OnePage> {
  @override
  Widget build(BuildContext context) {
    return  Theme(
      data: Theme.of(context).copyWith(primaryColor: Colors.purple),
      child: Scaffold(
      appBar: AppBar(
        title: Text("主题2"),
        // backgroundColor: Colors.purple,//不推荐这个写法
      ),
      body: Column(
        children: <Widget>[
          Text("第一页",
            style: Theme.of(context).textTheme.display3,),
            Switch(value: true, onChanged: (value) {},),
          Card(child: Text("你好啊,Flutter", style: TextStyle(fontSize: 50),),)
        ],
      ),
        // This trailing comma makes auto-formatting nicer for build methods.
        floatingActionButton: Theme(
          data: Theme.of(context).copyWith(
              colorScheme: Theme.of(context).colorScheme.copyWith(
                  secondary: Colors.purple
              )
          ),
          child: FloatingActionButton(
            child: Icon(Icons.pets),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (ctx) {
                    return SizeFitPage();
                  }
              ));
            },
          ),
        ),
     ),
    );
  }
}
