import 'package:flutter/material.dart';
import 'package:pro_multimedia_app/src/config/styles/app_colors.dart';

final class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: Colors.blue,
      scaffoldBackgroundColor: AppColors.background,
      appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white, centerTitle: true),
      fontFamily: 'Roboto',
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor:  Colors.white,
          foregroundColor: Colors.black,
          textStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      iconTheme: const IconThemeData(
        color: Colors.black87,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.background,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black87,
        selectedLabelStyle:
            TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
        unselectedLabelStyle:
            TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
      ),
    );
  }
}
