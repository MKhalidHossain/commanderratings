import 'package:get/get_connect/http/src/response/response.dart';

abstract class CommandersServiceInterface {
  // Future<Response> createCommander();

  Future<Response> createCommander(
    String name,
    String yearOfExperience,
    String serviceBroad,
    String unit,
    String base,
    String rank,
    String commanderimage,
  );

  Future<Response> getAllCommander();

  Future<Response> getSpecificCommander(String _id);

  Future<Response> filterCommanderWithServiceAndUnits(
    String service,
    String unit,
  );

  Future<Response> getCommandersAllUnit();
  Future<Response> getCommandersAllService();
}
