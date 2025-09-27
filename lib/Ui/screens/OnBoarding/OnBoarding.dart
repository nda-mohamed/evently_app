import 'package:evently_app/Ui/common/AppNameText.dart';
import 'package:evently_app/Ui/design/design.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

class OnBoardingScreen extends StatelessWidget {
  static const String routeName = '/onboarding';
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image(image: Svg(AppImages.appIcon)),
            AppNameText(),
          ],
        ),
      ),
    );
  }

}