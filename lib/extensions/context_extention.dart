import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';

extension BuildContextExtensions on BuildContext {
  ColorScheme get appColors => Theme.of(this).colorScheme;
  TextTheme get appTextTheme => Theme.of(this).textTheme;
  AppLocalizations get locals => AppLocalizations.of(this)!;

  void showMessageDialog(
    String message, {
    String? posActionText,
    VoidCallback? onPosActionClick,
    String? negActionText,
    VoidCallback? onNegActionClick,
    bool isDismissible = true,
  }) {
    showDialog(
      context: this,
      builder: (context) {
        var actions = [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              onPosActionClick?.call();
            },
            child: Text(posActionText ?? 'ok'),
          ),
        ];

        if (negActionText != null) {
          actions.add(
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                onNegActionClick?.call();
              },
              child: Text(negActionText),
            ),
          );
        }

        return AlertDialog(
          content: Row(
            children: [Text(message, style: context.appTextTheme.bodyMedium)],
          ),
          actions: actions,
        );
      },

      barrierDismissible: isDismissible,
    );
  }

  void showLoadingDialog({String? message, bool isDismissible = true}) {
    showDialog(
      context: this,
      builder: (context) {
        return AlertDialog(
          content: Row(
            children: [
              CircularProgressIndicator(),
              Text(message ?? "Loading..."),
            ],
          ),
        );
      },
      barrierDismissible: isDismissible,
    );
  }
}

// OCP -> Open for extensions close for modification
