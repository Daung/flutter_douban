import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_douban/pages/main/home_page.dart';
import 'package:flutter_douban/pages/main/nav_bar_items.dart';

class MainHomePage extends StatefulWidget {
  createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {
  int _index = 0;
  String title = barItems[0].label;
  final double size = 30;

  @override
  Widget build(BuildContext context) {
    // List<BottomNavigationBarItem> _items = items.toList();
    // print(_items);
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: IndexedStack(
        index: _index,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        //如果超过四个，要设置类型为fixed，否则不显示title
        type: BottomNavigationBarType.fixed,
        currentIndex: _index,
        selectedFontSize: 12.0,
        unselectedFontSize: 12.0,
        items: items,
        onTap: (index) {
          setState(() {
            this._index = index;
            this.title = barItems[index].label;
          });
        },
      ),
    );
  }
}
