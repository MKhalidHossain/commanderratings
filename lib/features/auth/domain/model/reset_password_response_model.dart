class ResetPasswordResponseModel {
  bool? status;
  String? message;
  Null? data;

  ResetPasswordResponseModel({this.status, this.message, this.data});

  ResetPasswordResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    data['data'] = this.data;
    return data;
  }
}
