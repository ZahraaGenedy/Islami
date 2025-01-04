import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/services.dart';
import 'package:islami_program/classes/colors.dart';
import 'package:islami_program/screens/hadithTap/hadithDetails.dart';
import 'package:islami_program/screens/hadithTap/hadithModel.dart';

class HadithScreen extends StatefulWidget {
  static const String name = "sebhascreen";

  HadithScreen({super.key});

  @override
  State<HadithScreen> createState() => _HadithScreenState();
}

class _HadithScreenState extends State<HadithScreen> {
  List<Hadithmodel> hadithList = [];
  @override
  Widget build(BuildContext context) {
    if (hadithList.isEmpty) {
      getFileData();
    }
    return Padding(
      padding: const EdgeInsets.only(top: 50.0),
      child: Column(children: [
        Center(child: Image.asset("assets/images/Logo.png")),
        Expanded(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            child: hadithList.isEmpty
                ? Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primaryDark,
                    ),
                  )
                : CarouselSlider.builder(
                    options: CarouselOptions(
                      height: 500,
                      viewportFraction: 0.8,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 3),
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      scrollDirection: Axis.horizontal,
                    ),
                    itemCount: hadithList.length,
                    itemBuilder: (BuildContext context, int itemIndex,
                            int pageViewIndex) =>
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              Hadithdetails.name,
                              arguments: Hadithmodel(
                                  content: hadithList[itemIndex].content,
                                  title: hadithList[itemIndex].title,
                                  index: itemIndex),
                            );
                          },
                          child: Stack(children: [
                            Container(
                                width: double.infinity,
                                height: double.infinity,
                                decoration: BoxDecoration(
                                    color: AppColors.primaryDark,
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                        color: AppColors.primaryDark))),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 8.0, right: 0.8, left: 0.8),
                              child: Image.asset(
                                "assets/images/detailsbg.png",
                                color: AppColors.black,
                                width: double.infinity,
                                height: double.infinity,
                                fit: BoxFit.fill,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(30.0),
                              child: Column(
                                children: [
                                  Text(
                                    hadithList[itemIndex].title,
                                    style: TextStyle(
                                        color: AppColors.black,
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 10.0),
                                      child: Text(
                                        textAlign: TextAlign.center,
                                        hadithList[itemIndex].content.join(" "),
                                        style: TextStyle(
                                            color: AppColors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ]),
                        )),
          ),
        ),
      ]),
    );
  }

  void getFileData() async {
    for (int i = 1; i <= 50; i++) {
      String content = await rootBundle.loadString("assets/files/h$i.txt");
      List<String> hadithLines = content.split("\n");
      String hadithName = hadithLines[0];
      hadithLines.removeAt(0);
      List<String> hadithContent = hadithLines;
      Hadithmodel hadithmodel =
          Hadithmodel(content: hadithContent, title: hadithName, index: i);
      hadithList.add(hadithmodel);
      setState(() {});
    }
  }
}
