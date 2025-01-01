import 'package:flutter/material.dart';

class SebhaScreen extends StatefulWidget {
  @override
  State<SebhaScreen> createState() => _SebhaScreenState();
}

class _SebhaScreenState extends State<SebhaScreen> {
  double rotation = 0;
  int i = 0;
  int counter = 0;

  List<String> Azkar = [
    "سبحان الله",
    "الحمد لله",
    "الله اكبر",
    "لا اله الا الله وحده",
    "الله اكبر",

  ];

  void onclicksebha() {
    setState(() {
      if (counter < (Azkar.length * 33)) {
        counter++;
        rotation += 2;
      } else {
        counter = 0;
        i = (i + 1) % Azkar.length;
      }
      if (counter % 33 == 1 && counter != 1) {
        i = (i + 1) % Azkar.length;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      width: double.infinity,
      height: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset("assets/images/Logo.png"),
            Text("سَبِّحِ ٱسۡمَ رَبِّكَ ٱلۡأَعۡلَى",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Raleway",
                    fontSize: screenHeight * 0.05)),
            Image.asset(
              "assets/images/Mask group.png",
            ),
            InkWell(
              onTap: () {
                onclicksebha();
              },
              child: Stack(
                children: [
                  Transform.rotate(
                    angle: 0.95398 + rotation,
                    child: Image.asset(
                      "assets/images/SebhaBody 1.png",
                    ),
                  ),
                  Positioned(
                    top:  screenHeight * 0.15,
                    left: screenWidth * 0.04,
                    right: screenWidth * 0.04,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          constraints: BoxConstraints(
                            maxWidth: screenWidth * 0.5,
                          ),
                          child: Text(
                            Azkar[i],
                            textAlign: TextAlign.center,
                            softWrap: true,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Raleway",
                              fontSize: screenHeight * 0.04,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 18.0),
                          child: Text("$counter",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Raleway",
                                fontSize: screenHeight * 0.05,
                              )),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
