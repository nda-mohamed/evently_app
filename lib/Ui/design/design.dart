import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const Color lightPrimary = Color(0xFF5669FF);
  static const Color backgroundColor = Color(0xFFF2FEFF);
  static const Color darkBackgroundColor = Color(0xFF101127);
  static const Color gray = Color(0xFF7B7B7B);
}

class AppImages {
  static const String appIcon = "assets/images/app_logo.png";
  static const String icAr = "assets/images/ic_ar.png";
  static const String icEn = "assets/images/ic_en.png";
  static const String icLight = "assets/images/ic_light.png";
  static const String icDark = "assets/images/ic_dark.png";

  static const String onBoarding1 = "assets/images/onboarding_1.png";
  static const String onBoarding2 = "assets/images/onboarding2.png";
  static const String onBoarding3 = "assets/images/onboarding3.png";
  static const String onBoarding4 = "assets/images/onboarding4.png";
  static const String forget_password = "assets/images/forget_password.png";

  static const String home = "assets/icons/home.svg";
  static const String homeFill = "assets/icons/home_fill.svg";
  static const String map = "assets/icons/map.svg";
  static const String mapFill = "assets/icons/map_fill.svg";
  static const String heart = "assets/icons/heart.svg";
  static const String heartFill = "assets/icons/heart_fill.svg";
  static const String user = "assets/icons/user.svg";
  static const String userFill = "assets/icons/user_fill.svg";

  static const String Birthday = "assets/tabs/Birthday.png";
  static const String Book_Club = "assets/tabs/Book_Club.png";
  static const String Eating = "assets/tabs/Eating.png";
  static const String Exhibition = "assets/tabs/Exhibition.png";
  static const String Gaming = "assets/tabs/Gaming.png";
  static const String Holiday = "assets/tabs/Holiday.png";
  static const String Meeting = "assets/tabs/Meeting.png";
  static const String Sports = "assets/tabs/Sports.png";
  static const String Work_Shop = "assets/tabs/Work_Shop.png";

}

class AppThemes {
  static var lightTheme = ThemeData(
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.backgroundColor,
      surfaceTintColor: Colors.transparent,
      titleTextStyle: TextStyle(
        color: AppColors.lightPrimary,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      centerTitle: true,
      iconTheme: IconThemeData(color: AppColors.lightPrimary),
    ),

    colorScheme: ColorScheme.light(primary: AppColors.lightPrimary),

    textTheme: TextTheme(
      titleLarge: GoogleFonts.inter(
        color: Colors.white,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),

      titleMedium: GoogleFonts.jockeyOne(
        color: AppColors.lightPrimary,
        fontSize: 20,
        fontWeight: FontWeight.w700,
      ),

      titleSmall: GoogleFonts.jockeyOne(
        color: Colors.white,
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),

      bodyLarge: GoogleFonts.jockeyOne(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),

      bodyMedium: GoogleFonts.inter(
        color: Colors.black,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),

      bodySmall: GoogleFonts.inter(
        color: Colors.white,
        fontSize: 12,
        fontWeight: FontWeight.bold,
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 12),
        backgroundColor: AppColors.lightPrimary,
        textStyle: GoogleFonts.inter(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.lightPrimary,
      selectedIconTheme: IconThemeData(color: Colors.white, size: 36),
      unselectedIconTheme: IconThemeData(color: Colors.black, size: 24),
      selectedLabelStyle: TextStyle(color: Colors.white),
      unselectedLabelStyle: TextStyle(color: Colors.black),
    ),

    bottomAppBarTheme: BottomAppBarThemeData(color: AppColors.lightPrimary),
    scaffoldBackgroundColor: AppColors.backgroundColor,

    inputDecorationTheme: InputDecorationTheme(
      floatingLabelBehavior: FloatingLabelBehavior.auto,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: AppColors.lightPrimary, width: 1),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: AppColors.gray, width: 1),
      ),
      labelStyle: GoogleFonts.inter(
        color: AppColors.gray,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      focusColor: AppColors.lightPrimary,
      hintStyle: GoogleFonts.inter(
        color: AppColors.gray,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      contentPadding: EdgeInsets.all(16.0),
    ),
  );

  static var darkTheme = ThemeData(
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.darkBackgroundColor,
      surfaceTintColor: Colors.transparent,
      titleTextStyle: TextStyle(
        color: AppColors.lightPrimary,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      centerTitle: true,
      iconTheme: IconThemeData(color: AppColors.lightPrimary),
    ),

    colorScheme: ColorScheme.light(primary: AppColors.lightPrimary),

    textTheme: TextTheme(
      titleLarge: GoogleFonts.inter(
        color: Colors.white,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),

      titleMedium: GoogleFonts.jockeyOne(
        color: AppColors.lightPrimary,
        fontSize: 20,
        fontWeight: FontWeight.w700,
      ),

      titleSmall: GoogleFonts.jockeyOne(
        color: Colors.white,
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),

      bodyLarge: GoogleFonts.jockeyOne(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),

      bodyMedium: GoogleFonts.inter(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),

      bodySmall: GoogleFonts.inter(
        color: Colors.white,
        fontSize: 12,
        fontWeight: FontWeight.bold,
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 12),
        backgroundColor: AppColors.lightPrimary,
        textStyle: GoogleFonts.jockeyOne(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.lightPrimary,
      selectedIconTheme: IconThemeData(color: Colors.white, size: 36),
      unselectedIconTheme: IconThemeData(color: Colors.black, size: 24),
      selectedLabelStyle: TextStyle(color: Colors.white),
      unselectedLabelStyle: TextStyle(color: Colors.black),
    ),

    bottomAppBarTheme: BottomAppBarThemeData(color: AppColors.lightPrimary),
    scaffoldBackgroundColor: AppColors.darkBackgroundColor,
  );
}
