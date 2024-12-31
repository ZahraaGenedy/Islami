import 'package:flutter/material.dart';
import 'package:islami_program/classes/colors.dart';
import 'package:islami_program/screens/homescreen.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}
class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xFF202020),
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              children: [
                buildPage(
                  image: 'assets/images/onboard1.png',
                  title: '',
                  description: 'Welcome To Islmi App',
                ),
                buildPage(
                  image: 'assets/images/onboard2.png',
                  title: 'Welcome To Islmi',
                  description:
                      'We Are Very Excited To Have You In Our Community',
                ),
                buildPage(
                  image: 'assets/images/onboard3.png',
                  title: 'Reading the Quran',
                  description: 'Read, and your Lord is the Most Generous',
                ),
                buildPage(
                  image: 'assets/images/onboard4.png',
                  title: 'Bearish',
                  description: 'Praise the name of your Lord, the Most High',
                ),
                buildPage(
                  image: 'assets/images/onboard5.png',
                  title: 'Holy Quran Radio',
                  description:
                      'You can listen to the Holy Quran Radio through the application for free and easily',
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _currentIndex > 0
                    ? TextButton(
                        onPressed: () {
                          _pageController.previousPage(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.fastOutSlowIn);
                        },
                        child: Text(
                          'Back',
                          style: TextStyle(color: AppColors.primaryDark),
                        ),
                      )
                    : SizedBox(
                        width: MediaQuery.of(context).size.width * 0.166,
                      ),
                buildIndicator(),
                TextButton(
                  onPressed: () {
                    setState(() {
                      if (_currentIndex < 4) {
                        _pageController.nextPage(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.fastOutSlowIn);
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomeScreen(),
                          ),
                        );
                      }
                    });
                  },
                  child: Text(
                    _currentIndex < 4 ? 'Next' : 'Finish',
                    style: TextStyle(color: AppColors.primaryDark),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildPage(
      {required String image,
      required String title,
      required String description}) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/Logo.png",
            width: screenHeight * 0.3,
          ),
          SizedBox(height: screenHeight * 0.05),
          Image.asset(image, width: screenHeight * 0.45),
          SizedBox(height: screenHeight * 0.05),
          Text(
            title,
            style: TextStyle(
                color: AppColors.primaryDark,
                fontSize: 24,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(height: screenHeight * 0.03),
          Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(color: AppColors.primaryDark, fontSize: 20),
          ),
        ],
      ),
    );
  }

  Widget buildIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(5, (index) {
        return AnimatedContainer(
          duration: Duration(milliseconds: 300),
          margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          width: _currentIndex == index ? 18 : 8,
          height: 7,
          decoration: BoxDecoration(
            color: _currentIndex == index ? Colors.amber : Colors.grey,
            borderRadius: BorderRadius.circular(4),
          ),
        );
      }),
    );
  }
}
