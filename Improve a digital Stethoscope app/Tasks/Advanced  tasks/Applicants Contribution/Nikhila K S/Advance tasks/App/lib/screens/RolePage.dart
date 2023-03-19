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
              'Please select your role',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 35, right: 0, left: 19.0),
            child: Row(
              children: const [
                 CustomButton(
                  txt: 'Transmitter',
                ),
                 SizedBox(
                  width: 5,
                ),
                 CustomButton(
                  txt: ' Receiver  ',
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 0, top: 40),
            child: GestureDetector(
              onTap: (){
                Navigator.pushNamed(context,'/homepage');
              },
              child: Container(
                width: 160,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                decoration: BoxDecoration(
                  // color: Colors.redAccent,
                  gradient: LinearGradient(
                    colors: [Color(0xffC5D7FE),Colors.blueAccent],
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: "Get started ",
                        style: TextStyle(color: Colors.black,fontSize: 20)
                      ),
                      WidgetSpan(
                        child: Icon(Icons.arrow_forward_ios, size: 20),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}