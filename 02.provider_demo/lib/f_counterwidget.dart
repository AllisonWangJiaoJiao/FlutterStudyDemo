import 'package:flutter/material.dart';

class FCounterWidget extends  InheritedWidget {
  // 1.共享的数据
  final int counter;

  // 2.定义构造方法
  FCounterWidget({this.counter, Widget child}): super(child: child);

  // 3.获取组件最近的当前InheritedWidget
  static FCounterWidget of(BuildContext context) {
    // 沿着Element树, 去找到最近的HYCounterElement, 从Element中取出Widget对象
    return context.dependOnInheritedWidgetOfExactType();
  }


  // 4.绝对要不要回调State中的didChangeDependencies
  // 如果返回true: 执行依赖当期的InheritedWidget的State中的didChangeDependencies
  @override
  bool updateShouldNotify(FCounterWidget oldWidget) {
    return oldWidget.counter != counter;
  }
}