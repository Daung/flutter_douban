import 'package:flutter/material.dart';
import 'package:flutter_douban/pages/main/main_home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        //去掉默认的水波纹效果
        highlightColor: Colors.transparent
      ),
      home: MainHomePage(),
    );
  }
}

