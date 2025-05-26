import 'package:commanderratings/features/commanders_call/repositories/commanders_call_repository_interface.dart';
import 'package:commanderratings/features/commanders_call/service/commaders_call_service_interface.dart';
import 'package:get/get_connect/http/src/response/response.dart';

class CommandersCallService implements CommandersCallServiceInterface {

  final CommandersCallRepositoryInterface commandersCallRepositoryInterface;

  CommandersCallService(this.commandersCallRepositoryInterface);

  @override
  Future<Response> getAllCommandersCall() {
    return commandersCallRepositoryInterface.getAllCommandersCall();
  }

  @override
  Future<Response> getSpecificCommandersCall(String _id) {
    return commandersCallRepositoryInterface.getSpecificCommandersCall(_id);
  }

  @override
  Future<Response> getAllContact() {
    return commandersCallRepositoryInterface.getAllContact();
  }
}
