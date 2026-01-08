import 'package:flutter/material.dart';

import '../Cart/index.dart';
import '../Category/index.dart';
import '../Home/index.dart';
import '../Mine/index.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<Map<String, String>> _tableList = [
    {
      "icon": "lib/assets/home_normal.png",
      "active_icon": "lib/assets/home_active.png",
      "title": "首页",
    },
    {
      "icon": "lib/assets/pro_normal.png",
      "active_icon": "lib/assets/pro_active.png",
      "title": "分类",
    },
    {
      "icon": "lib/assets/cart_normal.png",
      "active_icon": "lib/assets/cart_active.png",
      "title": "购物车",
    },

    {
      "icon": "lib/assets/my_normal.png",
      "active_icon": "lib/assets/my_active.png",
      "title": "我的",
    },
  ];
  int _currentIndex = 0;

  List<BottomNavigationBarItem> _getBottomNavigationBarItemList() {
    return List.generate(_tableList.length, (index) {
      var item = _tableList[index];
      return BottomNavigationBarItem(
        icon: Image.asset(item["icon"]!, width: 30, height: 30),
        activeIcon: Image.asset(item["active_icon"]!, width: 30, height: 30),
        label: item["title"],
      );
    });
  }

  List<Widget> _getPageList() {
    return [HomeView(), CateGoryViw(), CartView(), MineView()];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(index: _currentIndex, children: _getPageList()),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.values[1],
        selectedItemColor: const Color.fromARGB(255, 32, 32, 32),
        showSelectedLabels: true,
        showUnselectedLabels: true,
        unselectedItemColor: const Color.fromARGB(255, 156, 156, 156),
        currentIndex: _currentIndex,
        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
        items: _getBottomNavigationBarItemList(),
      ),
    );
  }
}
