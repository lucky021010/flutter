//管理路由

import 'package:flutter/material.dart';

import '../pages/Login/index.dart';
import '../pages/Main/index.dart';

//返回App根级组件
Widget getRootWidget() {
  return MaterialApp(initialRoute: '/', routes: getRoutes());
}

//返回路由表
Map<String, Widget Function(BuildContext)> getRoutes() {
  return {'/': (context) => MainPage(), '/login': (context) => LoginPage()};
}
