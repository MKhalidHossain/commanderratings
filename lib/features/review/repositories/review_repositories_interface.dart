import 'package:get/get_connect/http/src/response/response.dart';
abstract class ReviewRepositoryInterface {

  Future <Response> getAllReviews();
  Future<Response> createReviews(String commanderId, double rating, String title, String description);
  Future<Response> getTopFiveReviews();
  Future<Response> getFeaturedFiveReviews();
}