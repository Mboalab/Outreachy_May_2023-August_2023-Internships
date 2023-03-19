import 'package:flutter/material.dart';
import 'package:mboathoscope/CustomButton.dart';

class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: const Color(0xffF3F7FF),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 26,right: 26, top: 87),
                child: Image.asset(
                    'assets/images/img.png',
                  height: 260,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 21, right: 21),
                child: Text(
                    'mboathoscope',
                     style: TextStyle(
                     color: Color(0xff3D79FD),
                     fontWeight: FontWeight.bold,
                     fontSize: 46,
                  ),
                ),
              ),
              const SizedBox(
                height: 44,
              ),
              GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context,'/rolepage');
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
        ),
      ),
    );
  }
}
