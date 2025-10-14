import 'package:evently_app/Ui/screens/login/LoginScreen.dart';
import 'package:evently_app/Ui/screens/OnBoarding/OnBoarding.dart';
import 'package:evently_app/Ui/screens/register/RegisterScreen.dart';
import 'package:flutter/material.dart';
import '../../common/AppNameText.dart';
import '../../design/design.dart';

class IntroScreen extends StatefulWidget {
  static const String route = "intro";

  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final PageController _pageController = PageController();
  int currentPage = 0;

  final List<Map<String, String>> introData = [
    {
      "image": AppImages.onBoarding2,
      "title": "Find Events That Inspire You",
      "subtitle": "Dive into a world of events crafted to fit your unique interests. Whether you're into live music, art workshops, professional networking, or simply discovering new experiences, we have something for everyone. Our curated recommendations will help you explore, connect, and make the most of every opportunity around you.",
    },
    {
      "image": AppImages.onBoarding3,
      "title": "Effortless Event Planning",
      "subtitle": "Take the hassle out of organizing events with our all-in-one planning tools. From setting up invites and managing RSVPs to scheduling reminders and coordinating details, we’ve got you covered. Plan with ease and focus on what matters – creating an unforgettable experience for you and your guests.",
    },
    {
      "image": AppImages.onBoarding4,
      "title": "Connect with Friends & Share Moments",
      "subtitle": "Make every event memorable by sharing the experience with others. Our platform lets you invite friends, keep everyone in the loop, and celebrate moments together. Capture and share the excitement with your network, so you can relive the highlights and cherish the memories.",
    },
  ];

  void nextPage() {
    if (currentPage < introData.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.pushReplacementNamed(context, RegisterScreen.route);
    }
  }

  void previousPage() {
    if (currentPage > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.pushReplacementNamed(context, OnBoardingScreen.route);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            //logo
            Padding(
              padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    AppImages.appIcon,
                    width: 48,
                    height: 49.76,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  const SizedBox(width: 10),
                  AppNameText(),
                ],
              ),
            ),
            // PageView
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() => currentPage = index);
                },
                itemCount: introData.length,
                itemBuilder: (context, index) {
                  return ListView(
                    padding: const EdgeInsets.all(20),
                    children: [
                      Image.asset(
                        introData[index]["image"]!,
                        height: 415,
                        width: 398,
                        fit: BoxFit.contain,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        introData[index]["title"]!,
                        style: const TextStyle(
                          fontSize: 24,
                          color: AppColors.lightPrimary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 39),
                      if (introData[index]["subtitle"]!.isNotEmpty)
                        Text(
                          introData[index]["subtitle"]!,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                    ],
                  );
                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      if (currentPage == 0) {
                        Navigator.pushReplacementNamed(context, OnBoardingScreen.route);
                      } else {
                        previousPage();
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: currentPage == 0 ? Colors.black : AppColors.lightPrimary,
                          width: 2,
                        ),
                      ),
                      child: Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: currentPage == 0 ? Colors.black : AppColors.lightPrimary,
                        size: 20,
                      ),
                    ),
                  ),

                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: List.generate(
                      introData.length,
                          (index) => Container(
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        width: currentPage == index ? 14 : 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: currentPage == index
                              ? AppColors.lightPrimary
                              : Colors.black,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                  ),

                  GestureDetector(
                    onTap: () {
                      if (currentPage == introData.length - 1) {
                        Navigator.pushReplacementNamed(context, RegisterScreen.route);
                      } else {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: AppColors.lightPrimary,
                          width: 2,
                        ),
                      ),
                      child: Icon(
                        currentPage == introData.length - 1
                            ? Icons.check_rounded
                            : Icons.arrow_forward_ios_rounded,
                        color: AppColors.lightPrimary,
                        size: 20,
                      ),
                    ),
                  ),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
