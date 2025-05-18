class GetAllUnitResponseModel {
  bool? status;
  String? message;
  Data? data;

  GetAllUnitResponseModel({this.status, this.message, this.data});

  GetAllUnitResponseModel.fromJson(Map<String, dynamic> json) {
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
  List<Units>? units;
  PaginationInfo? paginationInfo;

  Data({this.units, this.paginationInfo});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['units'] != null) {
      units = <Units>[];
      json['units'].forEach((v) {
        units!.add(Units.fromJson(v));
      });
    }
    paginationInfo =
        json['paginationInfo'] != null
            ? PaginationInfo.fromJson(json['paginationInfo'])
            : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (units != null) {
      data['units'] = units!.map((v) => v.toJson()).toList();
    }
    if (paginationInfo != null) {
      data['paginationInfo'] = paginationInfo!.toJson();
    }
    return data;
  }
}

class Units {
  String? sId;
  String? name;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Units({this.sId, this.name, this.createdAt, this.updatedAt, this.iV});

  Units.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}

class PaginationInfo {
  int? currentPage;
  int? totalPages;
  int? totalData;
  bool? hasNextPage;
  bool? hasPrevPage;

  PaginationInfo({
    this.currentPage,
    this.totalPages,
    this.totalData,
    this.hasNextPage,
    this.hasPrevPage,
  });

  PaginationInfo.fromJson(Map<String, dynamic> json) {
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
