import 'package:flutter/material.dart';
import 'Ui/design/design.dart';
import 'Ui/screens/OnBoarding/OnBoarding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Event Planning App',
      theme: AppThemes.lightTheme,
      themeMode: ThemeMode.light,
      initialRoute: OnBoardingScreen.routeName,
      routes: {
        OnBoardingScreen.routeName: (context) => const OnBoardingScreen(),
      },
    );
  }
}
