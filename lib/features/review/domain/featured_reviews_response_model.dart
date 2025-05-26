class FeaturedReviewsResponseModel {
  bool? status;
  String? message;
  Data? data;

  FeaturedReviewsResponseModel({this.status, this.message, this.data});

  FeaturedReviewsResponseModel.fromJson(Map<String, dynamic> json) {
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
  List<TopCommanders>? topCommanders;

  Data({this.topCommanders});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['topCommanders'] != null) {
      topCommanders = <TopCommanders>[];
      json['topCommanders'].forEach((v) {
        topCommanders!.add(new TopCommanders.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (topCommanders != null) {
      data['topCommanders'] =
          topCommanders!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TopCommanders {
  String? sId;
  String? name;
  int? yearOfExperience;
  String? serviceBroad;
  String? unit;
  String? base;
  String? rank;
  String? image;
  String? createdAt;
  String? updatedAt;
  int? iV;
  double? sumRating;
  HighestRatedReview? highestRatedReview;

  TopCommanders(
      {this.sId,
        this.name,
        this.yearOfExperience,
        this.serviceBroad,
        this.unit,
        this.base,
        this.rank,
        this.image,
        this.createdAt,
        this.updatedAt,
        this.iV,
        this.sumRating,
        this.highestRatedReview});

  TopCommanders.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    yearOfExperience = json['yearOfExperience'];
    serviceBroad = json['serviceBroad'];
    unit = json['unit'];
    base = json['base'];
    rank = json['rank'];
    image = json['image'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    sumRating = json['sumRating'] != null ? json['sumRating'].toDouble() : null;
    highestRatedReview = json['highestRatedReview'] != null
        ? new HighestRatedReview.fromJson(json['highestRatedReview'])
        : null;
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
    data['image'] = image;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    data['sumRating'] = sumRating;
    if (highestRatedReview != null) {
      data['highestRatedReview'] = highestRatedReview!.toJson();
    }
    return data;
  }
}

class HighestRatedReview {
  String? title;
  String? description;
  double? rating;

  HighestRatedReview({this.title, this.description, this.rating});

  HighestRatedReview.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    rating = json['rating'] != null ? json['rating'].toDouble() : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['description'] = description;
    data['rating'] = rating;
    return data;
  }
}
