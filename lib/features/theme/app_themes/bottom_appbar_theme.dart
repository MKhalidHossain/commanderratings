import 'package:flutter/material.dart';
import '../../../core/utils/constants/app_colors.dart';

class DBottomAppBarTheme {
  DBottomAppBarTheme._(); // Private constructor

  // Light BottomAppBarThemeData
  
  static BottomAppBarTheme lightBottomAppBarTheme = BottomAppBarTheme(
    color: AppColors.light().backgroundColor,
    elevation: 8,
    shadowColor: AppColors.light().backgroundColor,
    shape: const CircularNotchedRectangle(),
  );

  // Dark BottomAppBarThemeData
  static BottomAppBarTheme darkBottomAppBarTheme = BottomAppBarTheme(
    color: AppColors.dark().dividerColor,
    elevation: 8,
    shadowColor: AppColors.dark().dividerColor,
    surfaceTintColor: AppColors.dark().dividerColor,
    shape: const CircularNotchedRectangle(),
  );
}