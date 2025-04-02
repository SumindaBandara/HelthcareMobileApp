import 'package:flutter/material.dart';

import 'package:untitled/onboarding1.dart';
import 'package:untitled/onboarding2.dart';

import 'package:untitled/topdoctor.dart';
import 'package:untitled/user.dart';
import 'package:untitled/Sign_in.dart';

import 'home1.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Onboarding1(),
        '/one': (context) => Home1(),
        '/two': (context) => Onboarding2(),
        '/four': (context) => Onboarding3(),
        '/three': (context) => TopDoctorsScreen(),
        '/five': (context) => Sign_in(),
      },
    );
  }
}
