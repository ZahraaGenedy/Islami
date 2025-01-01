
import 'package:flutter/material.dart';
import 'package:islami_program/screens/quranTap/suraDetails.dart';

class Quranwidget extends StatelessWidget {
  String suraNumber ;
  String suraArabName;
  String suraEngName;
  int suraIndex;
  Quranwidget({super.key,required this.suraArabName ,required this.suraEngName ,required this.suraNumber, required this.suraIndex});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).pushNamed(Suradetails.name);
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Image(image: AssetImage("assets/images/Sura Number.png")),
                Text("$suraIndex",style: TextStyle(color: Colors.white ,),)
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
                       Text("$suraEngName",style: TextStyle(color: Colors.white,fontSize: 20 ,fontWeight: FontWeight.bold)),
                       Text("$suraNumber verses",style: TextStyle(color: Colors.white, fontSize: 14 ,fontWeight: FontWeight.bold),),

                     ],
                   ),
                   Text("$suraArabName",style: TextStyle(color: Colors.white,fontSize: 20 ,fontWeight: FontWeight.bold),),
                 ],
               ),
             ),
           )
          ],
        ),
      ),
    );
  }
}
