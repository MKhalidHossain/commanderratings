import 'package:commanderratings/features/theme/app_themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app.dart';

void main() {
  Get.put(AppTheme());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final controller = Get.find<AppTheme>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      //print(controller.themeMode.value.toString());
      return GetMaterialApp(
        
        debugShowCheckedModeBanner: false,
        title: 'Military Leadership',
        themeMode: controller.themeMode.value,
        theme: AppTheme.darkTheme,
        darkTheme: AppTheme.lightTheme,
        home: const MainScreen(),

        //HomeScreen(),
      );
    });
  }
}
