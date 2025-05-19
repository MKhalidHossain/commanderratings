import 'package:http/http.dart';

abstract class CommandersServiceInterface {
  Future<Response> createCommander();
  Future<Response> getAllCommander();
  Future<Response> getSpecificCommander(String _id);  
  Future<Response> filterCommanderWithServiceAndUnits(
    String sevice,
    String unit,
  );


  Future<Response> getCommadersAllUnit();
  Future<Response> getCommadersAllService();
}
