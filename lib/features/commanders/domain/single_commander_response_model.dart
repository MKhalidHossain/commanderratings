class SingleCommandersResponseModel {
  bool? status;
  String? message;
  Data? data;

  SingleCommandersResponseModel({this.status, this.message, this.data});

  SingleCommandersResponseModel.fromJson(Map<String, dynamic> json) {
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
  Commander? commander;
  List<Reviews>? reviews;
  String? averageRating;
  int? totalReviews;
  int? position;
  int? totalCommanders;

  Data({this.commander, this.reviews, this.averageRating, this.totalReviews, this.position,this.totalCommanders});

  Data.fromJson(Map<String, dynamic> json) {
    commander = json['commander'] != null
        ? Commander.fromJson(json['commander'])
        : null;
    if (json['reviews'] != null) {
      reviews = <Reviews>[];
      json['reviews'].forEach((v) {
        reviews!.add(Reviews.fromJson(v));
      });
    }
    averageRating = json['averageRating'];
    totalReviews = int.tryParse(json['totalReviews'].toString());
    position = int.tryParse(json['position'].toString());
    totalCommanders = int.tryParse(json['totalCommanders'].toString());
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (commander != null) {
      data['commander'] = commander!.toJson();
    }
    if (reviews != null) {
      data['reviews'] = reviews!.map((v) => v.toJson()).toList();
    }
    data['averageRating'] = averageRating;
    data['totalReviews'] = totalReviews;
    data['position'] = position;
    data['totalCommanders'] = totalCommanders;
    return data;
  }
}

class Commander {
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

  Commander(
      {this.sId,
      this.name,
      this.yearOfExperience,
      this.serviceBroad,
      this.unit,
      this.base,
      this.rank,
      this.profileImage,
      this.createdAt,
      this.updatedAt});

  Commander.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    yearOfExperience = json['yearOfExperience'];
    serviceBroad = json['serviceBroad'];
    unit = json['unit'];
    base = json['base'];
    rank = json['rank'];
    profileImage = json['image'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    data['yearOfExperience'] = yearOfExperience;
    data['serviceBroad'] = serviceBroad;
    data['unit'] = unit;
    data['base'] = base;
    data['rank'] = rank;
    data['image'] = profileImage;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}

class Reviews {
  String? sId;
  String? title;
  String? description;
  int? rating;
  UserId? userId;
  String? commanderId;
  String? createdAt;
  String? updatedAt;

  Reviews(
      {this.sId,
      this.title,
      this.description,
      this.rating,
      this.userId,
      this.commanderId,
      this.createdAt,
      this.updatedAt});

  Reviews.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    description = json['description'];
    rating = int.tryParse(json['rating'].toString());
    userId =
        json['userId'] != null ? UserId.fromJson(json['userId']) : null;
    commanderId = json['commanderId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['title'] = title;
    data['description'] = description;
    data['rating'] = rating;
    if (userId != null) {
      data['userId'] = userId!.toJson();
    }
    data['commanderId'] = commanderId;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}

class UserId {
  String? sId;

  UserId({this.sId});

  UserId.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    return data;
  }
}
