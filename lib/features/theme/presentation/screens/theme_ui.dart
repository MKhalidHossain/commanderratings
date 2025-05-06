
import 'package:flutter/material.dart';

import '../../../../core/widgets/three_icon_image_for_header.dart';

class ThemeUi extends StatefulWidget {
  ThemeUi({super.key});

  @override
  State<ThemeUi> createState() => _ThemeUiState();
}

class _ThemeUiState extends State<ThemeUi> {
  // final controller = Get.find<AppTheme>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 80),
            const ThreeIconImageForHeader(),
            const SizedBox(height: 20),
            // ThemeSelectionWidget(),
          ],
        ),
      ),
    );
  }
}
