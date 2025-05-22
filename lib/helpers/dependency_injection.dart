import 'package:commanderratings/features/auth/controllers/auth_controller.dart';
import 'package:commanderratings/features/auth/repositories/auth_repository.dart';
import 'package:commanderratings/features/auth/repositories/auth_repository_interface.dart';
import 'package:commanderratings/features/auth/sevices/auth_service.dart';
import 'package:commanderratings/features/auth/sevices/auth_service_interface.dart';
import 'package:commanderratings/features/commanders/controllers/commanders_controller.dart';
import 'package:commanderratings/features/commanders/repositories/commanders_repository.dart';
import 'package:commanderratings/features/commanders/repositories/commanders_repository_interface.dart';
import 'package:commanderratings/features/commanders/service/commanders_service.dart';
import 'package:commanderratings/features/commanders/service/commanders_service_interface.dart';
import 'package:commanderratings/helpers/remote/data/api_client.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> initDI() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  ApiClient apiClient = ApiClient(
    appBaseUrl: 'https://backend-david-weijian.onrender.com/api/v1/',
    sharedPreferences: prefs,
  );

  //////////// Auth Service, Repository and Controller ////////////////////////////////

  Get.lazyPut(
    () => ApiClient(appBaseUrl: 'appBaseUrl', sharedPreferences: prefs),
  );
  Get.lazyPut(
    () => AuthRepository(apiClient: Get.find(), sharedPreferences: prefs),
  );
  AuthRepositoryInterface authRepositoryInterface = AuthRepository(
    apiClient: Get.find(),
    sharedPreferences: prefs,
  );
  Get.lazyPut(() => authRepositoryInterface);
  AuthServiceInterface authServiceInterface = AuthService(Get.find());
  Get.lazyPut(() => authServiceInterface);
  Get.lazyPut(() => AuthController(authServiceInterface: Get.find()));
  Get.lazyPut(() => AuthService(Get.find()));

  //////////// Auth Service, Repository and Controller ////////////////////////////////

  //////////// All Commanders Service, Repository and Controller ////////////////////////////////

  Get.lazyPut(()=> CommandersRepository(apiClient: Get.find(), sharedPreferences: prefs));

  CommandersRepositoryInterface commandersRepositoryInterface = CommandersRepository(apiClient: Get.find(), sharedPreferences: prefs);

  Get.lazyPut(()=> commandersRepositoryInterface);

  CommandersService commandersService = CommandersService( commandersServiceInterface: Get.find());

  CommandersServiceInterface commandersServiceInterface = CommandersService(commandersServiceInterface: Get.find());


  Get.lazyPut(() => commandersService);

  Get.lazyPut(()=> CommandersController(Get.find()));

  Get.lazyPut(() => commandersService);


  // //////////// Setting Service, Repository and Controller ////////////////////////////////

  // //////////// Test Centre Service, Repository and Controller ////////////////////////////////

  // Get.lazyPut(()=> TestRepository(apiClient: Get.find(), sharedPreferences: prefs));

  // TestRepositoryInterface testRepositoryInterface = TestRepository(apiClient: Get.find(), sharedPreferences: prefs);

  // Get.lazyPut(()=> testRepositoryInterface);

  // TestCentreServiceInterface testCentreServiceInterface = TestCentreService(testRepositoryInterface: Get.find());

  // Get.lazyPut(() => testCentreServiceInterface);

  // Get.lazyPut(()=> TestCentreController(testCentreServiceInterface: Get.find()));

  // Get.lazyPut(()=> TestCentreService(testRepositoryInterface: Get.find()));

  //////////// Test Centre Service, Repository and Controller ////////////////////////////////
}
