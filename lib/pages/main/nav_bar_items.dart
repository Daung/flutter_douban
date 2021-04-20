import 'package:flutter/material.dart';
import 'package:flutter_douban/constant/text/string.dart';

List<String> _activeIcons = [
  "assets/images/tabbar/home_active.png",
  "assets/images/tabbar/subject_active.png",
  "assets/images/tabbar/group_active.png",
  "assets/images/tabbar/mall_active.png",
  "assets/images/tabbar/profile_active.png"
];

List<String> _icons = [
  "assets/images/tabbar/home.png",
  "assets/images/tabbar/subject.png",
  "assets/images/tabbar/group.png",
  "assets/images/tabbar/mall.png",
  "assets/images/tabbar/profile.png"
];

class _NavigationBarItem {
  final String label;
  final String icon;
  final String activeIcon;
  final double width = 30;
  final double height = 30;

  _NavigationBarItem(this.label, this.icon, this.activeIcon);
}

List<_NavigationBarItem> barItems = List.generate(
    AppString.bottomNavigationBarTitle.length,
    (index) => _NavigationBarItem(AppString.bottomNavigationBarTitle[index],
        _icons[index], _activeIcons[index]));

class WZBottomNavigationBarItem extends BottomNavigationBarItem {
  final _NavigationBarItem item;

  //好好体会这种初始化列表的作用，当继承父类的的时候
  WZBottomNavigationBarItem({@required this.item})
      : super(
            icon: Image.asset(
              item.icon,
              width: item.width,
              height: item.height,
            ),
            activeIcon: Image.asset(
              item.activeIcon,
              width: item.width,
              height: item.height,
            ),
            label: item.label);
}

//使用List.map方法返回的是类型(),调用toList() 返回 []
List<BottomNavigationBarItem> items = barItems
    .map((_NavigationBarItem item) => WZBottomNavigationBarItem(item: item))
    .toList();
