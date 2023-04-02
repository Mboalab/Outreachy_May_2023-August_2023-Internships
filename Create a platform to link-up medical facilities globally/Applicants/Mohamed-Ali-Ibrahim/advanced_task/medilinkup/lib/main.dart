import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:medilinkup/views/login_screen.dart';
import 'package:medilinkup/views/opening_screen.dart';
import 'package:medilinkup/views/signup_screen.dart';

import 'views/Home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MediLinkUp',
      home: const Home(),
      routes: {
        '/login/': (context) => const Login(),
        '/signup/': (context) => SignUp(),
        '/home/': (context) => const Home()
      },
    );
  }
}




