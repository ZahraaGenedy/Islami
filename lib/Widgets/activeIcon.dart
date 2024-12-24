import 'package:flutter/material.dart';

class Activeicon extends StatelessWidget {
  String image;

  Activeicon({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
        color: Color(0x992020202),
        borderRadius: BorderRadius.circular(15),
      ),
      padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.04, vertical: screenWidth * 0.01),
      child: Image(
        image: AssetImage(
          image,
        ),
        color: Colors.white,
        width: screenWidth * 0.06,
      ),
    );
  }
}
