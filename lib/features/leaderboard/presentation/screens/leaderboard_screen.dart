import 'package:commanderratings/core/utils/constants/app_colors.dart';
import 'package:commanderratings/core/widgets/title_with_icon_prefix.dart';
import 'package:commanderratings/features/review/controllers/review_controller.dart';
import 'package:commanderratings/features/review/domain/get_top_five_reviews_response_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/leaderboard_ranking.dart';
import '../widgets/title_leaderboard_with_border.dart';

class LeaderboardScreen extends StatefulWidget {
  const LeaderboardScreen({super.key});

  @override
  State<LeaderboardScreen> createState() => _LeaderboardScreenState();
}

class _LeaderboardScreenState extends State<LeaderboardScreen> {

  late GetTopFiveReviewsResponseModel getTopFiveReviewsResponseModel;

  @override
  void initState() {
    Get.find<ReviewController>().getTopFiveReviews().then((_) {
      final controller = Get.find<ReviewController>();
      if (controller.getTopFiveReviewsResponseModel != null &&
          controller.getTopFiveReviewsResponseModel.data != null &&
          controller.getTopFiveReviewsResponseModel.data!.topCommanders != null) {

      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ReviewController>(
        builder: (reviewController){
          return !reviewController.isLoading ? Scaffold(
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
                          LeaderboardRanking(getTopFiveReviewsResponseModel: reviewController.getTopFiveReviewsResponseModel),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ) :
          Center(
            child: CircularProgressIndicator(),
          );
        }
    );
  }
}
