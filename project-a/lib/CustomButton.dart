import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String txt;

  const CustomButton({
    super.key,
    required this.txt,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 28.0, right: 28.0,top: 10.0, bottom: 10.0),
      decoration: BoxDecoration(
        color: const Color(0xffC5D7FE),
        borderRadius: BorderRadius.circular(25.0),
      ),
      child: InkWell(
        child: Text(
          txt,
          style: const TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}