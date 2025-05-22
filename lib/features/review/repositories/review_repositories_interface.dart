
abstract class ReviewRepositoryInterface {
  Future <dynamic> getAllReviews();
  Future<dynamic> createrReviews(String commanderId, double rating, String title, String description);
  Future<dynamic> getTopFiveReviews();
}