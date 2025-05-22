import 'dart:ui';

import 'package:http/http.dart';

abstract class CommandersServiceInterface {
  // Future<Response> createCommander();

  Future<dynamic> createCommander(String name , String yearOfExperience,String serviceBroad ,String unit, String base, String rank, String commanderimage);

  Future<dynamic> getAllCommander();

  Future<dynamic> getSpecificCommander(String _id);

  Future<dynamic> filterCommanderWithServiceAndUnits(
      String service,
      String unit,
      );


  Future<dynamic> getCommandersAllUnit();
  Future<dynamic> getCommandersAllService();
}
