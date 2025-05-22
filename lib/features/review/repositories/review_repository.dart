

import 'package:http/http.dart';

import 'review_repositories_interface.dart';

class ReviewRepository implements ReviewRepositoryInterface{
  @override
  Future<Response> createrReviews(String commanderId, double rating, String title, String description) {
    throw UnimplementedError();
  }

  @override
  Future<Response> getAllReviews() {
    throw UnimplementedError();
  }

  @override
  Future<Response> getTopFiveReviews() {
    throw UnimplementedError();
  }
}