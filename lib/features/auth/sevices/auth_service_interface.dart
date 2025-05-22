
abstract class AuthServiceInterface {
  Future<dynamic> login(String email,  String password);
  Future<dynamic> register(String fullName, String email, String password);
  Future<dynamic> logout();
  Future<dynamic> accessAndRefreshToken(String refreshToken);
  Future<dynamic> forgetPassword(String? email);
  Future<dynamic> verifyCode( String otp ,  String email);
  Future<dynamic> resendOtp(String email);
  Future<dynamic> sendOtp({required String phone});
  Future<dynamic> resetPassword(String email, String newPassword);

  bool isLoggedIn();
  Future<bool> clearUserCredentials();
  bool clearSharedAddress();
  String getUserToken();

  Future<dynamic> updateToken();
  Future<bool?> saveUserToken(String token, String refreshToken);
  Future<dynamic> updateAccessAndRefreshToken();

  bool isFirstTimeInstall();
  void setFirstTimeInstall();
}

