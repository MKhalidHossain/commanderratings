import 'package:http/http.dart';

abstract class ReviewRepositoryInterface {
  Future <Response> getAllReviews();
  Future<Response> createrReviews(String commanderId, double rating, String title, String description);
  Future<Response> getTopFiveReviews();
}