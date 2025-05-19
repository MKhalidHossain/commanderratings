import 'package:commanderratings/core/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app_themes/themes.dart';

class ThemeChangeWidget extends StatelessWidget {
  ThemeChangeWidget({super.key});
  final themecontroller = Get.find<AppTheme>();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/icons/flashbangLight.png',
                fit: BoxFit.cover,
                height: 100,
              ),
              const SizedBox(width: 10),
              Text(
                'Light',
                style: TextStyle(color: AppColors.context(context).textColor),
              ),
            ],
          ),
          onTap: () {
            themecontroller.changeThemeToDark();
          },
        ),
        const SizedBox(height: 40),
        InkWell(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/icons/flashbangDark.png',
                fit: BoxFit.cover,
                height: 100,
              ),
              const SizedBox(width: 10),
              Text(
                'Dark',
                style: TextStyle(color: AppColors.context(context).textColor),
              ),
            ],
          ),
          onTap: () {
            themecontroller.changeThemeToLight();
          },
        ),
      ],
    );
  }
}
