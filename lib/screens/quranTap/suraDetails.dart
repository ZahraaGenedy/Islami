import 'package:flutter/material.dart';
import 'package:islami_program/classes/colors.dart';
import 'package:islami_program/screens/quranTap/quranDetails.dart';
import 'package:flutter/services.dart';

class Suradetails extends StatefulWidget {
  static const String name = "suraDetails";

  Suradetails({super.key});

  @override
  State<Suradetails> createState() => _SuradetailsState();
}

class _SuradetailsState extends State<Suradetails> {
  List<String> verses = [];
  String suraContentjoin = "";

  @override
  Widget build(BuildContext context) {
    var arg = ModalRoute.of(context)!.settings.arguments as QuranDetailsModel;
    if (verses.isEmpty) getFileData(arg.index);
    if (suraContentjoin.isEmpty) getFileData(arg.index);

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: AppColors.black,
        title: Text(
          "${arg.englishQuranSurahs}",
          style: TextStyle(color: AppColors.primaryDark),
        ),
        centerTitle: true,
      ),
      body: Stack(alignment: Alignment.center, children: [
        Container(
          color: AppColors.black,
          width: double.infinity,
          height: double.infinity,
          child: Image.asset(
            "assets/images/detailsbg.png",
            fit: BoxFit.fill,
          ),
        ),
        Column(
          children: [
            Text(
              "${arg.arabicQuranSuras}",
              style: TextStyle(color: AppColors.primaryDark),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text(
                textAlign: TextAlign.center,
                suraContentjoin,
                style: TextStyle(
                  color: AppColors.primaryDark,
                ),
                textDirection: TextDirection.rtl,

              ),
            ),
            Expanded(
              child: verses.isEmpty
                  ? Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primaryDark,
                      ),
                    )
                  : ListView.builder(
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20.0),
                          child: Text(
                            "${verses[index]}[${index + 1}]",
                            style: TextStyle(color: AppColors.primaryDark),
                            textDirection: TextDirection.rtl,
                            textAlign: TextAlign.center,
                          ),
                        );
                      },
                      itemCount: verses.length,
                    ),
            ),
          ],
        )
      ]),
    );
  }

  void getFileData(int index) async {
    String content =
        await rootBundle.loadString("assets/files/${index + 1}.txt");
    List<String> suraLine = content.split("\n");
    String joinedContent = suraLine
        .asMap()
        .entries
        .map((entry) => "${entry.value}[${entry.key + 1}]")
        .join(" ");
    verses = suraLine;
    suraContentjoin = joinedContent;
    setState(() {});
  }
}
