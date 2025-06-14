import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.whiteLight,
      primaryColor: AppColors.greenDark,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.white,
        foregroundColor: AppColors.greenText,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppColors.greenText),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.greenDark,
        foregroundColor: AppColors.white,
      ),
      textTheme: const TextTheme(
        headlineLarge: TextStyle(color: AppColors.greenText),
        bodyLarge: TextStyle(color: AppColors.black),
        bodyMedium: TextStyle(color: AppColors.gray),
      ),
      iconTheme: const IconThemeData(color: AppColors.greenDark),
      dividerColor: AppColors.grayLight,
      cardColor: AppColors.white,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.greenDark,
          foregroundColor: AppColors.white,
          textStyle: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      colorScheme: const ColorScheme.light(
        primary: AppColors.greenDark,
        onPrimary: AppColors.white,
        secondary: AppColors.yellow,
        error: AppColors.red,
        surface: AppColors.white,
        onSurface: AppColors.black,
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.black,
      primaryColor: AppColors.greenDark,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.greenDark,
        foregroundColor: AppColors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: AppColors.white),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.greenDark,
        foregroundColor: AppColors.white,
      ),
      textTheme: const TextTheme(
        headlineLarge: TextStyle(color: AppColors.white),
        bodyLarge: TextStyle(color: AppColors.whiteLight),
        bodyMedium: TextStyle(color: AppColors.grayLight),
      ),
      iconTheme: const IconThemeData(color: AppColors.white),
      dividerColor: AppColors.black20,
      cardColor: AppColors.greenDeep,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.greenDark,
          foregroundColor: AppColors.white,
          textStyle: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      colorScheme: const ColorScheme.dark(
        primary: AppColors.greenDark,
        onPrimary: AppColors.white,
        secondary: AppColors.orange,
        error: AppColors.red,
        surface: AppColors.greenDeep,
        onSurface: AppColors.white,
      ),
    );
  }
}
