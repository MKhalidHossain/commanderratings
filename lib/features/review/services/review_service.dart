

import 'package:http/http.dart';

import 'review_service_interface.dart';

class ReviewService implements ReviewServiceInterface{
  final ReviewServiceInterface reviewServiceInterface ;

  ReviewService({required this.reviewServiceInterface});

  @override
  Future<Response> getAllReviews() async{
    return await reviewServiceInterface.getAllReviews();
  }

  @override
  Future<Response> createrReviews (String commanderId, double rating, String title, String description) async{
    return await reviewServiceInterface.createrReviews(commanderId, rating, title, description);
  }

  @override
  Future<Response> getTopFiveReviews() async{
    return await reviewServiceInterface.getTopFiveReviews();
  }
  
}