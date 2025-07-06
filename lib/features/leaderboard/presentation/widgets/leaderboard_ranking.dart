import 'package:commanderratings/core/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../review/domain/get_top_five_reviews_response_model.dart';

class LeaderboardRanking extends StatefulWidget {
  final GetTopFiveReviewsResponseModel getTopFiveReviewsResponseModel;

  LeaderboardRanking({super.key, required this.getTopFiveReviewsResponseModel});

  @override
  State<LeaderboardRanking> createState() => _LeaderboardContentState();
}

class _LeaderboardContentState extends State<LeaderboardRanking> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: ListView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.all(0),
        physics: const NeverScrollableScrollPhysics(),

        itemCount:
            widget.getTopFiveReviewsResponseModel.data!.topCommanders!.length,

        itemBuilder: (context, index) {
          return Container(
            // height: size.height * 0.175,
            margin: const EdgeInsets.only(bottom: 10),
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: AppColors.context(context).contentBoxGreyColor,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.white10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '#${widget.getTopFiveReviewsResponseModel.data!.topCommanders![index].rank!}' ??
                      " #Rank",
                ),

                const SizedBox(height: 8),

                Row(
                  children: [
                    Text(
                      widget
                              .getTopFiveReviewsResponseModel
                              .data!
                              .topCommanders![index]
                              .sumRating!
                              .toStringAsFixed(0)! ??
                          "0",
                      style: const TextStyle(
                        fontFamily: 'aero_matics',
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.amber,
                      ),
                    ),
                    const SizedBox(width: 8),

                    Text(
                      //data['name'],
                      widget
                              .getTopFiveReviewsResponseModel
                              .data!
                              .topCommanders![index]
                              .name! ??
                          "Commander's Name",
                      style: const TextStyle(
                        fontFamily: 'aero_matics',
                        fontSize: 14,
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 8),

                Text(
                  widget
                          .getTopFiveReviewsResponseModel
                          .data!
                          .topCommanders![index]
                          .serviceBroad! ??
                      "Service Broad",
                ),

                Text(
                  widget
                          .getTopFiveReviewsResponseModel
                          .data!
                          .topCommanders![index]
                          .unit! ??
                      "Unit",
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
