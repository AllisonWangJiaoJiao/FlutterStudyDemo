import 'package:flutter/material.dart';

//1.创建自己要共享的数据
class ContentViewModel extends ChangeNotifier {

  int _counter = 100;

  int get counter => _counter;

  set counter(int value) {
    _counter = value;
    notifyListeners();
  }


}


