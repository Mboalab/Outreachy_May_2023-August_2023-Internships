import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:medilinkup/components/Email_textField.dart';
import 'package:medilinkup/components/Login_button.dart';
import 'package:medilinkup/components/signin_button.dart';
import 'package:firebase_auth/firebase_auth.dart';


class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late final TextEditingController _email;
  late final TextEditingController _password;

  void toHome(){

   

  }

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       resizeToAvoidBottomInset: false,
        body: Center(
      child: Column(
    
        children:  [
           const SizedBox(height: 76),
          const Text('Log in',
              style: TextStyle(fontSize: 20, fontFamily: 'Montserrat',color: Color(0xff05c555))),

          const SizedBox(height: 90),
          const Align(
            alignment: AlignmentDirectional.topStart,
            child: Padding(padding: EdgeInsets.fromLTRB(25, 0, 0, 4), child: 
            Text('Email adress',  style: TextStyle(fontSize: 14,fontFamily: 'Montserrat', color: Colors.grey)),)
          ),
          Email_textField(
              controller: _email,
              obscureText: false),

          const SizedBox(height: 10),
          const Align(
            alignment: AlignmentDirectional.topStart,
            child: Padding(padding: EdgeInsets.fromLTRB(25, 0, 0, 4), child: 
            Text('Password',  style: TextStyle(fontSize: 14,fontFamily: 'Montserrat', color: Colors.grey)),)
          ),
          Email_textField(
              controller: _password,
              obscureText: true),

          const SizedBox(height: 56),  
          LogIn_button(onTap: () async{
            // Firebase auth
          }),
          const SizedBox(height: 10),  
          Padding(
          
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Text(
                      'Forgot Password?',
                      style: TextStyle(fontFamily: 'Montserrat', fontSize: 12, color: Color.fromARGB(138, 5, 197, 85)),
                    ),
                  ],
                ),
              ),
               const SizedBox(height: 20),
            Text.rich(TextSpan(
                    style: const TextStyle(
                        color: Colors.black, fontSize: 15), //apply style to all
                    children: [
                      const TextSpan(
                          text: 'Dont have an account?',
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontFamily: 'Montserrat')),
                      TextSpan(
                          text: 'Sign up',
                          style: const TextStyle(
                              color: Color(0xff05c555), fontFamily: 'Montserrat'),
                         recognizer: TapGestureRecognizer()..onTap = () => Navigator.of(context).pushNamedAndRemoveUntil('/signup/', (route) => false)
                      )
              ]))
        ],
      ),
    ));
  }
}
