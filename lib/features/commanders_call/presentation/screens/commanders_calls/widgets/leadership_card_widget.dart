import 'package:commanderratings/core/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../core/leadership_card.dart';

class LeadershipCardWidget extends StatelessWidget {
  final LeadershipCard card;

  const LeadershipCardWidget({super.key, required this.card});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Image.network(
              card.imageUrl,
              width: double.infinity,
              height: 180,
              fit: BoxFit.cover,
            ),
            Container(
              width: double.infinity,
              height: 180,
              color: Colors.black.withOpacity(0.4),
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  maxLines: 5,
                  card.centerText,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 2),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
          child: Text(
            maxLines: 10,
            card.title,
            style: TextStyle(
              color: AppColors.context(context).textColor,
              fontFamily: "aero_matics",
              fontSize: 14,
            ),
          ),
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}
