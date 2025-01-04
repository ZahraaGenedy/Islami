import 'package:flutter/material.dart';
import 'package:islami_program/classes/colors.dart';
import 'package:islami_program/screens/quranTap/quranDetailsModel.dart';
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
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    var arg = ModalRoute.of(context)!.settings.arguments as QuranDetailsModel;
    if (verses.isEmpty && suraContentjoin.isEmpty) {
      getFileData(arg.index);
    }

    return Scaffold(
      backgroundColor: AppColors.black,
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
        Positioned.fill(
          child: Image.asset(
            "assets/images/detailsbg.png",
            fit: BoxFit.fill,
          ),
        ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text(
                "${arg.arabicQuranSuras}",
                style: TextStyle(
                  color: AppColors.primaryDark,
                  fontSize: 24.0,
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(18.0),
                child: Text(
                  suraContentjoin,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: AppColors.primaryDark, fontSize: 18.0, height: 2),
                  textDirection: TextDirection.rtl,
                ),
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
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedIndex = index;
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 6),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 6),
                              decoration: BoxDecoration(
                                color: selectedIndex == index
                                    ? AppColors.primaryDark
                                    : Colors.transparent,
                                border:
                                    Border.all(color: AppColors.primaryDark),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Text(
                                "${verses[index]}[${index + 1}]",
                                style: TextStyle(
                                    color: selectedIndex == index
                                        ? AppColors.black
                                        : AppColors.primaryDark),
                                textDirection: TextDirection.rtl,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        );
                      },
                      itemCount: verses.length,
                    ),
            ),
          ],
        ),
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

    setState(() {
      verses = suraLine;
      suraContentjoin = joinedContent;
    });
  }
}
