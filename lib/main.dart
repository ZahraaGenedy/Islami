import 'package:flutter/material.dart';
import 'package:islami_program/screens/homescreen.dart';
import 'package:islami_program/screens/onboarding.dart';

import 'classes/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnboardingScreen(),
      darkTheme: MyDarkTheme.darkTheme,

    );
  }
}

