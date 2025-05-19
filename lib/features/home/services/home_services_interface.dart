

import 'package:http/http.dart';

abstract class HomeServicesInterface {
  Future<Response> getAllCommanders();
}