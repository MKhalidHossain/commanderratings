
import 'package:http/src/response.dart';

import 'commanders_repository_interface.dart';

class CommandersRepository implements CommandersRepositoryInterface{
  @override
  Future<Response> createCommander() {
    // TODO: implement createCommander
    throw UnimplementedError();
  }

  @override
  Future<Response> filterCommanderWithServiceAndUnits(String sevice, String unit) {
    // TODO: implement filterCommanderWithServiceAndUnits
    throw UnimplementedError();
  }

  @override
  Future<Response> getAllCommander() {
    // TODO: implement getAllCommander
    throw UnimplementedError();
  }

  @override
  Future<Response> getCommadersAllService() {
    // TODO: implement getCommadersAllService
    throw UnimplementedError();
  }

  @override
  Future<Response> getCommadersAllUnit() {
    // TODO: implement getCommadersAllUnit
    throw UnimplementedError();
  }

  @override
  Future<Response> getSpecificCommander(String _id) {
    // TODO: implement getSpecificCommander
    throw UnimplementedError();
  }
}