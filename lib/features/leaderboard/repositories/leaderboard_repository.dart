

import 'package:http/http.dart';
import 'leaderboard_repository_interface.dart';

class LeaderboardRepository implements LeaderboardRepositoryInterface{
  @override
  Future<Response> getLeaderboard() {
    throw UnimplementedError();
  }
}