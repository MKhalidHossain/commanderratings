import 'package:flutter/material.dart';

import '../../../core/utils/constants/app_colors.dart';

class DTextTheme {
  DTextTheme._();

  // Light Theme Text Styles
  static TextTheme lightTextTheme = TextTheme(
    displayLarge: const TextStyle().copyWith(
      fontSize: 57,
      fontWeight: FontWeight.bold,
      color: AppColors.light().textColor,
      overflow: TextOverflow.ellipsis,
    ),
    displayMedium: const TextStyle().copyWith(
      fontSize: 45,
      fontWeight: FontWeight.w600,
      color: AppColors.light().textColor,
      overflow: TextOverflow.ellipsis,
    ),
    displaySmall: const TextStyle().copyWith(
      fontSize: 36,
      fontWeight: FontWeight.normal,
      color: AppColors.light().textColor,
      overflow: TextOverflow.ellipsis,
    ),
    headlineLarge: const TextStyle().copyWith(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: AppColors.light().textColor,
      overflow: TextOverflow.ellipsis,
    ),
    headlineMedium: const TextStyle().copyWith(
      fontSize: 28,
      fontWeight: FontWeight.w600,
      color: AppColors.light().textColor,
      overflow: TextOverflow.ellipsis,
    ),
    headlineSmall: const TextStyle().copyWith(
      fontSize: 24,
      fontWeight: FontWeight.normal,
      color: AppColors.light().textColor,
      overflow: TextOverflow.ellipsis,
    ),
    titleLarge: const TextStyle().copyWith(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: AppColors.light().textColor,
      overflow: TextOverflow.ellipsis,
    ),
    titleMedium: const TextStyle().copyWith(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: AppColors.light().textColor,
      overflow: TextOverflow.ellipsis,
    ),
    titleSmall: const TextStyle().copyWith(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: AppColors.light().textColor,
      overflow: TextOverflow.ellipsis,
    ),
    bodyLarge: const TextStyle().copyWith(
      fontSize: 16,
      fontWeight: FontWeight.normal,
      color: AppColors.light().textColor,
      overflow: TextOverflow.ellipsis,
    ),
    bodyMedium: const TextStyle().copyWith(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: AppColors.light().textColor,
      overflow: TextOverflow.ellipsis,
    ),
    bodySmall: const TextStyle().copyWith(
      fontSize: 12,
      fontWeight: FontWeight.normal,
      color: AppColors.light().textColor,
      overflow: TextOverflow.ellipsis,
    ),
    labelLarge: const TextStyle().copyWith(
      fontSize: 14,
      fontWeight: FontWeight.bold,
      color: AppColors.light().textColor,
      overflow: TextOverflow.ellipsis,
    ),
    labelMedium: const TextStyle().copyWith(
      fontSize: 12,
      fontWeight: FontWeight.normal,
      color: AppColors.light().textColor,
      overflow: TextOverflow.ellipsis,
    ),
    labelSmall: const TextStyle().copyWith(
      fontSize: 11,
      fontWeight: FontWeight.normal,
      color: AppColors.light().textColor,
      overflow: TextOverflow.ellipsis,
    ),
  );

  // Dark Theme Text Styles
  static TextTheme darkTextTheme = TextTheme(
    displayLarge: const TextStyle().copyWith(
      fontSize: 57,
      fontWeight: FontWeight.bold,
      color: AppColors.dark().textColor,
      overflow: TextOverflow.ellipsis,
    ),
    displayMedium: const TextStyle().copyWith(
      fontSize: 45,
      fontWeight: FontWeight.w600,
      color: AppColors.dark().textColor,
      overflow: TextOverflow.ellipsis,
    ),
    displaySmall: const TextStyle().copyWith(
      fontSize: 36,
      fontWeight: FontWeight.normal,
      color: AppColors.dark().textColor,
      overflow: TextOverflow.ellipsis,
    ),
    headlineLarge: const TextStyle().copyWith(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: AppColors.dark().textColor,
      overflow: TextOverflow.ellipsis,
    ),
    headlineMedium: const TextStyle().copyWith(
      fontSize: 28,
      fontWeight: FontWeight.w600,
      color: AppColors.dark().textColor,
      overflow: TextOverflow.ellipsis,
    ),
    headlineSmall: const TextStyle().copyWith(
      fontSize: 24,
      fontWeight: FontWeight.normal,
      color: AppColors.dark().textColor,
      overflow: TextOverflow.ellipsis,
    ),
    titleLarge: const TextStyle().copyWith(
      fontSize: 20,
      fontWeight: FontWeight.w800,
      color: AppColors.dark().textColor,
      overflow: TextOverflow.ellipsis,
    ),
    titleMedium: const TextStyle().copyWith(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: AppColors.dark().textColor,
      overflow: TextOverflow.ellipsis,
    ),
    titleSmall: const TextStyle().copyWith(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: AppColors.dark().textColor,
      overflow: TextOverflow.ellipsis,
    ),
    bodyLarge: const TextStyle().copyWith(
      fontSize: 16,
      fontWeight: FontWeight.normal,
      color: AppColors.dark().textColor,
      overflow: TextOverflow.ellipsis,
    ),
    bodyMedium: const TextStyle().copyWith(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: AppColors.dark().textColor,
      overflow: TextOverflow.ellipsis,
    ),
    bodySmall: const TextStyle().copyWith(
      fontSize: 12,
      fontWeight: FontWeight.normal,
      color: AppColors.dark().textColor,
      overflow: TextOverflow.ellipsis,
    ),
    labelLarge: const TextStyle().copyWith(
      fontSize: 14,
      fontWeight: FontWeight.bold,
      color: AppColors.dark().textColor,
      overflow: TextOverflow.ellipsis,
    ),
    labelMedium: const TextStyle().copyWith(
      fontSize: 12,
      fontWeight: FontWeight.normal,
      color: AppColors.dark().textColor,
      overflow: TextOverflow.ellipsis,
    ),
    labelSmall: const TextStyle().copyWith(
      fontSize: 11,
      fontWeight: FontWeight.normal,
      color: AppColors.dark().textColor,
      overflow: TextOverflow.ellipsis,
    ),
  );
}
