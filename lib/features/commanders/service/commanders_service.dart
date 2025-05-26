import 'package:commanderratings/features/commanders/repositories/commanders_repository_interface.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'commanders_service_interface.dart';

class CommandersService implements CommandersServiceInterface {
  final CommandersRepositoryInterface commandersRepositoryInterface;

  CommandersService({required this.commandersRepositoryInterface});

  @override
  Future<Response> createCommander(String name , String yearOfExperience,String serviceBroad ,String unit, String base, String rank, String commanderimage) async {
    return await commandersRepositoryInterface.createCommander( name ,  yearOfExperience, serviceBroad , unit, base, rank, commanderimage );
  }

  @override
  Future<Response> getAllCommander() async {
    return await commandersRepositoryInterface.getAllCommander();
  }
  
    @override
  Future<Response> getSpecificCommander(String _id) async {
    return await commandersRepositoryInterface.getSpecificCommander(_id);
  }


  @override
  Future<Response> getCommandersAllService() async {
    return await commandersRepositoryInterface.getCommandersAllService();
  }

  @override
  Future<Response> getCommandersAllUnit() async {
    return await commandersRepositoryInterface.getCommandersAllUnit();
  }


  @override
  Future<Response> filterCommanderWithServiceAndUnits(String service, String unit,) async {
    return await commandersRepositoryInterface.filterCommanderWithServiceAndUnits(
      service,
      unit,
    );
  }


}
