import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppSharedPreferences {
  static const String themeKey = "theme";
  static const String light = "light";
  static const String dark = "dark";

  late SharedPreferences _sharedPreferences;

  AppSharedPreferences._() {
    // private constructor
  }

  static AppSharedPreferences? _app_shared_preferences = null;

  static Future<void> init() async {
    if (_app_shared_preferences == null) {
      _app_shared_preferences = AppSharedPreferences._();
      await _app_shared_preferences?._initSharedPreferences();
    }
  }

  Future<void> saveTheme(ThemeMode mode) async {
    var themeName = mode == ThemeMode.light ? light : dark;
    await _sharedPreferences.setString(themeKey, themeName);
  }

  ThemeMode getCurrentTheme() {
    var themeName = _sharedPreferences.getString(themeKey);
    return themeName == dark ? ThemeMode.dark : ThemeMode.light;
  }

  static AppSharedPreferences getInstance() {
    if (_app_shared_preferences == null) {
      throw Exception(
        "make sure to call init before using "
        "get Instance",
      );
    }
    return _app_shared_preferences!;
  }

  Future<void> _initSharedPreferences() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<void> saveLocale(Locale local) async {
    await _sharedPreferences.setString("locale", local.languageCode);
  }

  Locale getCurrentLocale() {
    var langCode = _sharedPreferences.getString("locale");
    return langCode == null ? Locale('en')
        : Locale.fromSubtags(languageCode: langCode);
  }
}
