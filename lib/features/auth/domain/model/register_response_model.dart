class RegisterResponseModel {
  bool? status;
  String? message;
  Data? data;

  RegisterResponseModel({this.status, this.message, this.data});

  RegisterResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
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
  String? sId;
  String? fullName;
  String? email;
  String? password;
  String? profileImage;

  Data({this.sId, this.fullName, this.email, this.password, this.profileImage});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    fullName = json['fullName'];
    email = json['email'];
    password = json['password'];
    profileImage = json['profileImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['fullName'] = fullName;
    data['email'] = email;
    data['password'] = password;
    data['profileImage'] = profileImage;
    return data;
  }
}
