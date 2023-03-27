import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

// ignore: camel_case_types
class LogIn_button
 extends StatelessWidget {
    final Function()? onTap;
  const LogIn_button
  ({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(25),
        margin: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          color:const Color(0xff05c555),
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Center(
          child: Text(
            "Log in ",
            style: TextStyle(
              color: Color.fromARGB(255, 255, 255, 255),
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}