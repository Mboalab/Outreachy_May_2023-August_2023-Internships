import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:medilinkup/views/login_screen.dart';
import 'package:medilinkup/views/opening_screen.dart';
import 'package:medilinkup/views/signup_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'firebase_options.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title:  'MediLinkUp',
      home: HomePage(),
      routes: {
        '/login/':(context) => const Login(),
        '/signup/' :(context) =>  SignUp(),
        '/Home/':(context) => const HomePage()
      },
    );
  }
}


class HomePage
 extends StatelessWidget {
  const HomePage
  ({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
  
      appBar: AppBar(
        title: const Text('Medilinkup'),
      ),
      body: FutureBuilder(future: Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,),
       builder: (context, snapshot) {
         switch(snapshot.connectionState){
          case ConnectionState.done:
          final p = FirebaseAuth.instance.currentUser!.email.toString();
          print(p);
            return const Text('Done');
          default: 
            return const Text('Loading...');

         }
       },
    ));
          
  }
} 