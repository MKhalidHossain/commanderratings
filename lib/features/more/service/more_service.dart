

import 'package:http/http.dart';

import 'more_service_interface.dart';

class MoreService implements MoreServiceInterface{
  @override
  Future<Response> getFaq() {
    throw UnimplementedError();
  }
}