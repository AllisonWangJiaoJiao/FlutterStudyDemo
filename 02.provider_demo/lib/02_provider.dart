import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'content_viewmodel.dart';

class ProviderWidget extends StatefulWidget {
  @override
  _ProviderWidgetState createState() => _ProviderWidgetState();
}

class _ProviderWidgetState extends State<ProviderWidget> {
  @override
  Widget build(BuildContext context) {
    int counter = Provider.of<ContentViewModel>(context).counter;
    return  Scaffold(
        appBar: AppBar(
          title: Text("InheritedWidget"),
        ),
        body: Consumer<ContentViewModel>(
            builder:(context,contentVM,child) {
              return Text("当前计数: $counter", style: TextStyle(fontSize: 30));
            }
        ),

      ///第二种优化方案 FloatingActionButton 也不需要重新构建
      floatingActionButton:Selector<ContentViewModel,ContentViewModel>(
        selector: (context,contentVM) => contentVM,
        //是否重新构建 true 是 false 否
        shouldRebuild: (prev,next) => false,
        builder:(context,contentVM,child) {
          return FloatingActionButton(
            child: child,
            onPressed: () {
              contentVM.counter +=1;
            },
          );
        },
        child:Icon(Icons.adb),
      ),

//        ///第一种优化方案 Icon 不需要重新构建
//        floatingActionButton:Consumer<ContentViewModel>(
//            builder:(context,contentVM,child) {
//              return FloatingActionButton(
//                child: child,
//                onPressed: () {
//                  contentVM.counter +=1;
//                },
//              );
//            },
//          child:Icon(Icons.adb),
//        ),

        ///新能最差的方案
//        floatingActionButton:Consumer<ContentViewModel>(
//            builder:(context,contentVM,child) {
//              return FloatingActionButton(
//                child: Icon(Icons.adb),
//                onPressed: () {
//                  contentVM.counter +=1;
//                },
//              );
//            }
//        )
    );
  }
}


//class _ProviderWidgetState extends State<ProviderWidget> {
//  @override
//  Widget build(BuildContext context) {
//    int counter = Provider.of<ContentViewModel>(context).counter;
//    return  Scaffold(
//      appBar: AppBar(
//        title: Text("InheritedWidget"),
//      ),
//      body: Text("当前计数: $counter", style: TextStyle(fontSize: 30)),
//
//      floatingActionButton:Consumer<ContentViewModel>(
//          builder:(context,contentVM,child) {
//            return FloatingActionButton(
//              child: Icon(Icons.adb),
//              onPressed: () {
//                contentVM.counter +=1;
//              },
//            );
//          }
//      )
//    );
//  }
//}
