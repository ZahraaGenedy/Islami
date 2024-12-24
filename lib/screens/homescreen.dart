import 'package:flutter/material.dart';
import 'package:islami_program/screens/hadithscreen.dart';
import 'package:islami_program/screens/quranscreen.dart';
import 'package:islami_program/screens/radioscreen.dart';
import 'package:islami_program/screens/sebhascreen.dart';
import 'package:islami_program/screens/timescreen.dart';

import '../Widgets/activeIcon.dart';
import '../classes/colors.dart';

class HomeScreen extends StatefulWidget {
  static const String name = "sebhascreen";

  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentpage = 0;
  List<Widget> pages = [
    QuranScreen(),
    HadithScreen(),
    SebhaScreen(),
    RadioScreen(),
    TimeScreen(),
  ];

  List<String> images = [
    "assets/images/Background.png",
    "assets/images/Background1.png",
    "assets/images/Background2.png",
    "assets/images/Background1.png",
    "assets/images/Background1.png"
  ];
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Image.asset(
        images[currentpage],
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.cover,
      ),
      Scaffold(
        backgroundColor: Colors.transparent,
        body: pages[currentpage],
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: AppColors.primaryDark,
          ),
          child: BottomNavigationBar(
            currentIndex: currentpage,
            onTap: (index) {
              setState(() {
                currentpage = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                icon: Image(image: AssetImage("assets/images/quran.png")),
                label: "Quran",
                activeIcon: Activeicon(image: "assets/images/quran.png"),
              ),
              BottomNavigationBarItem(
                icon: Image(image: AssetImage("assets/images/booktap.png")),
                label: "Hadith",
                activeIcon: Activeicon(image: "assets/images/booktap.png"),
              ),
              BottomNavigationBarItem(
                icon: Image(image: AssetImage("assets/images/sebha.png")),
                label: "Sebha",
                activeIcon: Activeicon(image: "assets/images/sebha.png"),
              ),
              BottomNavigationBarItem(
                icon: Image(image: AssetImage("assets/images/radiotap.png")),
                label: "Radio",
                activeIcon: Activeicon(image: "assets/images/radiotap.png"),
              ),
              BottomNavigationBarItem(
                icon: Image(image: AssetImage("assets/images/time.png")),
                label: "Time",
                activeIcon: Activeicon(image: "assets/images/time.png"),
              ),
            ],
          ),
        ),
      ),
    ]);
  }
}
