import 'package:flutter/material.dart';

final ButtonStyle flatButtonStyle = TextButton.styleFrom(
  //primary:  Colors.white,
  //minimumSize: const Size(15, 46),
  textStyle: const TextStyle(
    //color: Color(0xffF3F7FF),
  ),

  //padding: const EdgeInsets.symmetric(horizontal: 16.0),
  shape: RoundedRectangleBorder(
    side: const BorderSide(
      color:  Color(0xff3D79FD),
      width: 1,
      style: BorderStyle.solid
  ),
    borderRadius: BorderRadius.circular(25),
  ),
  backgroundColor: const Color(0xffF3F7FF),
);
