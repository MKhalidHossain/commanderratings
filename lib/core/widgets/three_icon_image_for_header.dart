import 'package:commanderratings/core/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';

class ThreeIconImageForHeader extends StatelessWidget {
  const ThreeIconImageForHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon: Icon(Icons.arrow_back),
          color: AppColors.context(context).iconColor,
          iconSize: 30,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        Image.asset('assets/images/headers/star_logo.png', height: 50),
        Image.asset('assets/images/headers/search_icon.png', height: 30),
      ],
    );
  }
}
