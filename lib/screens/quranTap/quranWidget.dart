import 'package:flutter/material.dart';
import 'package:islami_program/screens/quranTap/quranDetailsModel.dart';

class Quranwidget extends StatelessWidget {
  QuranDetailsModel suraModel;
  int index;
  Quranwidget({super.key, required this.suraModel, required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Row(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Image(image: AssetImage("assets/images/Sura Number.png")),
              Text(
                "${index+1}",
                style: TextStyle(
                  color: Colors.white,
                ),
              )
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("${suraModel.englishQuranSurahs}",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                      Text(
                        "${suraModel.ayaNumber} verses",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Text(
                    "${suraModel.arabicQuranSuras}",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
