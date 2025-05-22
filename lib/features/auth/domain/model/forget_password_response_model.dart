class ForgetPasswordResponseModel {
  bool? status;
  String? message;
  ForgetPasswordResponseModel? data;

  ForgetPasswordResponseModel({this.status, this.message, this.data});

  ForgetPasswordResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['status'] = status;
    data['message'] = message;
    data['data'] = this.data;
    return data;
  }
}
