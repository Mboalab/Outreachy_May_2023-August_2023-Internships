import 'package:flutter/material.dart';
import 'package:mboathoscope/CustomButton.dart';

class RolePage extends StatelessWidget {
  const RolePage({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF3F7FF),
      body: Column(
        children: [
          const SizedBox(
            height: 100,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 26,right: 26, top: 87),
            child: Image.asset(
              'assets/images/img_role.png',
              height: 280,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 23, right: 23),
            child: Text(
              'Please select what your role is',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 55, right: 38, left: 38),
            child: Row(
              children: const [
                 CustomButton(
                  txt: 'Transmitter',
                ),
                 SizedBox(
                  width: 60,
                ),
                 CustomButton(
                  txt: 'Receiver',
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 300, top: 30),
            child: GestureDetector(
              onTap: (){
                Navigator.pushNamed(context,'/homepage');
              },
              child: RichText(
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text: "Next ",
                      style: TextStyle(color: Colors.black)
                    ),
                    WidgetSpan(
                      child: Icon(Icons.arrow_forward_ios, size: 14),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}