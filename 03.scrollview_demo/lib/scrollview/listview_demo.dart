import 'package:flutter/material.dart';

class ListViewDemo extends StatefulWidget {
  @override
  _ListViewDemoState createState() => _ListViewDemoState();
}

class _ListViewDemoState extends State<ListViewDemo> {

  @override
  Widget build(BuildContext context) {
//    return ListViewDemo1();
//    return ListViewBuilderDemo2();
    return ListViewSeparatedDemo3();
  }
}


/// 1.ListView默认构造方法
class ListViewDemo1 extends StatelessWidget {
  final TextStyle textStyle = TextStyle(fontSize: 20, color: Colors.redAccent);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.people, size: 36,),
            title: Text("姓名"),
            subtitle: Text("王小二"),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          ListTile(
            leading: Icon(Icons.email, size: 36,),
            title: Text("邮箱"),
            subtitle: Text("邮箱地址信息"),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          ListTile(
            leading: Icon(Icons.add, size: 36,),
            title: Text("地址"),
            subtitle: Text("家庭地址"),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
        ],
      ),
    );
  }
}

/// 1.1 ListView默认构造方法
class ListViewDemo2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: List.generate(100, (index) {
        return ListTile(
          leading: Icon(Icons.people),
          trailing: Icon(Icons.delete),
          title: Text("联系人${index + 1}"),
          subtitle: Text("联系人电话号码:18866665555"),
        );
      }),
    );
  }
}


class ListViewBuilderDemo2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 100,
      itemExtent: 60,
      itemBuilder: (BuildContext ctx, int index) {
        return Text(
          "ListView - builder: $index",
          style: TextStyle(fontSize: 20),
        );
      },
    );
  }
}


class ListViewSeparatedDemo3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 20,
      itemBuilder: (BuildContext ctx, int index) {
        return Text(
          "ListView - separated: $index",
          style: TextStyle(fontSize: 20),
        );
      },
      separatorBuilder: (BuildContext ctx, int index) {
        return Divider(
          color: Colors.red,
//          height: 30,
//          indent: 30,
//          endIndent: 30,
//          thickness: 10,
        );
      },
    );
  }
}
