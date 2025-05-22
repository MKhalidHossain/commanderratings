import 'package:commanderratings/core/constants/urls.dart';
import 'package:commanderratings/helpers/remote/data/api_client.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'review_repositories_interface.dart';

class ReviewRepository implements ReviewRepositoryInterface {
  final ApiClient apiClient;

  final SharedPreferences sharedPreferences;

  ReviewRepository({required this.apiClient, required this.sharedPreferences});

    @override
  Future<Response> getAllReviews() {
    throw UnimplementedError();
  }

  @override
  Future createrReviews(
    String commanderId,
    double rating,
    String title,
    String description,
  ) async {
    return await apiClient.postData(Urls.createReview, {
      "commanderId": commanderId,
      "rating": rating,
      "title": title,
      "description": description,
    });
  }



  @override
  Future<Response> getTopFiveReviews() {
    throw UnimplementedError();
  }
}
