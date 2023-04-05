import 'package:flutter/material.dart';
import 'package:hospitals_app/utils/color_from_hex.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

Widget loadingAnimation() {
  return Scaffold(
    body: Center(
      child: LoadingAnimationWidget.staggeredDotsWave(
        color: ColorUtil.fromHex('#C92C6D'), 
        size: 50
      ),
    ),);
}