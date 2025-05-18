import 'package:flutter/material.dart';

import '../../controller/theme_change_controller.dart';

class ThemeChangeWidget extends StatelessWidget {
  final ThemeController controller;

  const ThemeChangeWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final isLight = Theme.of(context).brightness == Brightness.light;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                controller.changeThemeToLight();
              },
              child: const Text('Light'),
            ),
            const SizedBox(width: 10),
            TextButton(
              onPressed: () {
                controller.changeThemeToDark();
              },
              child: const Text('Dark'),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Center(
          child: Image.asset(
            isLight
                ? 'assets/images/blog/image_button/for_dark/tuter_dark.png'
                : 'assets/images/blog/image_button/for_light/tuter_light.png',
            height: 60,
          ),
        ),
      ],
    );
  }
}
