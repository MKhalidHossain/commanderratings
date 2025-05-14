import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../app.dart';
import '../../../../core/widgets/wide_custom_button.dart';
class Onboarding3 extends StatelessWidget {
  const Onboarding3({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: size.height * 0.1),
                Image.asset('assets/images/headers/star_logo.png', height: 60),
                SizedBox(height: size.height * 0.04),
                Text(
                  'ANONYMOUS & \n TRUSTED',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 42,
                    fontFamily: 'aero_matics',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: size.height * 0.03),
                Text(
                  'Fair, Moderated Reviews',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 15,
                    fontFamily: 'aero_matics',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Stack(
            children: [
              Image.asset(
                'assets/images/onboarding/onboarding3bg.jpg',
                fit: BoxFit.cover,
                opacity: const AlwaysStoppedAnimation(0.4),
                height: size.height * 0.61,
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                top: size.height * 0.48,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: Column(
                    children: [
                      WideCustomButton(
                        height: 45,
                        text: 'Explore Now',
                        onPressed: () {
                          Get.to(MainScreen());
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
