import 'package:commanderratings/core/constants/urls.dart';
import 'package:commanderratings/features/commanders_call/repositories/commanders_call_repository_interface.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../helpers/remote/data/api_client.dart';


class CommandersCallRepository implements CommandersCallRepositoryInterface{
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;

  CommandersCallRepository(this.apiClient, this.sharedPreferences);
  @override
  Future<Response> getAllCommandersCall() {
    return apiClient.getData(Urls.getABlogs);
  }
  
  @override
  Future<Response> getSpecificCommandersCall(String _id) {
    return apiClient.getData(Urls.getABlogs+_id);
  }

  @override
  Future<Response> getAllContact() {
    return apiClient.getData(Urls.getAllContact);
  }

}