import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:medilinkup/components/Search_hospital_bar.dart';
import 'package:medilinkup/firebase_options.dart';
import 'package:medilinkup/views/login_screen.dart';
import 'package:medilinkup/views/opening_screen.dart';
import 'package:medilinkup/views/signup_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //resizeToAvoidBottomInset: false,
        appBar: AppBar(
          leading: Icon(
            Icons.menu,
            color: Colors.black,
          ),
          title: Center(
            child:
                const Text('Medilinkup', style: TextStyle(color: Colors.black)),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.notifications_rounded),
              color: Colors.black,
            )
          ],
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
                bottomNavigationBar: BottomAppBar(
          color: Color(0xff05c555),
          child: Padding(
            padding: EdgeInsets.all(1),
            child: Container(
              height: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.home),
                    color: Colors.white,
                  ),
                  Text('Home', style: TextStyle( color: Colors.white54),)
                    ],
                  )
                  ,
                   Column(
                    children: [
                      IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.favorite),
                    color: Colors.white,
                  ),
                  Text('Favorites', style: TextStyle( color: Colors.white54),)
                    ],
                  ),
                  Column(
                    children: [
                      IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.person),
                    color: Colors.white,
                  ),
                  Text('Profile', style: TextStyle( color: Colors.white54),)
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        body: Container(
          child: Column(
            children: [
              FutureBuilder(
                future: Firebase.initializeApp(
                  options: DefaultFirebaseOptions.currentPlatform,
                ),
                builder: (context, snapshot) {
                  if (snapshot.data != null) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.done:
                        final user =
                            FirebaseAuth.instance.currentUser!.email.toString();
                        if (user != null) {
                          return const Center(
                              //child: CircularProgressIndicator(),
                              );
                        } else {
                          return const Login();
                        }

                      default:
                        return const Text('Done');
                    }
                  }
                  return const Text('');
                },
              ),

              CarouselSlider(
                    options: CarouselOptions(height: 200.0),
                    items: [1,2,3,4,5].map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.symmetric(horizontal: 5.0),
                            decoration: BoxDecoration(
                              color: Colors.amber
                            ),
                            child: Text('text ', style: TextStyle(fontSize: 16.0),)
                          );
                        },
                      );
                    }).toList(),
              )     
            
            ],
          ),
        ));
  }
}
