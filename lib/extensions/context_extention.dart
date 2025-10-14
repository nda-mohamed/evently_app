import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';

extension BuildContextExtensions on BuildContext {
  ColorScheme get appColors => Theme.of(this).colorScheme;
  TextTheme get appTextTheme => Theme.of(this).textTheme;
  AppLocalizations get locals => AppLocalizations.of(this)!;
}


// OCP -> Open for extensions close for modification