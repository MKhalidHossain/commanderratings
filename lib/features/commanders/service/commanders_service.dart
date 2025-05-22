import 'dart:ui';

import 'package:http/http.dart';
import 'commanders_service_interface.dart';

class CommandersService implements CommandersServiceInterface {
  final CommandersServiceInterface commandersServiceInterface;

  CommandersService({required this.commandersServiceInterface});

  @override
  Future<Response> createCommander(String name , String yearOfExperience,String serviceBroad ,String unit, String base, String rank, String commanderimage) async {
    return await commandersServiceInterface.createCommander( name ,  yearOfExperience, serviceBroad , unit, base, rank, commanderimage );
  }

  @override
  Future<Response> getAllCommander() async {
    return await commandersServiceInterface.getAllCommander();
  }

  @override
  Future<Response> getCommandersAllService() async {
    return await commandersServiceInterface.getCommandersAllService();
  }

  @override
  Future<Response> getCommandersAllUnit() async {
    return await commandersServiceInterface.getCommandersAllUnit();
  }

  @override
  Future<Response> getSpecificCommander(String _id) async {
    return await commandersServiceInterface.getSpecificCommander(_id);
  }

  @override
  Future<Response> filterCommanderWithServiceAndUnits(String service, String unit,) async {
    return await commandersServiceInterface.filterCommanderWithServiceAndUnits(
      service,
      unit,
    );
  }


}
