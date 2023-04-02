import 'package:flutter/material.dart';
import 'package:mboathoscope/CustomButton.dart';

class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF3F7FF),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child: Column(
            children: [
              Flexible(
                flex: 2,
                child: Container(),
              ),
              // const SizedBox(
              //   height: 100,
              // ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 26,
                  right: 26,
                ), //top: 87
                child: Image.asset(
                  'assets/images/img.png',
                  height: 280,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 23, right: 23),
                child: Text(
                  'mboathoscope',
                  style: TextStyle(
                    color: Color(0xff3D79FD),
                    fontWeight: FontWeight.bold,
                    fontSize: 50,
                  ),
                ),
              ),
              // const SizedBox(
              //   height: 39,
              // ),
              Flexible(
                flex: 2,
                child: Container(),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/rolepage');
                },
                child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 30),
                    child: CustomButton(txt: 'Get Started')),
                // child: const Padding(
                //   padding: EdgeInsets.only(bottom: 199),
                //   child: CustomButton(
                //     txt: 'Get Started',
                //   ),
                // ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
