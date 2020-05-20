import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerdemo/user_viewmodel.dart';

import 'content_viewmodel.dart';

class UserInfoPage extends StatefulWidget {
  @override
  _UserInfoPageState createState() => _UserInfoPageState();
}

class _UserInfoPageState extends State<UserInfoPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("InheritedWidget"),
      ),
//      body: Consumer<UserViewModel>(
//        builder: (context,userVM,child) {
//          return Text("当前计数: ${userVM.user.name}", style: TextStyle(fontSize: 30),);
//        },
//      ),
    //Consumer2高级用法
      body: Consumer2<UserViewModel,ContentViewModel>(
        builder: (context,userVM,contentVM,child) {
          return Text("名字: ${userVM.user.name} 当前计数:${contentVM.counter}",
            style: TextStyle(fontSize: 30),);
        },
      ),

    );
  }
}
