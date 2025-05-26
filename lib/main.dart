import 'package:commanderratings/features/auth/presentation/screens/log_in.dart';
import 'package:commanderratings/features/theme/app_themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'features/auth/controllers/auth_controller.dart';
import 'helpers/dependency_injection.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
  await initDI();
  if(!Get.find<AuthController>().isFirstTimeInstall()){
    print("object ---------------000000000000-----------------");
    Get.find<AuthController>().setFirstTimeInstall();
  }else{
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
        debugShowCheckedModeBanner: false,
        title: 'Military Leadership',
        themeMode: controller.themeMode.value,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        home:  const LogIn(),
        
        //authController.isFirstTimeInstall() ? OnboardingScreen() : const LogIn(),


        //const ResetPassword(),




        //HomeScreen(),
      );
    });
  }
}
