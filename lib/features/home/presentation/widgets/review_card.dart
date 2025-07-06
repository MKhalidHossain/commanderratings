import 'package:commanderratings/features/commanders/presentations/screens/commanders_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/ratting_a_to_z/ratting.dart';
import '../../../../core/utils/constants/app_colors.dart';
import '../../../review/domain/featured_reviews_response_model.dart';

class ReviewCard extends StatelessWidget {
  final TopCommanders review;

  const ReviewCard({super.key, required this.review});

  String timeAgoSinceDate(String dateString) {
    final date = DateTime.parse(dateString).toLocal();
    final now = DateTime.now();
    final difference = now.difference(date);

    if (difference.inSeconds < 60) {
      return '${difference.inSeconds}s ago';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes}m ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours}h ago';
    } else if (difference.inDays < 7) {
      return '${difference.inDays}d ago';
    } else {
      // Optional: Format full date if more than a week ago
      return '${date.day}/${date.month}/${date.year}';
    }
  }

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
            /// Row: Avatar - Organization - 10 Star
            Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.grey[100],
                  child: ClipOval(
                    child: Image.network(
                      review.image ?? '',
                      width: 40,
                      height: 40,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Image.asset(
                          'assets/icons/profile_placeholder.png',
                          width: 40,
                          height: 40,
                          fit: BoxFit.cover,
                        );
                      },
                    ),
                  ),
                ),

                // CircleAvatar(
                //   radius: 20,
                //   backgroundImage: NetworkImage(review.image!) ,
                // ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    maxLines: 1,
                    review.serviceBroad! ?? 'Commander',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.context(context).textColor,
                    ),
                  ),
                ),
                ShowRating(
                  rating:
                      (double.tryParse(
                        review.highestRatedReview!.rating.toString(),
                      )!) ??
                      0.0,
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              timeAgoSinceDate(review.updatedAt.toString()),
              style: const TextStyle(color: Colors.grey, fontSize: 12),
            ),
            const SizedBox(height: 8),
            Text(maxLines: 5, review.highestRatedReview!.description!?? 'Description of blog'),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // NormalCustomButton(
                //   fillColor: Colors.grey.shade400,
                //   textColor: AppColors.context(context).textColor,
                //   text: review.reviewerPosition,
                //   onPressed: () {},
                // ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    review.serviceBroad!,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.context(context).textColor,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Get.to(CommandersDetails(commandersId: review.sId!));
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
