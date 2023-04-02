import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Search_Hospital_Bar extends StatefulWidget {
  const Search_Hospital_Bar({super.key});

  @override
  State<Search_Hospital_Bar> createState() => _Search_Hospital_BarState();
}

class _Search_Hospital_BarState extends State<Search_Hospital_Bar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
       body: Card(
        child: Column(
          children: [
              Image.network(
                      'https://cdn.pixabay.com/photo/2016/11/18/17/46/house-1836070__340.jpg',
                      fit: BoxFit.cover,
                      height: 100,
                      width: 100,
               )
          ],
        ),
       ),
      ),
    );
  }
}