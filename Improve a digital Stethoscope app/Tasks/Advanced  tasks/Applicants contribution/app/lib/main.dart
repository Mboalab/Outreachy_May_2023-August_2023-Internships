import 'package:flutter/material.dart';
import 'package:mboathoscope/providers/recording_provider.dart';
import 'package:mboathoscope/screens/HomePage.dart';
import 'package:mboathoscope/screens/RolePage.dart';
import 'package:mboathoscope/screens/StartPage.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
  const MyApp()
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  ChangeNotifierProvider(
      create: (_) => RecordingProvider(),
      child: MaterialApp(
        // title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue
        ),
        home: const StartPage(),
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '': (context) => const StartPage(),
          '/rolepage': (context) => const RolePage(),
          '/homepage': (context) => const HomePage(),
        },
      ),
    );
  }
}
