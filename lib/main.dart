import 'package:flutter/material.dart';
import 'package:flutter_douban/pages/main/main_home.dart';
import 'package:flutter_douban/widgets/rating_widget.dart';

import 'widgets/dash_line_widget.dart';

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
        primarySwatch: Colors.blue,
      ),
      home: MainHomePage(),
    );
  }
}

