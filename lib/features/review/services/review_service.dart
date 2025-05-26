import 'package:commanderratings/features/review/repositories/review_repositories_interface.dart';
import 'package:get/get_connect/http/src/response/response.dart' show Response;
import 'review_service_interface.dart';


class ReviewService implements ReviewServiceInterface{
  final ReviewRepositoryInterface reviewRepositoryInterface ;

  ReviewService(this.reviewRepositoryInterface);

  @override
  Future<Response> createReviews(String commanderId, double rating, String title, String description) {

    return reviewRepositoryInterface.createReviews(commanderId, rating, title, description);
  }

  @override
  Future<Response> getAllReviews() {
    // TODO: implement getAllReviews
    return reviewRepositoryInterface.getAllReviews();
  }

  @override
  Future<Response> getTopFiveReviews() {
    // TODO: implement getTopFiveReviews
    return reviewRepositoryInterface.getTopFiveReviews();
  }

  @override
  Future<Response> getFeaturedFiveReviews() {
    // TODO: implement getFeaturedFiveReviews
    return reviewRepositoryInterface.getFeaturedFiveReviews();
  }


  
}