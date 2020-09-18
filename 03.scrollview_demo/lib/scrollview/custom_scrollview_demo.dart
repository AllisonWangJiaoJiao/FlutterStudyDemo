import 'dart:math';

import 'package:flutter/material.dart';

class CustomScrollViewDemo extends StatefulWidget {
  @override
  _CustomScrollViewDemoState createState() => _CustomScrollViewDemoState();
}

class _CustomScrollViewDemoState extends State<CustomScrollViewDemo> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView1();
//    return CustomScrollView2();
  }
}

class CustomScrollView2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          expandedHeight: 300,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            title: Text("Hello World"),
            background: Image.network('https://dss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=1412797983,1836482176&fm=111&gp=0.jpg'),
          ),
        ),
        SliverGrid(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              childAspectRatio: 2
          ),
          delegate: SliverChildBuilderDelegate(
                  (BuildContext ctx, int int) {
                return Container(color: Color.fromARGB(255, Random().nextInt(
                    256), Random().nextInt(256), Random().nextInt(256)));
              },
              childCount: 6
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
                  (BuildContext ctx, int index) {
                return ListTile(
                  leading: Icon(Icons.people),
                  title: Text("联系人$index"),
                );
              },
              childCount: 20
          ),
        )
      ],
    );
  }
}

class CustomScrollView1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverGrid(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              childAspectRatio: 1.5
          ),
          delegate: SliverChildBuilderDelegate(
                  (BuildContext ctx, int int) {
                return Container(color: Color.fromARGB(255, Random().nextInt(
                    256), Random().nextInt(256), Random().nextInt(256)));
              },
              childCount: 100
          ),
        ),
      ],
    );
  }
}