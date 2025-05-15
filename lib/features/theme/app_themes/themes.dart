import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/services_or_dataclients/dekhao.dart';
import '../../../core/utils/constants/app_colors.dart';
import 'switch_theme.dart';
import 'text_theme.dart';

class AppTheme extends GetxController {
  AppTheme();

  // Reactive themeMode variable
  Rx<ThemeMode> themeMode = ThemeMode.system.obs;

  // Corrected dark theme change method
  // void changeThemeToDart(ThemeMode mode) {
  //   themeMode.value = ThemeMode.dark;

  //   print('Dark');

  //   update();
  // }

  // void changeThemeToLight(ThemeMode mode) {
  //   themeMode.value = ThemeMode.light;
  //   update();
  // }
  void changeThemeToDark() {
    themeMode.value = ThemeMode.dark;
    Get.changeThemeMode(ThemeMode.dark);
  }

  void changeThemeToLight() {
    themeMode.value = ThemeMode.light;
    Get.changeThemeMode(ThemeMode.light);
  }

  static ThemeData get lightTheme {
    dekhao("light theme called");
    return ThemeData(
      checkboxTheme: CheckboxThemeData(
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      primaryTextTheme: DTextTheme.lightTextTheme,
      primaryColorLight: AppColors.light().primaryColor,
      primaryColorDark: AppColors.light().primaryColor,
      useMaterial3: true,
      fontFamily: 'AeroMatics',
      brightness: Brightness.light,
      colorScheme: ColorScheme.fromSwatch(
        accentColor: AppColors.light().primaryColor,
        backgroundColor: AppColors.light().backgroundColor,
        cardColor: AppColors.light().backgroundColor,
        brightness: Brightness.light,
      ),
      scaffoldBackgroundColor: AppColors.light().backgroundColor,
      primaryColor: AppColors.light().primaryColor,
      textTheme: DTextTheme.lightTextTheme,
      switchTheme: SwitchThemes.lightSwitchTheme,
      //appBarTheme: DAppBarTheme.lightAppBarTheme,
      //bottomAppBarTheme: DBottomAppBarTheme.lightBottomAppBarTheme,
      //inputDecorationTheme: DInputDecorationTheme.lightTheme,
      // iconTheme: DIconTheme.lightIconTheme,

      // buttonTheme: DButtonTheme.lightButtonTheme,
      // bottomSheetTheme: DBottomSheetTheme.lightBottomSheetTheme,
      // checkboxTheme: DCheckboxTheme.lightCheckboxTheme,

      // cardTheme: DCardTheme.lightCardTheme,
      //bottomNavigationBarTheme: DBottomNavigationBarThemes.lightBottomNavTheme,
      // tabBarTheme: DTabBarTheme.lightTabBarTheme,
      // indicatorColor: AppColors.light().backgroundColor,
      // dividerTheme: DDividerTheme.lightDividerTheme,
    );
  }

  static ThemeData get darkTheme {
    dekhao("dark theme called");
    return ThemeData(
      checkboxTheme: CheckboxThemeData(
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        visualDensity: VisualDensity(horizontal: 0, vertical: 0),
      ),
      primaryTextTheme: DTextTheme.darkTextTheme,
      primaryColorLight: AppColors.dark().textColor,
      primaryColorDark: AppColors.dark().backgroundColor,
      useMaterial3: true,
      fontFamily: 'AeroMatics',
      brightness: Brightness.dark,
      colorScheme: ColorScheme.fromSwatch(
        accentColor: AppColors.dark().primaryColor,
        backgroundColor: AppColors.dark().backgroundColor,
        cardColor: AppColors.dark().backgroundColor,
        brightness: Brightness.dark,
      ),
      scaffoldBackgroundColor: AppColors.dark().backgroundColor,
      primaryColor: AppColors.dark().primaryColor,
      textTheme: DTextTheme.darkTextTheme,
      switchTheme: SwitchThemes.darkSwitchTheme,
      //appBarTheme: DAppBarTheme.darkAppBarTheme,
      //bottomAppBarTheme: DBottomAppBarTheme.darkBottomAppBarTheme,
      // inputDecorationTheme: DInputDecorationTheme.darkTheme,
      // iconTheme: DIconTheme.darkIconTheme,

      // buttonTheme: DButtonTheme.darkButtonTheme,
      // bottomSheetTheme: DBottomSheetTheme.darkBottomSheetTheme,
      // checkboxTheme: DCheckboxTheme.darkCheckboxTheme,

      // cardTheme: DCardTheme.darkCardTheme,
      // tabBarTheme: DTabBarTheme.darkTabBarTheme,
      //bottomNavigationBarTheme: DBottomNavigationBarThemes.darkBottomNavTheme,
      //dividerTheme: DDividerTheme.darkDividerTheme,
      //tabBarTheme: ,
      indicatorColor: AppColors.dark().textColor,
    );
  }

  get currentTheme => null;
}
