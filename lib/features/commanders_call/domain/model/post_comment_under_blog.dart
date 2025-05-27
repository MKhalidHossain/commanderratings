class PostCommentUnderBlogResponceModel {
  bool? status;
  String? message;
  Data? data;

  PostCommentUnderBlogResponceModel({this.status, this.message, this.data});

  PostCommentUnderBlogResponceModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? blog;
  String? name;
  String? email;
  String? comment;
  String? sId;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Data(
      {this.blog,
        this.name,
        this.email,
        this.comment,
        this.sId,
        this.createdAt,
        this.updatedAt,
        this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    blog = json['blog'];
    name = json['name'];
    email = json['email'];
    comment = json['comment'];
    sId = json['_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['blog'] = this.blog;
    data['name'] = this.name;
    data['email'] = this.email;
    data['comment'] = this.comment;
    data['_id'] = this.sId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
