import 'package:flutter/material.dart';
import 'size_fit.dart';

class SizeFitPage extends StatefulWidget {
  @override
  _SizeFitPageState createState() => _SizeFitPageState();
}

class _SizeFitPageState extends State<SizeFitPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("屏幕适配"),
      ),
      body: Container(
        color: Colors.red,
        width: SizeFit.setRpx(200),
        height: SizeFit.setRpx(200),
      ),
    );
  }
}
