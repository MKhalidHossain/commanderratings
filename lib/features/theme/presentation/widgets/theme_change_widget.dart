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
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Light',
          style: TextStyle(
            color: AppColors.context(context).textColor,
            fontWeight:
                selectedTheme == "Light" ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        const SizedBox(height: 40),
        // Light Theme Card
        Card(
          color:
              selectedTheme == "Light"
                  ? Colors.blue.shade100
                  : Colors.transparent,
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
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Light',
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
                    height: 40,
                  ),
                  const SizedBox(width: 10),
                ],
              ),
            ),
          ),
        ),

        const SizedBox(height: 40),

        // Dark Theme Card
        Card(
          color:
              selectedTheme == "Dark"
                  ? Colors.blue.shade100
                  : Colors.transparent,
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
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Dark',
                    style: TextStyle(
                      color: AppColors.context(context).textColor,
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
                    height: 40,
                  ),
                  const SizedBox(width: 10),
                ],
              ),
            ),
          ),
        ),
      ],
    );

    // Column(
    //   crossAxisAlignment: CrossAxisAlignment.center,
    //   mainAxisAlignment: MainAxisAlignment.center,
    //   children: [

    //     InkWell(
    //       child: Row(
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         children: [
    //           Image.asset(
    //             'assets/icons/flashbangLight.png',
    //             fit: BoxFit.cover,
    //             height: 100,
    //           ),
    //           const SizedBox(width: 10),
    //           Text(
    //             'Light',
    //             style: TextStyle(color: AppColors.context(context).textColor),
    //           ),
    //         ],
    //       ),
    //       onTap: () {
    //         themecontroller.changeThemeToDark();
    //       },
    //     ),
    //     const SizedBox(height: 40),
    //     InkWell(
    //       child: Row(
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         children: [
    //           Image.asset(
    //             'assets/icons/flashbangDark.png',
    //             fit: BoxFit.cover,
    //             height: 100,
    //           ),
    //           const SizedBox(width: 10),
    //           Text(
    //             'Dark',
    //             style: TextStyle(color: AppColors.context(context).textColor),
    //           ),
    //         ],
    //       ),
    //       onTap: () {
    //         themecontroller.changeThemeToLight();
    //       },
    //     ),
    //   ],
    // );
  }
}
