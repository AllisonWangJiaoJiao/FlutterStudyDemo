import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:providerdemo/user_info.dart';
import 'package:providerdemo/user_viewmodel.dart';
import 'content_viewmodel.dart';

List<SingleChildWidget> providers = [
  ChangeNotifierProvider(create: (context) => ContentViewModel()),
  ChangeNotifierProvider(create: (context) => UserViewModel(UserInfo("allison", "女", 18))),
];