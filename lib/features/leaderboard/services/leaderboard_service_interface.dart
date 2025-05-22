import 'package:http/http.dart';

abstract class LeaderboardServiceInterface {
  Future<Response> getLeaderboard();
}