import 'package:flutter/material.dart';
import 'package:islami_program/classes/colors.dart';
import 'package:islami_program/screens/quranTap/quranDetailsModel.dart';
import 'package:islami_program/screens/quranTap/quranWidget.dart';
import 'package:islami_program/screens/quranTap/suraDetails.dart';

class QuranScreen extends StatefulWidget {
  static const String name = "sebhascreen";
  const QuranScreen({super.key});

  @override
  State<QuranScreen> createState() => _QuranScreenState();
}

class _QuranScreenState extends State<QuranScreen> {
  String textSearch = "";
  void getQuranModel() {
    for (int i = 0; i < 114 ; i++) {
      QuranDetailsModel.quranList.add(QuranDetailsModel(
          englishQuranSurahs: QuranDetailsModel.englishQuranSurahsList[i],
          ayaNumber: QuranDetailsModel.ayaNumberList[i],
          arabicQuranSuras: QuranDetailsModel.arabicQuranSurasList[i],
          suraName: "${i + 1}.txt"));
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getQuranModel();
  }

  List<QuranDetailsModel> filterList = QuranDetailsModel.quranList;

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
            style: TextStyle(
              color: Colors.white,
            ),
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
            onChanged: (text){
              textSearch = text;
               filterList = QuranDetailsModel.quranList.where((quranModel){
                return quranModel.arabicQuranSuras.contains(textSearch) ||
                    quranModel.englishQuranSurahs.toLowerCase().contains(textSearch.toLowerCase());

              }).toList();
               setState(() {

               });
            },
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
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed(Suradetails.name,
                      arguments: filterList[index]);
                },
                child: Quranwidget(
                  index: index,
                  suraModel: filterList[index],
                ),
              ),
              itemCount: filterList.length
            ),
          )
        ],
      ),
    );
  }
}
