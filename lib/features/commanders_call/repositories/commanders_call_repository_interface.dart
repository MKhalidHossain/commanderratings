import 'package:http/http.dart';

abstract class CommandersCallRepositoryInterface {
  Future<Response> getAllCommandersCall();
  Future<Response> getSpecificCommandersCall(String _id );
}