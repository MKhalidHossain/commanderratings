class GetOneBlog {
  bool? status;
  String? message;
  Data? data;

  GetOneBlog({this.status, this.message, this.data});

  GetOneBlog.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  Blog? blog;
  List<LatestComments>? latestComments;

  Data({this.blog, this.latestComments});

  Data.fromJson(Map<String, dynamic> json) {
    blog = json['blog'] != null ? Blog.fromJson(json['blog']) : null;
    if (json['latestComments'] != null) {
      latestComments = <LatestComments>[];
      json['latestComments'].forEach((v) {
        latestComments!.add(LatestComments.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.blog != null) {
      data['blog'] = this.blog!.toJson();
    }
    if (this.latestComments != null) {
      data['latestComments'] =
          this.latestComments!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Blog {
  int? views;
  String? sId;
  String? title;
  String? slug;
  String? description;
  String? image;
  String? imageText;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Blog(
      {this.views,
        this.sId,
        this.title,
        this.slug,
        this.description,
        this.image,
        this.imageText,
        this.createdAt,
        this.updatedAt,
        this.iV});

  Blog.fromJson(Map<String, dynamic> json) {
    views = json['views'];
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
    data['views'] = this.views;
    data['_id'] = this.sId;
    data['title'] = this.title;
    data['slug'] = this.slug;
    data['description'] = this.description;
    data['image'] = this.image;
    data['imageText'] = this.imageText;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class LatestComments {
  String? sId;
  String? blog;
  String? name;
  String? email;
  String? comment;
  String? createdAt;
  String? updatedAt;
  int? iV;

  LatestComments(
      {this.sId,
        this.blog,
        this.name,
        this.email,
        this.comment,
        this.createdAt,
        this.updatedAt,
        this.iV});

  LatestComments.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    blog = json['blog'];
    name = json['name'];
    email = json['email'];
    comment = json['comment'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = this.sId;
    data['blog'] = this.blog;
    data['name'] = this.name;
    data['email'] = this.email;
    data['comment'] = this.comment;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
