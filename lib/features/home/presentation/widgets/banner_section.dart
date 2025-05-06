import 'package:commanderratings/core/widgets/normal_custom_button.dart';
import 'package:flutter/material.dart';



class BannerSection extends StatelessWidget {
  const BannerSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/images/banner/banner_home.png', // replace with your image
          width: double.infinity,
          height: 400,
          fit: BoxFit.cover,
        ),
        Positioned(
          top: 220,
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
                NormalCustomButton(text: "START REVIEWING", onPressed: () {}),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
