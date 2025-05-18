// ignore_for_file: unnecessary_new

class GetTopFiveReviewsResponseModel {
  bool? status;
  String? message;
  List<Data>? data;

  GetTopFiveReviewsResponseModel({this.status, this.message, this.data});

  GetTopFiveReviewsResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? image;
  String? sId;
  String? name;
  int? yearOfExperience;
  String? serviceBroad;
  String? unit;
  String? base;
  String? rank;
  String? profileImage;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Data({
    this.image,
    this.sId,
    this.name,
    this.yearOfExperience,
    this.serviceBroad,
    this.unit,
    this.base,
    this.rank,
    this.profileImage,
    this.createdAt,
    this.updatedAt,
    this.iV,
  });

  Data.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    sId = json['_id'];
    name = json['name'];
    yearOfExperience = json['yearOfExperience'];
    serviceBroad = json['serviceBroad'];
    unit = json['unit'];
    base = json['base'];
    rank = json['rank'];
    profileImage = json['profileImage'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['image'] = image;
    data['_id'] = sId;
    data['name'] = name;
    data['yearOfExperience'] = yearOfExperience;
    data['serviceBroad'] = serviceBroad;
    data['unit'] = unit;
    data['base'] = base;
    data['rank'] = rank;
    data['profileImage'] = profileImage;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}
