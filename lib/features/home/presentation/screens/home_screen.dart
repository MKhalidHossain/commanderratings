import 'package:commanderratings/features/review/controllers/review_controller.dart';
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

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  @override
  void initState() {
    Get.find<ReviewController>().getAllFeaturedReviews().then((_) {
      final controller = Get.find<ReviewController>();
      if (controller.featuredReviewsResponseModel != null &&
          controller.featuredReviewsResponseModel.data != null &&
          controller.featuredReviewsResponseModel.data!.topCommanders != null) {
      }
    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //const SizedBox(height: 55),
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
                  Container(
                    child: GetBuilder<ReviewController>(
                        builder: (reviewController){
                          return !reviewController.isLoading ?
                          Column(
                            children: List.generate(reviewController.featuredReviewsResponseModel.data!.topCommanders!.length,
                                    (index){
                                  var review = reviewController.featuredReviewsResponseModel.data!.topCommanders![index];
                                  return  ReviewCard(review: review);
                                }
                            ),
                          ) :
                          Container(
                            height: 300,
                            child: Center(
                              child: CircularProgressIndicator(),
                            ),
                          );
                        }
                    ),
                  )
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
