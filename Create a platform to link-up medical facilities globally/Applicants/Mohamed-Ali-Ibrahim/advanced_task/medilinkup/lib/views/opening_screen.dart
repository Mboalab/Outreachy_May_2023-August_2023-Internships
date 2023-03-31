import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../components/signin_button.dart';
import '../components/signup_button.dart';


class openingScreen extends StatelessWidget {
  
  const openingScreen
({super.key});

void printMe(){}

  @override
  Widget build(BuildContext context) {
    
    return  Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
          children: [

             const Text('Welcome to Medilinkup',
             style: TextStyle(
              fontSize: 24
             )),
             const SizedBox(height: 5,),
              const Text('Revolutionizing healthcare access',
             style: TextStyle(
              fontSize: 14,
              color: Colors.grey
             )),
             const SizedBox(height: 400),
          
                signup_button(
                  onTap: (){
                     Navigator.pushNamedAndRemoveUntil(context, '/signup/', (route) => false);
                  },
                ),
                
                const SizedBox(height: 10),
                signin_button(onTap: (){
                   Navigator.pushNamedAndRemoveUntil(context, '/login/', (route) => false);

                })
          ],
        ),
        )
        
      ),

    
    );
  }
}