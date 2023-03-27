import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:medilinkup/components/Login_button.dart';
import 'package:medilinkup/components/signin_button.dart';
import 'package:medilinkup/components/signup_button.dart';
import 'package:medilinkup/main.dart';

import '../components/Email_textField.dart';
import '../firebase_options.dart';

class SignUp extends StatefulWidget {
  SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  late final TextEditingController _email;
  late final TextEditingController _password;
  late final TextEditingController _hospital;

  void toHome() {}

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    _hospital = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    _hospital.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        // login text

        // email

        // password

        // sign up

        // do you have an account? sign up (colored)
        body: SingleChildScrollView(
          child: Center(
          child: Column(
              children: [
                const SizedBox(height: 76),
                const Text('Sign up',
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Montserrat',
                        color: Color(0xff05c555))),
                const SizedBox(height: 90),
                const Align(
                    alignment: AlignmentDirectional.topStart,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(25, 0, 0, 4),
                      child: Text('Hospital name',
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'Montserrat',
                              color: Colors.grey)),
                    )),
                Email_textField(controller: _hospital, obscureText: false),
                const SizedBox(height: 10),
                const Align(
                    alignment: AlignmentDirectional.topStart,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(25, 0, 0, 4),
                      child: Text('Email adress',
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'Montserrat',
                              color: Colors.grey)),
                    )),
                Email_textField(controller: _email, obscureText: false),
                const SizedBox(height: 10),
                const Align(
                    alignment: AlignmentDirectional.topStart,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(25, 0, 0, 4),
                      child: Text('Password',
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'Montserrat',
                              color: Colors.grey)),
                    )),
                Email_textField(controller: _password, obscureText: true),
                const SizedBox(height: 56),
                signup_button(onTap: () async {
                  final email = _email.text;
                  final password = _password.text;
                  
                  try {
                    // ignore: unused_local_variable
                    final credential = await FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                      email: email,
                      password: password,
                    );
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'weak-password') {
                      // ignore: use_build_context_synchronously
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("The password provided is too weak."),
                      ));
                    } else if (e.code == 'email-already-in-use') {
                      ScaffoldMessenger.of(context).showSnackBar( SnackBar(
                        content:
                            Text.rich(
                               TextSpan(
                                children: [
                                  TextSpan(text: 'The account already exists '),
                                  TextSpan(text: '$email', style: TextStyle(color:Colors.blue[300] ))
                                ]
                               ),
                            )
                      )
                      );
                    }
                  } catch (e) {
                    print(e);
                  }
                }),
                const SizedBox(height: 10),
                const Text.rich(TextSpan(
                    style: TextStyle(
                        color: Colors.black, fontSize: 15), //apply style to all
                    children: [
                      TextSpan(
                          text: 'Already have an account?',
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontFamily: 'Montserrat')),
                      TextSpan(
                          text: 'Login',
                          style: TextStyle(
                              color: Color(0xff05c555), fontFamily: 'Montserrat'))
                    ]))
              ],
            )
        )
        )
  
    
    );
  
  }
}
