import 'package:commanderratings/core/constants/urls.dart';
import 'package:commanderratings/helpers/remote/data/api_client.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'commanders_repository_interface.dart';

class CommandersRepository implements CommandersRepositoryInterface{

  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;

  CommandersRepository({required this.apiClient, required this.sharedPreferences});

  @override
  Future createCommander(String name, String yearOfExperience, String serviceBroad, String unit, String base, String rank, String commanderimage) async{
    return await apiClient.postData(
        Urls.createCommander,

        {
          "name": name,
          "yearOfExperience": yearOfExperience,
          "serviceBroad": serviceBroad,
          "unit": unit,
          "base": base,
          "rank": rank,
          "image": commanderimage,
        }
    );
  }

  @override
  Future filterCommanderWithServiceAndUnits(String service, String unit) {
    // TODO: implement filterCommanderWithServiceAndUnits
    throw UnimplementedError();
  }

  @override
  Future getAllCommander() {
    // TODO: implement getAllCommander
    throw UnimplementedError();
  }

  @override
  Future getCommandersAllService() {
    // TODO: implement getCommandersAllService
    throw UnimplementedError();
  }

  @override
  Future getCommandersAllUnit() {
    // TODO: implement getCommandersAllUnit
    throw UnimplementedError();
  }

  @override
  Future getSpecificCommander(String _id) {
    // TODO: implement getSpecificCommander
    throw UnimplementedError();
  }




}