import 'package:commanderratings/app.dart';
import 'package:commanderratings/features/theme/app_themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'core/onboarding/presentation/screens/onboarding1.dart';
import 'core/onboarding/presentation/screens/spashScreen.dart';
import 'features/auth/controllers/auth_controller.dart';
import 'features/auth/presentation/screens/log_in.dart';
import 'helpers/dependency_injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
  await initDI();
  if (!Get.find<AuthController>().isFirstTimeInstall()) {
    print("object ---------------000000000000-----------------");

    Get.find<AuthController>().setFirstTimeInstall();
  } else {
    print("object ---------------11111111111-----------------");
  }
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
        //debugShowCheckedModeBanner: false,
        title: 'Military Leadership',
        themeMode: controller.themeMode.value,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        home: VideoSplashScreen(nextScreen: const Home()),
      );
    });
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      builder: (authController) {
        // return OnBoard();

        if (authController.isLoggedIn()) {
          return MainScreen();
        } else if (authController.isFirstTimeInstall()) {
          return LogIn();
        } else {
          return Onboarding1();
        }
      },
    );
  }
}
