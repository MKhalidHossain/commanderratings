import 'package:commanderratings/core/constants/urls.dart';
import 'package:commanderratings/helpers/remote/data/api_client.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'review_repositories_interface.dart';

class ReviewRepository implements ReviewRepositoryInterface {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;

  ReviewRepository(this.apiClient, this.sharedPreferences);

  @override
  Future<Response> getAllReviews() async {
    return await apiClient.getData(Urls.getAllReviews);
  }

  @override
  Future<Response> getTopFiveReviews() async{
    return await apiClient.getData(Urls.getTopFiveReviews);
  }

  @override
  Future<Response> createReviews(
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
  Future<Response> getFeaturedFiveReviews()  async{
    return await apiClient.getData(Urls.getAllFeaturedReview);
  }
}
