import 'package:flutter/material.dart';
import 'package:islami_program/classes/colors.dart';
import 'package:islami_program/screens/hadithTap/hadithModel.dart';
import 'package:flutter/services.dart';

class Hadithdetails extends StatefulWidget {
  static const String name = "hadithdetails";

  Hadithdetails({super.key});

  @override
  State<Hadithdetails> createState() => _HadithdetailsState();
}

class _HadithdetailsState extends State<Hadithdetails> {
  @override
  Widget build(BuildContext context) {
    var arg = ModalRoute.of(context)!.settings.arguments as Hadithmodel;

    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: AppColors.black,
        title: Text(
          "Hadith ${arg.index + 1}",
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
                "${arg.title}",
                style: TextStyle(
                  color: AppColors.primaryDark,
                  fontSize: 24.0,
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(28.0),
                child: arg.content.isEmpty
                    ? Center(
                        child: CircularProgressIndicator(
                          color: AppColors.primaryDark,
                        ),
                      )
                    : Text(
                        arg.content.join(" "),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: AppColors.primaryDark,
                            fontSize: 18.0,
                            height: 2),
                        textDirection: TextDirection.rtl,
                      ),
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
