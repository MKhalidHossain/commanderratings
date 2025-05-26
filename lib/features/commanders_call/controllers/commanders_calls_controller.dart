import 'package:commanderratings/features/commanders_call/domain/model/get_all_blog_service_model.dart';
import 'package:commanderratings/features/commanders_call/domain/model/get_all_contact.dart';
import 'package:commanderratings/features/commanders_call/service/commaders_call_service_interface.dart';
import 'package:get/get.dart';

import '../domain/model/get_one_blog_response_model.dart';
import 'commanders_calls_controller.dart' as commandersCallServiceInterface;

class CommandersCallsController extends GetxController implements GetxService {
  final CommandersCallServiceInterface commandersCallServiceInterface;

  CommandersCallsController(this.commandersCallServiceInterface);

  late GetAllBlogResponseModel getAllBlogResponseModel;
  late GetOneBlog getOneBlog;
  late GetAllContactResponse getAllContactResponse;

  bool isLoading = false;

  Future<void> getAllCommandersCall() async {
    try {
      isLoading = true;
      print("Getting all commanders Calls\n\n\n");

      var response = await commandersCallServiceInterface.getAllCommandersCall();
      if (response.statusCode == 200) {

        print('All Commander Call are fetched successfully.');
        print("HTTP Status: ${response.statusCode}");
        print("Raw Response: ${response.body}");

        getAllBlogResponseModel = GetAllBlogResponseModel.fromJson(
            response.body
        );

        print('Call from Controller after model calls.');

      } else {
        // Get.find<AuthController>().logOut();
        // print(response.statusCode.toString());
        // throw Exception('Failed to load Users All Imported Route List');
      }
    } catch (e) {
      if (e is Exception) {
        // print('⚠️ Exception in getAllCommanders: $e dddddddddddd');
      } else {
        print(e);
      }
    }
    isLoading = false;
    update();
  }

  Future<void> getACommandersCall(String _id) async {
    try {
      isLoading = true;
      print("Getting all commanders Calls\n\n\n");

      var response = await commandersCallServiceInterface.getSpecificCommandersCall(_id);

      if (response.statusCode == 200) {

        print('All Commander Call are fetched successfully.');
        print("HTTP Status: ${response.statusCode}");
        print("Raw Response: ${response.body}");

        getOneBlog = GetOneBlog.fromJson(
            response.body
        );

        print('Call from Controller after model calls.');

      } else {

        // Get.find<AuthController>().logOut();
        // print(response.statusCode.toString());
        // throw Exception('Failed to load Users All Imported Route List');

      }
    } catch (e) {
      if (e is Exception) {

        // print('⚠️ Exception in getAllCommanders: $e dddddddddddd');

      } else {
        print(e);
      }
    }
    isLoading = false;
    update();
  }


  Future<void> getAllContact() async {
    try {
      isLoading = true;
      print("Getting all commanders Calls\n\n\n");

      var response = await commandersCallServiceInterface.getAllContact();

      if (response.statusCode == 200) {

        print('All Commander Call are fetched successfully.');
        print("HTTP Status: ${response.statusCode}");
        print("Raw Response: ${response.body}");

        getAllContactResponse = GetAllContactResponse.fromJson(
            response.body
        );

        print('Call from Controller after model calls.');

      } else {

        // Get.find<AuthController>().logOut();
        // print(response.statusCode.toString());
        // throw Exception('Failed to load Users All Imported Route List');

      }
    } catch (e) {
      if (e is Exception) {

        // print('⚠️ Exception in getAllCommanders: $e dddddddddddd');

      } else {
        print(e);
      }
    }
    isLoading = false;
    update();
  }

}