import 'package:http/http.dart';

import 'auth_service_interface.dart';

class AuthService implements AuthServiceInterface {
  final AuthServiceInterface authServiceInterface;

  AuthService({required this.authServiceInterface});

  @override
  Future<Response> register(
    String fullName,
    String email,
    String password,
  ) async {
    return await authServiceInterface.register(fullName, email, password);
  }

  @override
  Future<Response> forgetPassword(String email) async {
    return await authServiceInterface.forgetPassword(email);
  }

  @override
  Future<Response> login(String email, String password) async {
    return await authServiceInterface.login(email, password);
  }

  @override
  Future<Response> refreshAccessToken(String refreshToken) async {
    return await authServiceInterface.refreshAccessToken(refreshToken);
  }

  @override
  Future<Response> resetPassword(String email, String newPassword) async {
    return await authServiceInterface.resetPassword(email, newPassword);
  }

  @override
  Future<Response> verifyCode(String otp, String email) async {
    return await authServiceInterface.verifyCode(otp, email);
  }

  @override
  Future<Response> logOut() async {
    return await authServiceInterface.logOut();
  }
}
