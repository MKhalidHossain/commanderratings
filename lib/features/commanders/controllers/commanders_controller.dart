import 'dart:convert';

import 'package:commanderratings/features/commanders/domain/all_commanders_list_model.dart';
import 'package:commanderratings/features/commanders/service/commanders_service.dart';
import 'package:get/get.dart';

import '../../auth/controllers/auth_controller.dart';

class CommandersController extends GetxController implements GetxService {

  final CommandersService commandersService;

  late AllCommandersListModel allCommandersListModel;

  bool isLoading = false;

  CommandersController(this.commandersService);

  Future<void> getAllCommanders() async {
    isLoading = true;
    var response = await commandersService.getAllCommander();

    if (response.statusCode == 200) {

      allCommandersListModel = AllCommandersListModel.fromJson(json.decode(response.body));

      print('All Commanders are fetched');

    }
    else {
      Get.find<AuthController>().logOut();
      print(response.statusCode.toString());
      throw Exception('Failed to load Users All Imported Route List');
    }
    isLoading = false;
    update();
  }

}