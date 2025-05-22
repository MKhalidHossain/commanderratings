import 'package:http/http.dart';

abstract class HomeRepositoryInterface {
  Future<Response> getAllCommanders();
}