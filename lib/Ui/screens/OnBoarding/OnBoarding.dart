import 'package:evently_app/Ui/common/AppNameText.dart';
import 'package:evently_app/Ui/common/theme_switch.dart';
import 'package:evently_app/Ui/design/design.dart';
import 'package:flutter/material.dart';
import '../../../l10n/app_localizations.dart';
import '../../../routes.dart';
import '../../common/language_switcher.dart';

class OnBoardingScreen extends StatelessWidget {
  static const String route = "onBoarding";

  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
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

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.asset(AppImages.onBoarding1, width: 361, height: 361),

            const SizedBox(height: 28),

            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    AppLocalizations.of(context)!.onboarding_screen_title,
                    style: Theme.of(context).textTheme.titleMedium,
                    textAlign: TextAlign.start,
                  ),

                  const SizedBox(height: 28),

                  Text(
                    AppLocalizations.of(context)!.onboarding_screen_subtitle,
                    style: Theme.of(context).textTheme.bodyMedium,
                    textAlign: TextAlign.start,
                  ),

                  const SizedBox(height: 28),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.language,
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(fontWeight: FontWeight.w500),
                        textAlign: TextAlign.start,
                      ),
                      LanguageSwitcher(),
                    ],
                  ),

                  SizedBox(height: 12),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.theme,
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(fontWeight: FontWeight.w500),
                        textAlign: TextAlign.start,
                      ),
                      ThemeSwitcher(),
                    ],
                  ),

                  SizedBox(height: 24),

                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        AppRoutes.IntroScreen.route,
                      );
                    },
                    child: Text(
                      AppLocalizations.of(context)!.lets_start,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ),
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
