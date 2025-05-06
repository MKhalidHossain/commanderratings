import 'package:commanderratings/core/utils/constants/app_colors.dart';
import 'package:commanderratings/core/widgets/title_with_icon_prefix.dart';
import 'package:flutter/material.dart';
import '../widgets/leaderboard_ranking.dart';
import '../widgets/title_leaderboard_with_border.dart';

class LeaderboardScreen extends StatelessWidget {
  const LeaderboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 95),
            TitleWithIconPrefix(
              color: AppColors.context(context).textColor,
              text: 'Leaderboard',
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.context(context).contentBoxColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    TitleLeaderboardWithBorder(),
                    const SizedBox(height: 16),
                    LeaderboardRanking(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
