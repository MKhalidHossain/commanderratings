import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../core/utils/constants/app_colors.dart';

class DAppBarTheme {
  DAppBarTheme._(); // Private constructor

  // Light AppBarTheme
  static AppBarTheme lightAppBarTheme = AppBarTheme(
    backgroundColor: AppColors.light().backgroundColor,
    //foregroundColor: AppColors.light().contentBoxColor,
    surfaceTintColor: AppColors.light().backgroundColor,//AppColors.light().backgroundColor,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light,
      statusBarColor: AppColors.light().backgroundColor,
      statusBarIconBrightness: Brightness.dark
    ),
    elevation: 0,
    iconTheme: IconThemeData(color: AppColors.light().iconColor),
    actionsIconTheme: IconThemeData(color: AppColors.light().iconColor),
    toolbarTextStyle: TextStyle(color: AppColors.light().textColor),
    titleTextStyle: TextStyle(
      color: AppColors.light().textColor,
      fontWeight: FontWeight.bold,
    ),
    centerTitle: false,
  );

  // Dark AppBarTheme
  static AppBarTheme darkAppBarTheme = AppBarTheme(
    backgroundColor: AppColors.dark().contentBoxColor,
    surfaceTintColor: AppColors.dark().dividerColor,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarBrightness: Brightness.dark,
      statusBarColor: AppColors.dark().contentBoxColor,
      statusBarIconBrightness: Brightness.light
    ),
    elevation: 0,
    iconTheme: IconThemeData(color: AppColors.dark().iconColor),
    actionsIconTheme: IconThemeData(color: AppColors.dark().iconColor),
    toolbarTextStyle: TextStyle(color: AppColors.dark().textColor),
    titleTextStyle: TextStyle(
      color: AppColors.dark().textColor,
      fontWeight: FontWeight.bold,
    ),
    centerTitle: false,
    // bottom: PreferredSize(
    //   preferredSize: Size.fromHeight(kToolbarHeight),
    //   child: Container(),
    // ),
  );

  static AppBarTheme getAppBarTheme(Brightness brightness) {
    return brightness == Brightness.light ? lightAppBarTheme : darkAppBarTheme;
  }
}