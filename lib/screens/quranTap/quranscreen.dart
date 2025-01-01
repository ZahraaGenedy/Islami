import 'package:flutter/material.dart';
import 'package:islami_program/classes/colors.dart';
import 'package:islami_program/screens/quranTap/quranDetails.dart';
import 'package:islami_program/screens/quranTap/quranWidget.dart';

class QuranScreen extends StatefulWidget {
  static const String name = "sebhascreen";
  const QuranScreen({super.key});

  @override
  State<QuranScreen> createState() => _QuranScreenState();
}

class _QuranScreenState extends State<QuranScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      margin: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(child: Image.asset("assets/images/Logo.png")),
          TextFormField(
            cursorColor: AppColors.whiteColor,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(
                    color: AppColors.primaryDark,
                    width: 2,
                  )),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(
                    color: AppColors.primaryDark,
                    width: 2,
                  )),
              prefixIcon: const ImageIcon(
                  color: AppColors.primaryDark,
                  AssetImage("assets/images/search-icon.png")),
              hintText: 'Sura Name',
              hintStyle: TextStyle(
                color: AppColors.primaryDark,
              ),
            ),
          ),
          Text(
            "Most Recently",
            style: TextStyle(color: Colors.white),
          ),
          Text(
            "Sura List",
            style: TextStyle(color: Colors.white),
          ),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 60.0),
                child: Container(
                  width: double.infinity,
                  height: 1.5,
                  decoration: BoxDecoration(color: Colors.white),
                ),
              ),
              itemBuilder: (context, index) => Quranwidget(
                suraArabName: QuranDetails.arabicQuranSuras[index],
                suraEngName: QuranDetails.englishQuranSurahs[index],
                suraNumber: QuranDetails.AyaNumber[index],
                suraIndex: index+1,

              ),
              itemCount: QuranDetails.AyaNumber.length,
            ),
          )
        ],
      ),
    );
  }
}