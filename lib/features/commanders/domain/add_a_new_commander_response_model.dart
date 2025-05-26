class AddANewCommanderResponseModel {
  bool? status;
  String? message;
  Data? data;

  AddANewCommanderResponseModel({this.status, this.message, this.data});

  AddANewCommanderResponseModel.fromJson(Map<String, dynamic> json) {
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
  String? name;
  int? yearOfExperience;
  String? serviceBroad;
  String? unit;
  String? base;
  String? rank;
  String? image;
  String? sId;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Data(
      {this.name,
        this.yearOfExperience,
        this.serviceBroad,
        this.unit,
        this.base,
        this.rank,
        this.image,
        this.sId,
        this.createdAt,
        this.updatedAt,
        this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    yearOfExperience = json['yearOfExperience'];
    serviceBroad = json['serviceBroad'];
    unit = json['unit'];
    base = json['base'];
    rank = json['rank'];
    image = json['image'];
    sId = json['_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['yearOfExperience'] = yearOfExperience;
    data['serviceBroad'] = serviceBroad;
    data['unit'] = unit;
    data['base'] = base;
    data['rank'] = rank;
    data['image'] = image;
    data['_id'] = sId;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}
