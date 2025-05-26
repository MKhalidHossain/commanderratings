import 'package:get/get_connect/http/src/response/response.dart';

abstract class CommandersCallRepositoryInterface {
  Future<Response> getAllCommandersCall();
  Future<Response> getSpecificCommandersCall(String _id );
  Future<Response> getAllContact();
}