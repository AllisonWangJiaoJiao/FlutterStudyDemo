import 'dart:math';
import 'package:flutter/material.dart';

class GridViewDemo extends StatefulWidget {
  @override
  _GridViewDemoState createState() => _GridViewDemoState();
}

class _GridViewDemoState extends State<GridViewDemo> {
  @override
  Widget build(BuildContext context) {
//    return GridViewDemo1();
//    return GridViewDemo2();
    return GridViewDemo3();
//    return GridViewBuildDemo1();
  }

}

class GridViewBuildDemo1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8
        ),
        itemBuilder: (BuildContext ctx, int index) {
          return Container(
            color: Color.fromARGB(255, Random().nextInt(256), Random().nextInt(256), Random().nextInt(256)),
          );
        }
    );
  }
}



class GridViewDemo1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /**
     * SliverGridDelegateWithFixedCrossAxisCount 交叉轴的数量
     * SliverGridDelegateWithMaxCrossAxisExtent 交叉轴的最大宽度
     */
    return GridView(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          childAspectRatio: .8,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8
      ),
      children: List.generate(100, (index) {
        return Container(
          color: Color.fromARGB(255, Random().nextInt(256), Random().nextInt(256), Random().nextInt(256)),
        );
      }),
    );
  }
}


class GridViewDemo2 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    /**
     * maxCrossAxisExtent 交叉轴最大值(这是一个估值，并非准确值)
     */
    return GridView(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          childAspectRatio: 1.8
      ),
      children: List.generate(100, (index) {
        return Container(
          color: Color.fromARGB(255, Random().nextInt(256), Random().nextInt(256), Random().nextInt(256)),
        );
      }),
    );
  }
}

class GridViewDemo3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /**
     *  GridView.count 内部实际是封装了gridDelegate代理为SliverGridDelegateWithFixedCrossAxisCount的方法
     */
    return GridView.count(
      crossAxisCount: 2,
      childAspectRatio: 1.0,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      children: List.generate(100, (index) {
        return Container(
          color: Color.fromARGB(255, Random().nextInt(256), Random().nextInt(256), Random().nextInt(256)),
        );
      },
      ),
    );
  }
}


