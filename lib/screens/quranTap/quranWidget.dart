
import 'package:flutter/material.dart';
import 'package:islami_program/screens/quranTap/quranDetails.dart';
import 'package:islami_program/screens/quranTap/suraDetails.dart';

class Quranwidget extends StatelessWidget {
  QuranDetailsModel suraModel;
  Quranwidget({super.key,required this.suraModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Image(image: AssetImage("assets/images/Sura Number.png")),
                Text("${suraModel.index}",style: TextStyle(color: Colors.white ,),)
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
                       Text("${suraModel.englishQuranSurahs}",style: TextStyle(color: Colors.white,fontSize: 20 ,fontWeight: FontWeight.bold)),
                       Text("${suraModel.AyaNumber} verses",style: TextStyle(color: Colors.white, fontSize: 14 ,fontWeight: FontWeight.bold),),

                     ],
                   ),
                   Text("${suraModel.arabicQuranSuras}",style: TextStyle(color: Colors.white,fontSize: 20 ,fontWeight: FontWeight.bold),),
                 ],
               ),
             ),
           )
          ],
        ),

    );
  }
}
