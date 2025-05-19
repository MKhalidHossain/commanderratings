import 'package:commanderratings/features/commanders_call/service/commaders_call_service_interface.dart';
import 'package:http/http.dart';

class CommadersCallService implements CommandersCallServiceInterface {
  @override
  Future<Response> getAllCommandersCall() {
    throw UnimplementedError();
  }

  @override
  Future<Response> getSpecificCommandersCall(String _id) {
    throw UnimplementedError();
  }
}
