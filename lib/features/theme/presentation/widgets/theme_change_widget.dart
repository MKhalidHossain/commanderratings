import 'package:commanderratings/core/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app_themes/themes.dart';

class ThemeChangeWidget extends StatefulWidget {
  ThemeChangeWidget({super.key});

  @override
  State<ThemeChangeWidget> createState() => _ThemeChangeWidgetState();
}

class _ThemeChangeWidgetState extends State<ThemeChangeWidget> {
  final themecontroller = Get.find<AppTheme>();

  bool isActive = true;
  String selectedTheme = "Light"; // or "Dark"

  @override
  void initState() {
    super.initState();
    final isDark = themecontroller.themeMode == ThemeMode.dark;
    selectedTheme = isDark ? "Dark" : "Light";
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 32),
        Card(
          color:
              selectedTheme == "Light" ? Color(0xFFFFFFFF) : Colors.transparent,
          elevation: selectedTheme == "Light" ? 6 : 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: () {
              setState(() {
                selectedTheme = "Light";
              });
              themecontroller.changeThemeToLight(); // Set actual theme here
            },
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'LIGHT',
                    style: TextStyle(
                      color: AppColors.context(context).textColor,
                      fontSize: 18,
                      fontWeight:
                          selectedTheme == "Light"
                              ? FontWeight.bold
                              : FontWeight.normal,
                    ),
                  ),
                  Image.asset(
                    'assets/icons/flashbangLight.png',
                    fit: BoxFit.cover,
                    height: 30,
                  ),
                  // const SizedBox(width: 10),
                ],
              ),
            ),
          ),
        ),

        const SizedBox(height: 24),

        // Dark Theme Card
        Card(
          color:
              selectedTheme == "Dark" ? Color(0xFFFFFFFF) : Colors.transparent,
          elevation: selectedTheme == "Dark" ? 6 : 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: () {
              setState(() {
                selectedTheme = "Dark";
              });
              themecontroller.changeThemeToDark(); // Set actual theme here
            },
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'DARK',
                    style: TextStyle(
                      color:
                          selectedTheme == "Dark" ? Colors.black : Colors.white,
                      fontSize: 18,
                      fontWeight:
                          selectedTheme == "Dark"
                              ? FontWeight.bold
                              : FontWeight.normal,
                    ),
                  ),
                  Image.asset(
                    'assets/icons/flashbangDark.png',
                    fit: BoxFit.cover,
                    height: 30,
                  ),
                  // const SizedBox(width: 10),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
