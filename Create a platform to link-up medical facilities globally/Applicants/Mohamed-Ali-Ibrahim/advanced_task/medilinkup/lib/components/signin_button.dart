import 'package:flutter/material.dart';

// ignore: camel_case_types
class signin_button extends StatelessWidget {
  final Function()? onTap;

  const signin_button({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(25),
        margin: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          border: Border.all(
            color:const  Color(0xff05c555)
          ),
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Center(
          child: Text(
            "Sign In",
            style: TextStyle(
              color: Color(0xff05c555),
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}