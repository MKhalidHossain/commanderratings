class LogInResponseModel {
  bool? status;
  String? message;
  Data? data;

  LogInResponseModel({this.status, this.message, this.data});

  LogInResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  User? user;
  String? accessToken;

  Data({this.user, this.accessToken});

  Data.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    accessToken = json['accessToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['accessToken'] = accessToken;
    return data;
  }
}

class User {
  String? sId;
  String? email;
  String? role;
  String? profileImage;
  String? refreshToken;
  String? updatedAt;

  User({
    this.sId,
    this.email,
    this.role,
    this.profileImage,
    this.refreshToken,
    this.updatedAt,
  });

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    email = json['email'];
    role = json['role'];
    profileImage = json['profileImage'];
    refreshToken = json['refreshToken'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['email'] = email;
    data['role'] = role;
    data['profileImage'] = profileImage;
    data['refreshToken'] = refreshToken;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
