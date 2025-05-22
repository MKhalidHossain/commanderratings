import 'package:http/http.dart';

abstract class MoreServiceInterface {
  Future<Response> getFaq();
}