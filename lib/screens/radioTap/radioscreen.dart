import 'package:flutter/material.dart';

import '../../Widgets/radioSheikh.dart';

class RadioScreen extends StatefulWidget {
  static const String name = "sebhascreen";
  RadioScreen({super.key});
  @override
  State<RadioScreen> createState() => _RadioScreenState();
}

class _RadioScreenState extends State<RadioScreen> {
  bool isselectedtap1 = true;
  bool isselectedtap2 = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset("assets/images/Logo.png"),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: Color(0x99202020),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: (){
                        setState(() {
                          isselectedtap1 = true;
                          isselectedtap2= false;
                        });
                      },
                        child: _buildTab("Radio", isselectedtap1)),
                    InkWell(
                      onTap: (){
                        setState(() {
                          isselectedtap2 = true;
                          isselectedtap1 = false;
                        });
                      },
                        child: _buildTab("Reciters", isselectedtap2)),
                  ],
                ),
              ),
            ),
            isselectedtap1 ?
            Column(
                children: [
                  Radiosheikh(sheikhName: "Radio Ibrahim Al-Asdar", on: false),
                  Radiosheikh(sheikhName: "Radio Al-Qaria Yassen", on: true),
                  Radiosheikh(sheikhName: "Radio Ahmed Al-trabulsi", on: false),
                  Radiosheikh(sheikhName: "Radio Addokali Mohammed Alalim", on: false),
                  Radiosheikh(sheikhName: "Radio Ibrahim Al-Asdar", on: false)
                ]
            ) : Column(
                children: [
                  Radiosheikh(sheikhName: "Ibrahim Al-Asdar", on: false),
                  Radiosheikh(sheikhName: "Akram Alalaqmi", on: true),
                  Radiosheikh(sheikhName: "Majed Al-Enezi", on: false),
                  Radiosheikh(sheikhName: "Addokali Mohammed Alalim", on: false),
                  Radiosheikh(sheikhName: "Ibrahim Al-Asdar", on: false)
                ]
            ),6

          ],
        ),
      ),
    );
  }
}

Widget _buildTab(String title, bool isSelected) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 10, horizontal:65),
    decoration: BoxDecoration(
      color: isSelected ? Color(0xFFE2BE7F) : Colors.transparent,
      borderRadius: BorderRadius.circular(15),
    ),
    child: Text(
      title,
      style: TextStyle(
        color: isSelected ? Colors.black : Colors.white,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
