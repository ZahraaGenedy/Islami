import 'package:flutter/material.dart';

class MyDarkTheme {
  static final ThemeData darkTheme = ThemeData(
      canvasColor: Color(0xFFE2BE7F),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        showUnselectedLabels: false,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black,
      ));
}
