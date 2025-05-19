
import 'package:http/src/response.dart';

import 'auth_repository_interface.dart';

class AuthRepository implements AuthRepositoryInterface{
  @override
  Future<Response> forgetPassword(String email) {
    // TODO: implement forgetPassword
    throw UnimplementedError();
  }

  @override
  Future<Response> logOut() {
    // TODO: implement logOut
    throw UnimplementedError();
  }

  @override
  Future<Response> login(String email, String password) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<Response> refreshAccessToken(String refreshToken) {
    // TODO: implement refreshAccessToken
    throw UnimplementedError();
  }

  @override
  Future<Response> register(String fullName, String email, String password) {
    // TODO: implement register
    throw UnimplementedError();
  }

  @override
  Future<Response> resetPassword(String email, String newPassword) {
    // TODO: implement resetPassword
    throw UnimplementedError();
  }

  @override
  Future<Response> verifyCode(String otp, String email) {
    // TODO: implement verifyCode
    throw UnimplementedError();
  }
}