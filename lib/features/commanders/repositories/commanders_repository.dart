import 'package:commanderratings/core/constants/urls.dart';
import 'package:commanderratings/helpers/remote/data/api_client.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'commanders_repository_interface.dart';

class CommandersRepository implements CommandersRepositoryInterface {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;

  CommandersRepository({
    required this.apiClient,
    required this.sharedPreferences,
  });

  @override
  Future<Response> createCommander(
    String name,
    String yearOfExperience,
    String serviceBroad,
    String unit,
    String base,
    String rank,
    String commanderimage,
  ) async {
    return await apiClient.postData(Urls.createCommander, {
      "name": name,
      "yearOfExperience": yearOfExperience,
      "serviceBroad": serviceBroad,
      "unit": unit,
      "base": base,
      "rank": rank,
      "image": commanderimage,
    });
  }

  @override
  Future<Response> getAllCommander() async {
    return await apiClient.getData(Urls.getAllCommanders);
  }

  @override
  Future<Response> getSpecificCommander(String _id) async {
    return await apiClient.getData(Urls.getSpecificCommanders+'$_id',);
  }

  @override
  Future<Response> filterCommanderWithServiceAndUnits(String service, String unit) {
    throw UnimplementedError();
  }

  @override
  Future<Response> getCommandersAllService() {
    // TODO: implement getCommandersAllService
    return apiClient.getData(Urls.getAllServices);
  }

  @override
  Future<Response> getCommandersAllUnit() {
    return apiClient.getData(Urls.getAllUnits);
  }
}
