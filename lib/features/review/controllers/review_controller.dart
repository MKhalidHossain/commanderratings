import 'dart:convert';
import 'package:commanderratings/features/review/domain/featured_reviews_response_model.dart';
import 'package:commanderratings/features/review/domain/get_all_review_response_model.dart';
import 'package:commanderratings/features/review/services/review_service.dart';
import 'package:commanderratings/features/review/services/review_service_interface.dart';
import 'package:get/get.dart';
import '../domain/get_top_five_reviews_response_model.dart';


class ReviewController extends GetxController{

  final ReviewServiceInterface reviewServiceInterface;

  ReviewController(this.reviewServiceInterface);

  late GetAllReviewsResponseModel getAllReviewsResponseModel;

  late GetTopFiveReviewsResponseModel getTopFiveReviewsResponseModel;

  late FeaturedReviewsResponseModel featuredReviewsResponseModel;

  bool isLoading = false;

  Future<void> getAllReviews() async {
    try {
      isLoading = true;
      print("Getting all commanders Calls\n\n\n");

      var response = await reviewServiceInterface.getAllReviews();
      if (response.statusCode == 200) {

        print('All Commander Call are fetched successfully.');
        print("HTTP Status: ${response.statusCode}");
        print("Raw Response: ${response.body}");

        getAllReviewsResponseModel = GetAllReviewsResponseModel.fromJson(
           jsonDecode( response.body)
        );

        print('Call from Controller Reviews after model calls.');

      } else {
        // Get.find<AuthController>().logOut();
        // print(response.statusCode.toString());
        // throw Exception('Failed to load Users All Imported Route List');
      }
    } catch (e) {
      if (e is Exception) {
        // print('⚠️ Exception in getAllCommanders: $e dddddddddddd');
      } else {
        print(e);
      }
    }
    isLoading = false;
    update();
  }

  Future<void> getTopFiveReviews() async {
    try {
      isLoading = true;
      print("Getting all commanders Calls\n\n\n");

      var response = await reviewServiceInterface.getTopFiveReviews();
      if (response.statusCode == 200) {

        print('All Commander Call are fetched successfully.');
        print("HTTP Status: ${response.statusCode}");
        print("Raw Response: ${response.body}");

        getTopFiveReviewsResponseModel = GetTopFiveReviewsResponseModel.fromJson(
            // jsonDecode( response.body)
           response.body
        );

        print('Call from Controller Top Five Reviews after model calls.');

      } else {
        // Get.find<AuthController>().logOut();
        // print(response.statusCode.toString());
        // throw Exception('Failed to load Users All Imported Route List');
      }
    } catch (e) {
      if (e is Exception) {
        // print('⚠️ Exception in getAllCommanders: $e dddddddddddd');
      } else {
        print(e);
      }
    }
    isLoading = false;
    update();
  }

  Future<void> getAllFeaturedReviews() async {
    try {
      isLoading = true;
      print("Getting all commanders Calls\n\n\n");

      var response = await reviewServiceInterface.getFeaturedFiveReviews();
      if (response.statusCode == 200) {

        print('All Commander Call are fetched successfully.');
        print("HTTP Status: ${response.statusCode}");
        print("Raw Response: ${response.body}");

        featuredReviewsResponseModel = FeaturedReviewsResponseModel.fromJson(
            response.body
        );

        print('Call from Controller Reviews after model calls.');

      } else {
        // Get.find<AuthController>().logOut();
        // print(response.statusCode.toString());
        // throw Exception('Failed to load Users All Imported Route List');
      }
    } catch (e) {
      if (e is Exception) {
        // print('⚠️ Exception in getAllCommanders: $e dddddddddddd');
      } else {
        print(e);
      }
    }
    isLoading = false;
    update();
  }

}