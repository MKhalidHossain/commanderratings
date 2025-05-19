
import 'package:commanderratings/features/commanders_call/repositories/commanders_call_repository_interface.dart';
import 'package:http/src/response.dart';

class CommadersCallRepository implements CommandersCallRepositoryInterface{
  @override
  Future<Response> getAllCommandersCall() {
    throw UnimplementedError();
  }
  
  @override
  Future<Response> getSpecificCommandersCall(String _id) {
    throw UnimplementedError();
  }
}