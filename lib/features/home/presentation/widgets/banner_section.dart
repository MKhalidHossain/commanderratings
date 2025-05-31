import 'package:commanderratings/core/widgets/normal_custom_button.dart';
import 'package:commanderratings/features/commanders/presentations/screens/all_commanders_screen.dart';
import 'package:flutter/material.dart';

class BannerSection extends StatelessWidget {
  const BannerSection({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Image.asset(
          'assets/images/banner/banner_home.png', // replace with your image
          width: double.infinity,
          height: size.height * 0.5,
          fit: BoxFit.cover,
        ),
        Positioned(
          top: size.height * 0.26,
          left: 20,
          right: 20,
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "LEADERSHIP PUBLIC RATING",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "RATE & REVIEW ",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "ILITARY LEADERS",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                NormalCustomButton(text: "START REVIEWING", onPressed: () {
                  AllCommandersScreen();
                }),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
