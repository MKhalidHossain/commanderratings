import 'package:commanderratings/features/theme/app_themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/widgets/title_subtitle_text.dart';
import '../../domain/models/review.dart';
import '../widgets/anonymous_reviews.dart';
import '../widgets/banner_section.dart';
import '../widgets/leadership_section.dart';
import '../widgets/qr_code_donation.dart';
import '../widgets/review_card.dart';
import '../widgets/service_veteran_section.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  // Sample list of reviews
  final List<Review> featuredReviews = [
    Review(
      organization: 'US Navy',
      timeAgo: '2 Days Ago',
      content:
          'Exceptional leadership during our deployment. Created a positive environment while maintaining high standards.',
      reviewerPosition: 'Squadron Commander',
      tenStarRating: 9.5,
      avatarUrl: 'https://randomuser.me/api/portraits/men/1.jpg',
    ),
    Review(
      organization: 'US Army',
      timeAgo: '1 Week Ago',
      content:
          'Demonstrated outstanding strategic planning during joint operations. Always put the team first.',
      reviewerPosition: 'Battalion Commander',
      tenStarRating: 8.5,
      avatarUrl: 'https://randomuser.me/api/portraits/women/2.jpg',
    ),
    Review(
      organization: 'US Air Force',
      timeAgo: '3 Weeks Ago',
      content:
          'Innovative approach to problem-solving that improved our squadron efficiency by 30%.',
      reviewerPosition: 'Wing Commander',
      tenStarRating: 9,
      avatarUrl: 'https://randomuser.me/api/portraits/men/3.jpg',
    ),
    Review(
      organization: 'US Marines',
      timeAgo: '1 Month Ago',
      content:
          'Led with courage and integrity in challenging conditions. Inspired the entire unit.',
      reviewerPosition: 'Company Commander',
      tenStarRating: 7.5,
      avatarUrl: 'https://randomuser.me/api/portraits/women/4.jpg',
    ),
  ];

  final controller = Get.find<AppTheme>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          TextButton(
            onPressed: () {
              controller.changeThemeToDark();
            },
            child: Center(child: Text('Light')),
          ),
          TextButton(
            onPressed: () {
              controller.changeThemeToLight();
            },
            child: Center(child: Text('Dark')),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 55),
            const BannerSection(),
            const LeadershipSection(),
            const ServiceVeteranSection(),

            // Featured Reviews Section
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 16.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TitleText(text: 'FEATURED REVIEWS'),
                  const SizedBox(height: 16),
                  // Map the list of reviews to ReviewCard widgets
                  ...featuredReviews.map(
                    (review) => Column(
                      children: [
                        ReviewCard(review: review),
                        // const SizedBox(height: 0),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const AnonymousReviewsBanner(),
            // const SizedBox(height: 10),
            const QrCodeDonation(),
          ],
        ),
      ),
    );
  }
}
