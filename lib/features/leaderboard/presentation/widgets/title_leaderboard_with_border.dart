import 'package:commanderratings/core/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';

class TitleLeaderboardWithBorder extends StatelessWidget {
  const TitleLeaderboardWithBorder({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.context(context).borderColor),
      ),
      child: Text(
        'Leaderboard',
        style: TextStyle(
          color: AppColors.context(context).textColor,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
