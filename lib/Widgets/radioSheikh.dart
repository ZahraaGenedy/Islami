import 'package:flutter/material.dart';

class Radiosheikh extends StatelessWidget {
  String sheikhName;

  bool on;

  Radiosheikh({super.key, required this.sheikhName, required this.on});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.only(bottom: screenWidth * 0.05),
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(
              top: screenWidth * 0.05,
              left: screenWidth * 0.25,
            ),
            width: screenWidth * 0.9,
            height: screenWidth * 0.34,
            decoration: BoxDecoration(
              color: Color(0xFFE2BE7F),
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Text(
              "Radio $sheikhName",
              style: TextStyle(
                  fontSize: screenWidth * 0.044, fontWeight: FontWeight.bold),
            ),
          ),
          Positioned(
              top: screenWidth * 0.1,
              child: Image.asset(
                  on ? "assets/images/mask1.png" : "assets/images/mask.png")),
          Positioned(
              top: screenWidth * 0.22,
              left: screenWidth * 0.45,
              child: Row(
                children: [
                  Image.asset(
                    on ? "assets/images/Pause.png" : "assets/images/On.png",
                  ),
                  SizedBox(width: screenWidth * 0.05),
                  on
                      ? Image.asset("assets/images/VolumeCross.png")
                      : Image.asset("assets/images/VolumeHigh.png"),
                ],
              )),
        ],
      ),
    );
  }
}
