import 'package:commanderratings/features/auth/controllers/auth_controller.dart';
import 'package:commanderratings/features/auth/repositories/auth_repository.dart';
import 'package:commanderratings/features/auth/repositories/auth_repository_interface.dart';
import 'package:commanderratings/features/auth/sevices/auth_service.dart';
import 'package:commanderratings/features/auth/sevices/auth_service_interface.dart';
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

  //////////// Setting Service, Repository and Controller ////////////////////////////////

  // Get.lazyPut(()=> SettingRepository(apiClient: Get.find(), sharedPreferences: prefs));

  // SettingRepositoryInterface settingRepositoryInterface = SettingRepository(apiClient: Get.find(), sharedPreferences: prefs);

  // Get.lazyPut(()=> settingRepositoryInterface);

  // SettingsServiceInterface settingsServiceInterface = SettingService(settingRepositoryInterface: Get.find());

  // Get.lazyPut(() => settingsServiceInterface);

  // Get.lazyPut(()=> SettingsController(settingsServiceInterface: Get.find()));

  // Get.lazyPut(()=> SettingService(settingRepositoryInterface: Get.find()));

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
