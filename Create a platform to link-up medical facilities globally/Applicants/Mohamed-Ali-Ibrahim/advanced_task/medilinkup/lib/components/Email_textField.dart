import 'package:flutter/material.dart';


class Email_textField extends StatelessWidget {
  
  // ignore: prefer_typing_uninitialized_variables
  final controller;
  final bool obscureText;
 
  const Email_textField({
    super.key,
    required this.controller,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            fillColor: Colors.grey.shade200,
            filled: true,
      ),
    )
    );
  }
}