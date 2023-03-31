import 'package:flutter/widgets.dart';

extension ColorUtil on Color {
  static Color fromHex(String hex) {
    final hexColor = hex.replaceAll('#', '');
    return Color(int.parse('FF$hexColor', radix: 16));
  }
}