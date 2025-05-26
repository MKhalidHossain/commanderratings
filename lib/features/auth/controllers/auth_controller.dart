import 'package:commanderratings/features/auth/domain/model/login_response_model.dart';
import 'package:commanderratings/features/auth/presentation/screens/sign_up.dart';
import 'package:commanderratings/features/auth/sevices/auth_service_interface.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../app.dart';
import '../../../helpers/custom_snackbar.dart';
import '../../../helpers/remote/data/api_checker.dart';
import '../../../helpers/remote/data/api_client.dart';
import '../../../utils/app_constants.dart';
import '../presentation/screens/log_in.dart';
import '../presentation/screens/otp_screen.dart';
import '../presentation/screens/reset_password.dart';

class AuthController extends GetxController implements GetxService{
      final AuthServiceInterface authServiceInterface;

      AuthController({required this.authServiceInterface});


      bool _isLoading = false;
      bool _acceptTerms = false;
      bool get isLoading => _isLoading;
      bool get acceptTerms => _acceptTerms;
      final String _mobileNumber = '';
      String get mobileNumber => _mobileNumber;
      XFile? _pickedProfileFile ;
      XFile? get pickedProfileFile => _pickedProfileFile;
      XFile identityImage = XFile('');
      List<XFile> identityImages = [];
      List<MultipartBody> multipartList = [];
      String countryDialCode = '+880';
      String email = '';

      void setCountryCode(String code){
            countryDialCode = code;
            update();
      }

      TextEditingController fNameController = TextEditingController();
      TextEditingController lNameController = TextEditingController();
      TextEditingController passwordController = TextEditingController();
      TextEditingController phoneController = TextEditingController();
      TextEditingController confirmPasswordController = TextEditingController();
      TextEditingController emailController = TextEditingController();
      TextEditingController addressController = TextEditingController();
      TextEditingController identityNumberController = TextEditingController();

      FocusNode fNameNode = FocusNode();
      FocusNode lNameNode = FocusNode();
      FocusNode phoneNode = FocusNode();
      FocusNode passwordNode = FocusNode();
      FocusNode confirmPasswordNode = FocusNode();
      FocusNode emailNode = FocusNode();
      FocusNode addressNode = FocusNode();
      FocusNode identityNumberNode = FocusNode();

      late LogInResponseModel logInResponseModel;


      void addImageAndRemoveMultiParseData(){
            multipartList.clear();
            identityImages.clear();
            update();
      }

      void pickImage(bool isBack, bool isProfile) async {
            if(isProfile){
                  _pickedProfileFile = (await ImagePicker().pickImage(source: ImageSource.gallery))!;
            } else{
                  identityImage = (await ImagePicker().pickImage(source: ImageSource.gallery))!;
                  identityImages.add(identityImage);
                  multipartList.add(MultipartBody('identity_images[]', identityImage));
            }
            update();
      }

      void removeImage(int index){
            identityImages.removeAt(index);
            multipartList.removeAt(index);
            update();
      }

      final List<String> _identityTypeList = ['passport', 'driving_license', 'nid', ];
      List<String> get identityTypeList => _identityTypeList;
      String _identityType = '';
      String get identityType => _identityType;

      void setIdentityType (String setValue){
            _identityType = setValue;
            update();
      }


      Future<void> login(String email, String password) async {
            _isLoading = true;
            update();

            // Response? response = Response();

            Response? response = await authServiceInterface.login(  email, password);
            if(response!.statusCode == 200){
                  Map map = response.body;
                  String token = '';
                  String refreshToken = '';

                  print(token.toString());






                  logInResponseModel = LogInResponseModel.fromJson(response.body);

                  refreshToken = logInResponseModel.data!.user!.refreshToken!;

                  token = logInResponseModel.data!.accessToken!;

                  print('accessToken ${logInResponseModel.data!.accessToken} NOWW Jonhnney  Bruites');
                  print('refreshToken $refreshToken NOWW Jonhnney  Bruites');
                  print('User Token $token  ================================== from comtroller ');
                  setUserToken(token, refreshToken);

                  Get.offAll(MainScreen());

                  showCustomSnackBar('Welcome you have successfully Logged In');

                  _isLoading = false;
            }else if(response.statusCode == 202){
                  if(response.body['data']['is_phone_verified'] == 0){

                  }
            }
            else if(response.statusCode == 400) {
                  Get.offAll(SignUp());
                  showCustomSnackBar('Sorry you have no account, please create a account');
            }
            else{
                  _isLoading = false;
                  ApiChecker.checkApi(response);
            }

            _isLoading = false;
            update();
      }

      bool isLoggedIn() {

            return authServiceInterface.isLoggedIn();
      }

      bool isFirstTimeInstall(){
            return true;
      }



      bool logging = false;


      Future<void> logOut() async {
            SharedPreferences preferences = await SharedPreferences.getInstance();
            logging = true;
            update();
            Response? response = await authServiceInterface.logout();



            if(response!.statusCode == 200){

                  await preferences.setString(AppConstants.token, '');
                  await preferences.setString(AppConstants.refreshToken, '');


                  // PusherHelper().pusherDisconnectPusher();

            }else{
                  logging = false;
                  ApiChecker.checkApi(response);
            }
            update();

      }

      Future<void> permanentDelete() async {
            logging = true;
            update();

            update();
      }


      Future<void> register(String fullName, String email, String password) async {
            _isLoading = true;
            update();
            Response? response = await authServiceInterface.register(fullName, email, password);
            if(response!.statusCode == 201){
                  Get.to(LogIn());
                  showCustomSnackBar('Welcome you have successfully Registered');
            }else{
                  _isLoading = false;
                  ApiChecker.checkApi(response);
            }
            update();
      }

      Future<Response> sendOtp({required String countryCode, required String phone}) async{
            _isLoading = true;
            update();

            Response? response = Response();

            update();
            return response;
      }

      Future<void> otpVerification(String otp, String email) async{
            _isLoading = true;
            update();
            Response? response = await authServiceInterface.verifyCode(otp, email);
            if(response!.body['status'] == true){
                  showCustomSnackBar('Otp verification has been successful');
                  Get.to(ResetPassword());
            }
            else {
                  showCustomSnackBar('There is a problem in sending OTP');
                  // Get.find<AuthController>().logOut();
            }

            update();
      }

      Future<void> resendOtp(String email) async{
            _isLoading = true;
            update();
            Response? response = await authServiceInterface.resendOtp(email);
            if(response!.body['status'] == true){
                  showCustomSnackBar('Otp has been successful to your mail');

                  Get.to(OtpScreen());
            }

            update();

      }

      Future<void> forgetPassword(String emails) async {
            email = emails;
            _isLoading = true;
            update();

            Response? response = await authServiceInterface.forgetPassword(emails);

            if (response?.statusCode  == 201) {
                  _isLoading = false;
                  showCustomSnackBar('successfully sent otp');
                  // Get.to(CodeVerification(mail: emails,));
            }else{
                  _isLoading = false;
                  showCustomSnackBar('invalid mail');
            }
            update();
      }

      Future<void> resetPassword(String email, String newPassword) async {

            _isLoading = true;

            update();

            Response? response = await authServiceInterface.resetPassword(email, newPassword);
            if (response!.statusCode == 200) {
                  // SnackBarWidget('password_change_successfully'.tr, isError: false);
                  showCustomSnackBar('Password Change Successfully');
                  Get.offAll(()=> const LogIn());
            }else{
                  showCustomSnackBar('Password Change was  Unsuccessfully');
                  ApiChecker.checkApi(response);
            }

            _isLoading = false;

            update();
      }

      Future<void> changePassword(String password, String newPassword) async {
            _isLoading = true;
            update();

            Response? response = await authServiceInterface.resetPassword(password, newPassword);
            if (response!.statusCode == 200) {
                  showCustomSnackBar('Password Change Successfully');
                  logOut();
                  Get.offAll(()=> const LogIn());
            }else{
                  ApiChecker.checkApi(response);
            }

            _isLoading = false;
            update();
      }

      bool updateFcm = false;

      Future<void> updateAccessAndRefreshToken() async {

            Response? response =  await authServiceInterface.updateAccessAndRefreshToken();
            if(response?.statusCode == 200){

                  String token = response!.body['accessToken'];
                  String refreshToken = response!.body['refreshToken'];

                  print('accessToken $token NOWW');
                  print('refreshToken $refreshToken');

                  setUserToken(token, refreshToken);
                  updateFcm = false;
            }else{
                  updateFcm = false;
                  ApiChecker.checkApi(response!);
            }

            update();

      }

      String _verificationCode = '';
      String _otp = '';
      String get otp => _otp;
      String get verificationCode => _verificationCode;

      void updateVerificationCode(String query) {
            _verificationCode = query;
            if(_verificationCode.isNotEmpty){
                  _otp = _verificationCode;
            }
            update();
      }

      void clearVerificationCode(){
            updateVerificationCode('');
            _verificationCode = '';
            update();
      }


      bool _isActiveRememberMe = false;
      bool get isActiveRememberMe => _isActiveRememberMe;

      void toggleTerms() {
            _acceptTerms = !_acceptTerms;
            update();
      }

      void toggleRememberMe() {
            _isActiveRememberMe = !_isActiveRememberMe;
            update();
      }

      void setRememberMe() {
            _isActiveRememberMe = true;
      }


      String getUserToken() {
            return authServiceInterface.getUserToken();
      }

      Future <void> setUserToken(String token, String refreshToken) async{
            authServiceInterface.saveUserToken(token, refreshToken);
      }

      Future<bool> getFirsTimeInstall()async{
            return authServiceInterface.isFirstTimeInstall();
      }

      void setFirstTimeInstall(){
            return authServiceInterface.setFirstTimeInstall();
      }

}