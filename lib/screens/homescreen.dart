import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const String name = "sebhascreen";

  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        backgroundColor: Colors.transparent,
      );
  }
}
