import 'package:flutter/material.dart';
import '../../data/domain_or_model/models/review.dart';
import 'review_card.dart'; // Your ReviewCard widget

class FeaturedReviewsSection extends StatelessWidget {
  const FeaturedReviewsSection({super.key});

  // Sample static reviews list
  List<Review> get reviews => [
    Review(
      organization: 'US Navy',
      timeAgo: '2 Days Ago',
      content: 'Exceptional leadership during deployment.',
      reviewerPosition: 'Squadron Commander',
      tenStarRating: 9.5,
      avatarUrl: 'https://i.pravatar.cc/150?img=1',
    ),
    Review(
      organization: 'US Army',
      timeAgo: '5 Days Ago',
      content: 'Outstanding communication and leadership skills.',
      reviewerPosition: 'Platoon Leader',
      tenStarRating: 7.5,
      avatarUrl: 'https://i.pravatar.cc/150?img=2',
    ),
    Review(
      organization: 'US Air Force',
      timeAgo: '1 Week Ago',
      content: 'Excellent decision-making under pressure.',
      reviewerPosition: 'Flight Commander',
      tenStarRating: 8,
      avatarUrl: 'https://i.pravatar.cc/150?img=3',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'FEATURED REVIEWS',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 16),
          Column(
            children:
                reviews.map((review) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: ReviewCard(review: review),
                  );
                }).toList(),
          ),
        ],
      ),
    );
  }
}
