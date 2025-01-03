import 'package:flutter/material.dart';
import 'package:islami_program/screens/homescreen.dart';
import 'package:islami_program/screens/quranTap/suraDetails.dart';

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
      home: HomeScreen(),
      darkTheme: MyDarkTheme.darkTheme,
      routes: {
        Suradetails.name : (context) => Suradetails() ,
      },

    );
  }
}

