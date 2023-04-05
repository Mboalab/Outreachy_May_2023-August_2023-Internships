import 'package:flutter/widgets.dart';
import 'package:hospitals_app/screens/hospitals.dart';
import 'package:hospitals_app/screens/intro/intro_page.dart';

class AppRouter {
  static const String intro = '/';
  static const String hospitals = '/hospitals';

  static Map<String, WidgetBuilder> getRoutes = {
    intro: (context) => const IntroPage(),
    hospitals: (context) => const Hospitals(),
  };
}