// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../../app_themes/themes.dart';


// class ThemeSelectionWidget extends StatefulWidget {
//   const ThemeSelectionWidget({super.key});

//   @override
//   State<ThemeSelectionWidget> createState() => _ThemeSelectionWidgetState();
// }

// class _ThemeSelectionWidgetState extends State<ThemeSelectionWidget> {
//   final controller = Get.find<AppTheme>();

//   late ThemeMode selectedTheme;

//   @override
//   void initState() {
//     super.initState();
//     selectedTheme = controller.currentTheme;
//   }

//   void _onThemeChanged(ThemeMode mode) {
//     setState(() {
//       selectedTheme = mode;
//       if (mode == ThemeMode.dark) {
//         controller.changeThemeToDark();
//       } else {
//         controller.changeThemeToLight();
//       }
//     });
//   }

//   Widget _buildThemeOption(String label, ThemeMode mode) {
//     final isSelected = selectedTheme == mode;

//     return InkWell(
//       onTap: () => _onThemeChanged(mode),
//       child: Container(
//         margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
//         padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
//         decoration: BoxDecoration(
//           border: Border.all(color: Colors.white),
//           borderRadius: BorderRadius.circular(8),
//           color: Colors.transparent,
//         ),
//         child: Row(
//           children: [
//             Icon(
//               isSelected
//                   ? Icons.radio_button_checked
//                   : Icons.radio_button_off,
//               color: Colors.white,
//             ),
//             const SizedBox(width: 12),
//             Text(
//               label.toUpperCase(),
//               style: const TextStyle(
//                 color: Colors.white,
//                 fontWeight: FontWeight.bold,
//                 letterSpacing: 1.0,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         _buildThemeOption('Dark', ThemeMode.dark),
//         _buildThemeOption('Light', ThemeMode.light),
//       ],
//     );
//   }
// }
