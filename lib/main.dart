import 'package:flutter/material.dart';
import 'onboarding2.dart';
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
        '/': (context) => Onboarding2(),
        '/four': (context) => Home1(),
      },
    );
  }
}
