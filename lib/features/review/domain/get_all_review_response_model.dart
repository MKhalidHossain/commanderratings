class GetAllReviewsResponseModel {
  bool? status;
  String? message;
  Data? data;

  GetAllReviewsResponseModel({this.status, this.message, this.data});

  GetAllReviewsResponseModel.fromJson(Map<String, dynamic> json) {
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
  List<Reviews>? reviews;
  int? totalReviews;

  Data({this.reviews, this.totalReviews});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['reviews'] != null) {
      reviews = <Reviews>[];
      json['reviews'].forEach((v) {
        reviews!.add(Reviews.fromJson(v));
      });
    }
    totalReviews = json['totalReviews'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (reviews != null) {
      data['reviews'] = reviews!.map((v) => v.toJson()).toList();
    }
    data['totalReviews'] = totalReviews;
    return data;
  }
}

class Reviews {
  String? sId;
  String? title;
  String? description;
  int? rating;
  String? userId;
  String? commanderId;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Reviews({
    this.sId,
    this.title,
    this.description,
    this.rating,
    this.userId,
    this.commanderId,
    this.createdAt,
    this.updatedAt,
    this.iV,
  });

  Reviews.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    description = json['description'];
    rating = json['rating'];
    userId = json['userId'];
    commanderId = json['commanderId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['title'] = title;
    data['description'] = description;
    data['rating'] = rating;
    data['userId'] = userId;
    data['commanderId'] = commanderId;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}
