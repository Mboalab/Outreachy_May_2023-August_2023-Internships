import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'screens/home_page.dart';
import 'screens/role_page.dart';
import 'screens/start_page.dart';

void main() {
  runApp(
    ProviderScope(
      child: MaterialApp(
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
