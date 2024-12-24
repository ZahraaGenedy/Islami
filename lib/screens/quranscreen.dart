import 'package:flutter/material.dart';
import 'package:islami_program/classes/colors.dart';
class QuranScreen extends StatefulWidget {
  static const String name = "sebhascreen";

  QuranScreen({super.key});

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
        children: [
          Image.asset("assets/images/Logo.png"),
          TextFormField(
            cursorColor: AppColors.whiteColor,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(
                    color: AppColors.primaryDark,
                    width: 2,
                  )
              ) ,
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(
                    color: AppColors.primaryDark,
                    width: 2,
                  )
              ) ,
              prefixIcon: const ImageIcon(
                  color: AppColors.primaryDark,
                  AssetImage("assets/images/search-icon.png")
              ),
              hintText: 'Sura Name' ,
              hintStyle: TextStyle(
                color: AppColors.primaryDark,
              ),
            ),
          )
        ],
      ),
    );
  }
}
