import 'package:flutter/material.dart';

class ThemeController {
  final ValueNotifier<ThemeMode> themeMode = ValueNotifier(ThemeMode.system);

  void changeThemeToLight() {
    themeMode.value = ThemeMode.light;
  }

  void changeThemeToDark() {
    themeMode.value = ThemeMode.dark;
  }
}
