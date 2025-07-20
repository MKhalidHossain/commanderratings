import 'package:commanderratings/core/widgets/wide_custom_button_more.dart';
import 'package:commanderratings/features/auth/controllers/auth_controller.dart';
import 'package:commanderratings/features/auth/presentation/screens/log_in.dart';
import 'package:commanderratings/features/more/presentation/screens/others/about_screen.dart';
import 'package:commanderratings/features/more/presentation/screens/others/contact_us.dart';
import 'package:commanderratings/features/commanders_call/presentations/screens/commanders_call_screen.dart';
import 'package:commanderratings/features/theme/presentation/screens/theme_ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'others/faq_screen.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      builder: (authController) {
        return Scaffold(
          body: Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      'assets/images/headers/star_logo.png',
                      height: 50,
                    ),
                    Image.asset(
                      'assets/images/headers/search_icon.png',
                      height: 30,
                    ),
                  ],
                ),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.only(
                top: 24.0,
                left: 24.0,
                right: 24.0,
                bottom: 56.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      WideCustomButtonMore(
                        text: 'FAQ',
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FaqScreen(),
                            ),
                          );
                          // Get.to(FaqScreen());
                        },
                      ),
                      WideCustomButtonMore(
                        text: 'ABOUT',
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AboutScreen(),
                            ),
                          );
                        },
                      ),
                      WideCustomButtonMore(
                        text: 'COMMANDERS CALL',
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CommandersCallScreen(),
                            ),
                          );
                        },
                      ),

                      WideCustomButtonMore(
                        text: 'THEME',
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ThemeUi()),
                          );
                        },
                      ),
                      WideCustomButtonMore(
                        text: 'CONTACT US',
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ContactUs(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 60.0),
                    child: WideCustomButtonMore(
                      text: 'LOGOUT',
                      onPressed: () {
                        authController.logOut();

                        Get.offAll(LogIn());
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
