import 'package:flutter/material.dart';
import 'package:living_in_h2f/landingpage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LandingPage(),
      // routes: {
      //   '/login': (context) => LoginPage(),
      //   '/createAccount': (context) => CreateAccountPage(),
      //   '/created': (context) => CreatedPage(),
      // },
    );
  }
}