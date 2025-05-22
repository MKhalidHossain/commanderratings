import 'package:http/http.dart';

abstract class LeaderboardRepositoryInterface {
  Future<Response> getLeaderboard();
}