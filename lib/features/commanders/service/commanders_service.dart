import 'package:http/http.dart';
import 'commanders_service_interface.dart';

class CommandersService implements CommandersServiceInterface {
  final CommandersServiceInterface commandersServiceInterface;

  CommandersService({required this.commandersServiceInterface});

  @override
  Future<Response> createCommander() async {
    return await commandersServiceInterface.createCommander();
  }

  @override
  Future<Response> getAllCommander() async {
    return await commandersServiceInterface.getAllCommander();
  }

  @override
  Future<Response> getCommadersAllService() async {
    return await commandersServiceInterface.getCommadersAllService();
  }

  @override
  Future<Response> getCommadersAllUnit() async {
    return await commandersServiceInterface.getCommadersAllUnit();
  }

  @override
  Future<Response> getSpecificCommander(String _id) async {
    return await commandersServiceInterface.getSpecificCommander(_id);
  }

  @override
  Future<Response> filterCommanderWithServiceAndUnits(
    String sevice,
    String unit,
  ) async {
    return await commandersServiceInterface.filterCommanderWithServiceAndUnits(
      sevice,
      unit,
    );
  }
}
