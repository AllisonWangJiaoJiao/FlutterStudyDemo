
import 'package:flutter/material.dart';
import '01_InheritedWidget.dart';
import '02_provider.dart';
import 'package:provider/provider.dart';
import '03_userInfoPage.dart';
import 'content_viewmodel.dart';
import 'initialize_provider.dart';
import 'user_info.dart';
import 'user_viewmodel.dart';

/**
 * 1.创建需要共享的数据
 * 2.在应用的main函数中使用ChangeNotifierProvider
 * 3.在其他位置使用共享的数据
 */
void main() {
  runApp(
    //注册多个provider
      MultiProvider(
        providers:providers ,
        child: MyApp(),
      ),
  );

  //注册单个通知
//  runApp(
//      ChangeNotifierProvider(
//        create: (ctx) => ContentViewModel(),
//        child: MyApp(),
//      )
//  );
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
//      home: InheritedWidgetPage(),
//      home: ProviderWidget(),
       home: UserInfoPage(),
    );

  }
}
