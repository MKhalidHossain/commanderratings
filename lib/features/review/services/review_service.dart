import 'package:commanderratings/features/review/repositories/review_repositories_interface.dart';
import 'package:get/get_connect/http/src/response/response.dart' show Response;
import 'review_service_interface.dart';


class ReviewService implements ReviewServiceInterface{
  final ReviewRepositoryInterface reviewRepositoryInterface ;

  ReviewService(this.reviewRepositoryInterface);

  @override
  Future<Response> createReviews(String commanderId, double rating, String title, String description) async{

    return await reviewRepositoryInterface.createReviews(commanderId, rating, title, description);
  }

  @override
  Future<Response> getAllReviews() async{
    // TODO: implement getAllReviews
    return await reviewRepositoryInterface.getAllReviews();
  }

  @override
  Future<Response> getTopFiveReviews()async {
    // TODO: implement getTopFiveReviews
    return await reviewRepositoryInterface.getTopFiveReviews();
  }

  @override
  Future<Response> getFeaturedFiveReviews() async{
    // TODO: implement getFeaturedFiveReviews
    return await reviewRepositoryInterface.getFeaturedFiveReviews();
  }


  
}