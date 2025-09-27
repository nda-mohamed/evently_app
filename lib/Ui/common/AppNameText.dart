import 'package:evently_app/Ui/design/design.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppNameText extends StatelessWidget {
  const AppNameText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "Evently",
      style: Theme.of(context).textTheme.titleLarge?.copyWith(
        fontWeight: FontWeight.w400,
        fontSize: 36,
        color: AppColors.lightPrimary,
      ),
    );
  }
}