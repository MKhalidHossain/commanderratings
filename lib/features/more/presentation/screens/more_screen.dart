import 'package:commanderratings/core/widgets/wide_custom_button_more.dart';
import 'package:commanderratings/features/auth/presentation/screens/log_in.dart';
import 'package:commanderratings/features/more/presentation/screens/others/about_screen.dart';
import 'package:commanderratings/features/more/presentation/screens/others/contact_us.dart';
import 'package:commanderratings/features/more/presentation/screens/others/law_enforcement.dart';
import 'package:commanderratings/features/post_or_blog_or_commanders_call/presentation/screens/all_post_blog/all_blog_post.dart';
import 'package:commanderratings/features/post_or_blog_or_commanders_call/presentation/screens/read_blog_post_details/read_blog_or_is_the_meo_office_effective.dart';
import 'package:commanderratings/features/theme/presentation/screens/theme_ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:get/get.dart';
import 'others/faq_screen.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset('assets/images/headers/star_logo.png', height: 50),
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
                        MaterialPageRoute(builder: (context) => FaqScreen()),
                      );
                      // Get.to(FaqScreen());
                    },
                  ),
                  WideCustomButtonMore(
                    text: 'ABOUT',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AboutScreen()),
                      );
                    },
                  ),
                  WideCustomButtonMore(
                    text: 'COMMANDER\'S CALL',
                    onPressed: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => AboutScreen()),
                      // );
                    },
                  ),
                  WideCustomButtonMore(
                    text: 'LAW ENFORCEMENT',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LawEnforcement(),
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
                        MaterialPageRoute(builder: (context) => ContactUs()),
                      );
                    },
                  ),
                  WideCustomButtonMore(
                    text: 'All BLOG',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AllBlogPost()),
                      );
                    },
                  ),
                  WideCustomButtonMore(
                    text: 'READ BLOG',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) => ReadBlogOrIsTheMeoOfficeEffective(),
                        ),
                      );
                    },
                  ),
                ],
              ),
              WideCustomButtonMore(
                text: 'LOGIN',
                onPressed: () {
                  Get.to(LogIn());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
