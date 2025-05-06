import 'package:commanderratings/core/widgets/three_icon_image_for_header.dart';
import 'package:flutter/material.dart';

class HeaderForOthers extends StatelessWidget {
  final String text;
  const HeaderForOthers({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 55),
        Stack(
          children: [
            Image.asset(
              'assets/images/banner/banner_for_others.jpg', // replace with your image
              width: double.infinity,
              height: 300,
              fit: BoxFit.cover,
            ),
            Positioned(
              top: 125,
              left: 20,
              right: 20,
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      maxLines: 3,
                      textAlign: TextAlign.center,
                      text,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                        height: 0.98,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 40,
              left: 20,
              right: 20,
              child: ThreeIconImageForHeader(),
            ),
          ],
        ),
      ],
    );
  }
}
