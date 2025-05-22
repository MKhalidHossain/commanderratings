class Urls {
  static const String baseUrl = 'https://johnnybrutes.onrender.com';
  static const String register = '/api/v1/auth/register';
  static const String login = '/api/v1/auth/login';
  static const String refreshAccessToken = '/api/v1/auth/refresh-access-token';
  // static const String updateAccessAndRefreshToken = '/api/v1/auth/refresh-access-token';
  static const String forgetPassword = '/api/v1/auth/forget-password';
  static const String resetPassword = '/api/v1/auth/reset-password';
  static const String verifyCode = '/api/v1/auth/verify-code';
  static const String logOut = '/api/v1/auth/logout';

  //commanders
  static const String createCommander ='/api/v1/commander';
  static const String getAllCommanders =
      '/api/v1/commander?page=1&limit=8&service=Army&unit=101st Division&rated=low';
  static const String getSpecificCommanders =
      '/api/v1/commander/68282f573bb6496b06a27e7f';

  //Services
  static const String getAllReviews = '/api/v1/review?page=1&limit=1';
  static const String getTopFiveReviews = '/api/v1/review/top-five';
  static const String getAllServices = '/api/v1/service?page=1&limit=10';
  static const String getAllBlogs =
      '/api/v1/blog?page=1&limit=8&slug=first-blogsdaf';
  static const String getAllUnits = '/api/v1/unit?page=1&limit=10';
  //static const String getCommanderById = '/api/v1/commanders/';
}
