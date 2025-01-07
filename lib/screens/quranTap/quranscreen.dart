import 'package:flutter/material.dart';
import 'package:islami_program/classes/colors.dart';
import 'package:islami_program/screens/quranTap/quranDetailsModel.dart';
import 'package:islami_program/screens/quranTap/quranWidget.dart';
import 'package:islami_program/screens/quranTap/suraDetails.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QuranScreen extends StatefulWidget {
  static const String name = "sebhascreen";
  const QuranScreen({super.key});

  @override
  State<QuranScreen> createState() => _QuranScreenState();
}

class _QuranScreenState extends State<QuranScreen> {
  void getQuranModel() {
    for (int i = 0; i < 114; i++) {
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
    if (QuranDetailsModel.quranList.isEmpty) {
      getQuranModel();
      loadLastSura();
    }
  }

  String textSearch = "";
  List<QuranDetailsModel> filterList = QuranDetailsModel.quranList;
  Map<String, String> loadSuraList = {};
  bool isselected = false;

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
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            child: TextFormField(
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
              onChanged: (text) {
                text.isEmpty ?isselected = false
                : isselected = true;

                textSearch = text;
                filterList = QuranDetailsModel.quranList.where((quranModel) {
                  return quranModel.arabicQuranSuras.contains(textSearch) ||
                      quranModel.englishQuranSurahs
                          .toLowerCase()
                          .contains(textSearch.toLowerCase());
                }).toList();
                setState(() {});
              },
            ),
          ),
          isselected
              ? Text("")
              : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Most Recently",
                      style: TextStyle(color: Colors.white),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.7,
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                            color: AppColors.primaryDark,
                            borderRadius: BorderRadius.circular(20)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  loadSuraList['suraEnName'] ?? " ",
                                  style: TextStyle(fontSize: 24),
                                ),
                                Text(
                                  loadSuraList['suraAraName'] ?? " ",
                                  style: TextStyle(fontSize: 24),
                                ),
                                Text(
                                  loadSuraList['numOfVerses'] ?? " ",
                                  style: TextStyle(fontSize: 14),
                                ),
                              ],
                            ),
                            Expanded(
                                child:
                                    Image.asset("assets/images/suraimage.png")),
                          ],
                        ),
                      ),
                    ),
                  ],
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
                        saveSuraList(
                            suraAraName: filterList[index].arabicQuranSuras,
                            suraEnName: filterList[index].englishQuranSurahs,
                            numOfVerses: filterList[index].ayaNumber);
                        Navigator.of(context).pushNamed(Suradetails.name,
                            arguments: filterList[index]);
                        // loadLastSura();
                      },
                      child: Quranwidget(
                        index: index,
                        suraModel: filterList[index],
                      ),
                    ),
                itemCount: filterList.length),
          )
        ],
      ),
    );
  }

  saveSuraList(
      {required String suraAraName,
      required String suraEnName,
      required String numOfVerses}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('suraAraName', suraAraName);
    await prefs.setString('suraEnName', suraEnName);
    await prefs.setString('numOfVerses', numOfVerses);
    await loadLastSura();
  }

  getSuraList() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String suraAraName = prefs.getString('suraAraName') ?? " ";
    String suraEnName = prefs.getString('suraEnName') ?? " ";
    String numOfVerses = prefs.getString('numOfVerses') ?? " ";
    return {
      'suraAraName': suraAraName,
      'suraEnName': suraEnName,
      'numOfVerses': numOfVerses,
    };
  }

  loadLastSura() async {
    loadSuraList = await getSuraList();
    setState(() {});
  }
}
