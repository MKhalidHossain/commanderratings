class GetAllBlogResponseModel {
  bool? status;
  String? message;
  Data? data;

  GetAllBlogResponseModel({this.status, this.message, this.data});

  GetAllBlogResponseModel.fromJson(Map<String, dynamic> json) {
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
  List<Blogs>? blogs;
  Pagination? pagination;

  Data({this.blogs, this.pagination});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['blogs'] != null) {
      blogs = <Blogs>[];
      json['blogs'].forEach((v) {
        blogs!.add(Blogs.fromJson(v));
      });
    }
    pagination =
        json['pagination'] != null
            ? Pagination.fromJson(json['pagination'])
            : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (blogs != null) {
      data['blogs'] = blogs!.map((v) => v.toJson()).toList();
    }
    if (pagination != null) {
      data['pagination'] = pagination!.toJson();
    }
    return data;
  }
}

class Blogs {
  String? sId;
  String? title;
  String? slug;
  String? description;
  String? image;
  String? imageText;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Blogs({
    this.sId,
    this.title,
    this.slug,
    this.description,
    this.image,
    this.imageText,
    this.createdAt,
    this.updatedAt,
    this.iV,
  });

  Blogs.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    slug = json['slug'];
    description = json['description'];
    image = json['image'];
    imageText = json['imageText'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['title'] = title;
    data['slug'] = slug;
    data['description'] = description;
    data['image'] = image;
    data['imageText'] = imageText;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
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
