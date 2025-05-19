import 'package:http/http.dart';

abstract class CommandersCallServiceInterface {
  Future<Response> getAllCommandersCall();
  Future<Response> getSpecificCommandersCall(String _id );
}