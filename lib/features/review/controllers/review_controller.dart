import 'dart:convert';
import 'package:commanderratings/features/review/domain/create_review_response_model.dart';
import 'package:commanderratings/features/review/domain/featured_reviews_response_model.dart';
import 'package:commanderratings/features/review/domain/get_all_review_response_model.dart';
import 'package:commanderratings/features/review/services/review_service_interface.dart';
import 'package:get/get.dart';
import '../../../helpers/custom_snackbar.dart';
import '../domain/get_top_five_reviews_response_model.dart';


class ReviewController extends GetxController implements GetxService {

  final ReviewServiceInterface reviewServiceInterface;

  ReviewController(this.reviewServiceInterface);

  late GetAllReviewsResponseModel getAllReviewsResponseModel;

  late GetTopFiveReviewsResponseModel getTopFiveReviewsResponseModel;

  late FeaturedReviewsResponseModel featuredReviewsResponseModel;

  late CreateReviewsResponseModel createReviewsResponseModel;

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

  Future<void> createReview(String commanderId, double rating, String title, String description)async {
    isLoading = true;
    var response = await reviewServiceInterface.createReviews(commanderId, rating, title, description);

    if (response.statusCode == 201) {

      createReviewsResponseModel = CreateReviewsResponseModel.fromJson(response.body);

      showCustomSnackBar('Your comment has been add for this post Successfully');

      showCustomSnackBar(createReviewsResponseModel.data!.description.toString());
    }
    else {

    }
    isLoading = false;
    update();
  }

}