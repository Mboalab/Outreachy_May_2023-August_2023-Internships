import 'package:flutter/material.dart';
import 'package:mboathoscope/CustomButton.dart';

class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF3F7FF),
      body: Column(
        children: [
          Flexible(
            flex: 3,
            fit: FlexFit.loose,
            child: Padding(
              padding: const EdgeInsets.only(left: 26, right: 26, top: 87),
              child: Image.asset(
                'assets/images/img.png',
                height: 300,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 23, right: 23),
            child: Text(
              'mboathoscope',
              style: TextStyle(
                color: Color(0xff3D79FD),
                fontWeight: FontWeight.bold,
                fontSize: 45,
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/rolepage');
            },
            child: const Padding(
              padding: EdgeInsets.only(bottom: 199),
              child: CustomButton(
                txt: 'Get Started',
              ),
            ),
          )
        ],
      ),
    );
  }
}
