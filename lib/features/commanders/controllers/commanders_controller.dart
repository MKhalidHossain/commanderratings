import 'package:commanderratings/features/commanders/domain/all_commanders_list_model.dart';
import 'package:commanderratings/features/commanders/domain/get_all_service_response_model.dart';
import 'package:commanderratings/features/commanders/domain/get_all_unit_response_model.dart';
import 'package:commanderratings/features/commanders/service/commanders_service_interface.dart';
import 'package:get/get.dart';

import '../domain/single_commander_response_model.dart';

class CommandersController extends GetxController implements GetxService {
  // final CommandersService commandersService;
  final CommandersServiceInterface commandersServiceInterface;
  CommandersController({required this.commandersServiceInterface});

  late AllCommandersListModel allCommandersListModel;

  late SingleCommandersResponseModel commander;

  late GetAllServicesResponseModel getAllServicesResponseModel;
  late GetAllUnitResponseModel getAllUnitResponseModel;

  bool isLoading = false;

  get commandersList => null;

  Future<void> getAllCommanders() async {
    try {
      isLoading = true;
      print("Getting all commanders\n\n\n");

      var response = await commandersServiceInterface.getAllCommander();
      if (response.statusCode == 200) {

        print('All Commanders are fetched successfully.');
        print("HTTP Status: ${response.statusCode}");
        print("Raw Response: ${response.body}");

        allCommandersListModel = AllCommandersListModel.fromJson(

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


  Future<void> getACommander(String _id) async {
    try {
      isLoading = true;
      print("Getting a commander");

      var response = await commandersServiceInterface.getSpecificCommander(_id);
      if (response.statusCode == 200) {

        print('All Commanders are fetched successfully.');
        print("HTTP Status: ${response.statusCode}");
        print("Raw Response: ${response.body}");

        commander = SingleCommandersResponseModel.fromJson(
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


  Future<void> getAllServices() async {
    try {
      isLoading = true;
      print("Getting all Services");

      var response = await commandersServiceInterface.getCommandersAllService();

      if (response.statusCode == 200) {

        print('All Services are fetched successfully.');

        print("HTTP Status: ${response.statusCode}");

        print("Raw Response: ${response.body}");

        getAllServicesResponseModel = GetAllServicesResponseModel.fromJson(
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

  Future<void> getAllUnits() async {
    try {
      isLoading = true;
      print("Getting all Units");

      var response = await commandersServiceInterface.getCommandersAllUnit();

      if (response.statusCode == 200) {

        print('All Units are fetched successfully.');

        print("HTTP Status: ${response.statusCode}");

        print("Raw Response: ${response.body}");

        getAllUnitResponseModel = GetAllUnitResponseModel.fromJson(
            response.body
        );

        print('Call from Units after model calls.');

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

  // Future<void> getAllUnits() async{
  //   try {
  //     isLoading = true;
  //     update();
  //     print("Getting all Units\n\n\n");
  //     var response = await commandersServiceInterface.getCommandersAllUnit();
  //     print("HTTP Status: ${response.statusCode}");
  //     print("Raw Response: ${response.body}");
  //
  //     if (response.statusCode == 200) {
  //       print('All Commanders Units are fetched successfully.');
  //     } else {
  //       getAllUnitResponseModel = GetAllUnitResponseModel.fromJson(
  //         json.decode(response["body"]),
  //       );
  //       Get.find<AuthController>().logOut();
  //       //print(response.statusCode.toString());
  //       throw Exception('Failed to load All Commanders Units');
  //     }
  //   } catch (e) {
  //     if (e is Exception) {
  //       print('⚠️ Exception in Commanders Units: $e');
  //     } else {
  //       print(e);
  //     }
  //   }
  //   isLoading = false;
  //   update();
  // }

}
