import 'package:commanderratings/core/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';
import '../../../../core/ratting_a_to_z/ratting.dart';
import '../../domain/models/review.dart';

class ReviewCard extends StatelessWidget {
  final Review review;

  const ReviewCard({super.key, required this.review});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      color: AppColors.context(context).contentBoxGreyColor,
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Row: Avatar - Organization - 9 Star
            Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(review.avatarUrl),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    review.organization,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.context(context).textColor,
                    ),
                  ),
                ),
                ShowRating(rating: review.tenStarRating),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              review.timeAgo,
              style: const TextStyle(color: Colors.grey, fontSize: 12),
            ),
            const SizedBox(height: 8),
            Text(review.content),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  review.reviewerPosition,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.context(context).textColor,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    // View full review action
                  },
                  child: Text(
                    'See full review',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.context(context).textColor,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
