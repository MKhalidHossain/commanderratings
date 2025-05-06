import 'package:flutter/material.dart';

class AppColors {
  static final Color _primaryColor = Color.fromARGB(
    255,
    238,
    88,
    68,
  ); //Color.fromARGB(255, 58, 64, 234);

  static const Color _secondaryActionColor = Color.fromARGB(255, 94, 68, 238);
  //Color.fromARGB(255, 58, 64, 234);
  //static const Color _actionColor =  Colors.orange;

  static final AppColors _lightInstance = AppColors._internalLight();
  static final AppColors _darkInstance = AppColors._internalDark();

  final Color textColor;
  final Color textGreyColor;
  final Color backgroundColor;
  final Color contentBoxColor;
  final Color contentBoxGreyColor;
  final Color iconColor;

  // final Color primaryColor;

  Color get primaryColor => _primaryColor;
  final Color secondaryAccentColor;
  final Color buttonContentColor;

  Color activeButtonColor = _primaryColor;
  final Color activeButtonContentColor;
  final Color inActiveButtonColor;
  final Color inActiveButtonContentColor;
  final Color buttonColor;
  final Color drawerColor;
  final Color fillColor;
  final Color hintColor;
  final Color labelColor;
  final Color focusedBorderColor;
  final Color enabledBorderColor;
  final Color borderColor;
  final Color popupBackgroundColor;
  final Color popupContentColor;
  final Color dividerColor;
  final Color tabBarColor;
  final Color shadowColor;
  final Color errorColor;

  AppColors._internalLight()
    : textColor = Colors.black,
      textGreyColor = Colors.grey.shade700,
      contentBoxColor = Colors.grey.shade100,
      contentBoxGreyColor = Colors.grey.shade300,
      backgroundColor = Colors.white,
      iconColor = Colors.black,
      secondaryAccentColor = _secondaryActionColor,
      buttonColor = Colors.black,
      buttonContentColor = Colors.white,
      activeButtonContentColor = Colors.white,
      inActiveButtonContentColor = Colors.grey.shade200,
      inActiveButtonColor = Colors.grey.shade700,
      drawerColor = Colors.white,
      fillColor = Colors.transparent,
      hintColor = Colors.grey.shade700,
      labelColor = Colors.grey.shade800,
      focusedBorderColor = Colors.black, // same as text color
      enabledBorderColor = Colors.grey.shade700,
      borderColor = Colors.grey.shade700,
      dividerColor = Colors.grey.shade200,
      popupBackgroundColor = Colors.grey.shade200,
      popupContentColor = Colors.black,
      shadowColor = const Color(0x1F000000),
      errorColor = Colors.red,
      tabBarColor = Colors.white;

  AppColors._internalDark()
    : textColor = Colors.white,
      textGreyColor = Colors.grey,
      backgroundColor = Color.fromARGB(255, 17, 22, 31), //Colors.black,
      contentBoxColor = Colors.grey.shade900,
      contentBoxGreyColor = Colors.grey.shade800,
      iconColor = Colors.white,
      secondaryAccentColor = _secondaryActionColor,
      buttonColor = Colors.white,
      buttonContentColor = Colors.black,
      activeButtonContentColor = Colors.white,
      inActiveButtonContentColor = Colors.grey.shade500,
      inActiveButtonColor = Colors.grey.shade900,
      drawerColor = Colors.black,
      fillColor = Colors.transparent,
      hintColor = Colors.grey.shade400,
      labelColor = Colors.grey.shade200,
      focusedBorderColor = Colors.white, // same as text color
      enabledBorderColor = Colors.grey.shade400,
      borderColor = Colors.grey.shade400,
      dividerColor = Colors.grey.shade900,
      errorColor = Colors.red,
      popupBackgroundColor = Colors.black,
      popupContentColor = Colors.white,
      shadowColor = const Color.fromARGB(146, 124, 123, 123),
      tabBarColor = Colors.black;

  factory AppColors.light() {
    return _lightInstance;
  }

  factory AppColors.dark() {
    return _darkInstance;
  }

  factory AppColors.context(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? _darkInstance
        : _lightInstance;
  }
}
