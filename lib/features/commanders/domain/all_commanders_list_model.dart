class AllCommandersListModel {
  bool? status;
  String? message;
  Data? data;

  AllCommandersListModel({this.status, this.message, this.data});

  AllCommandersListModel.fromJson(Map<String, dynamic> json) {
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
  List<Commanders>? commanders;
  Pagination? pagination;

  Data({this.commanders, this.pagination});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['commanders'] != null) {
      commanders = <Commanders>[];
      json['commanders'].forEach((v) {
        commanders!.add(Commanders.fromJson(v));
      });
    }
    pagination =
        json['pagination'] != null
            ? Pagination.fromJson(json['pagination'])
            : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (commanders != null) {
      data['commanders'] = commanders!.map((v) => v.toJson()).toList();
    }
    if (pagination != null) {
      data['pagination'] = pagination!.toJson();
    }
    return data;
  }
}

class Commanders {
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
  int? avgRating;
  String? image;

  Commanders({
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
    this.avgRating,
    this.image,
  });

  Commanders.fromJson(Map<String, dynamic> json) {
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
    avgRating = json['avgRating'];
    image = json['image'];
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
    data['profileImage'] = profileImage;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['avgRating'] = avgRating;
    data['image'] = image;
    return data;
  }
}

class Pagination {
  int? currentPage;
  int? totalPages;
  int? totalData;
  bool? hasNextPage;
  bool? hasPrevPage;

  Pagination({
    this.currentPage,
    this.totalPages,
    this.totalData,
    this.hasNextPage,
    this.hasPrevPage,
  });

  Pagination.fromJson(Map<String, dynamic> json) {
    currentPage = json['currentPage'];
    totalPages = json['totalPages'];
    totalData = json['totalData'];
    hasNextPage = json['hasNextPage'];
    hasPrevPage = json['hasPrevPage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['currentPage'] = currentPage;
    data['totalPages'] = totalPages;
    data['totalData'] = totalData;
    data['hasNextPage'] = hasNextPage;
    data['hasPrevPage'] = hasPrevPage;
    return data;
  }
}
