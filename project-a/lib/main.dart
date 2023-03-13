import 'package:flutter/material.dart';

import 'screens/HomePage.dart';
import 'screens/RolePage.dart';
import 'screens/StartPage.dart';

void main() {
  runApp(
    MaterialApp(
      // title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: const ColorScheme.light(
          primary: Color(0xff3D79FD),
          background: Color(0xffF3F7FF),
        ),
      ),
      debugShowCheckedModeBanner: false,
      routes: AppRoutes.routes,
    ),
  );
}

class AppRoutes {
  static const initial = '/';
  static const rolePage = '/rolePage';
  static const homePage = '/homepage';

  static Map<String, Widget Function(BuildContext)> get routes => {
        initial: (context) => const StartPage(),
        rolePage: (context) => const RolePage(),
        homePage: (context) => const HomePage(),
      };
}
