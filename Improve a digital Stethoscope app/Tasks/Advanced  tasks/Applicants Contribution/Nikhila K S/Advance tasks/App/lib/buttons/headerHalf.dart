import 'package:flutter/material.dart';
import 'package:mboathoscope/buttons/SaveButton.dart';

class headerHalf extends StatelessWidget {
  const headerHalf({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 34.0,left: 20, right: 20),
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 5,
                child: Image.asset(
                  'assets/images/img_head.png',
                  height: 100,
                  width: 100,
                ),
              ),
              const SizedBox(
                width: 100,
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(top: 24.0),
                  child: Stack(
                      children: <Widget>[
                        Positioned(
                          child: Image.asset(
                            'assets/images/img_notiblack.png',
                            height: 32,
                            width: 34,
                            color: const Color(0xff3D79FD),
                          ),
                        ),
                        const Positioned(
                          bottom: 19,
                          right: 4,
                          child: CircleAvatar(
                            radius: 7,
                            backgroundColor: Color(0xff3D79FD),
                            foregroundColor: Colors.white,
                          ), //CircularAvatar
                        ),
                      ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
