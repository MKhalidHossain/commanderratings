
import 'package:http/http.dart';

abstract class AuthRepositoryInterface {
  Future<Response> register(String fullName, String email, String password);
  Future<Response> login(String email, String password);
  Future<Response> refreshAccessToken(String refreshToken);
  Future<Response> forgetPassword(String email);
  Future<Response> verifyCode(String otp, String email);
  Future<Response> resetPassword(String email, String newPassword);
  Future<Response> logOut();
}