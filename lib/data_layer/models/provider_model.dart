class ProviderModel {
  Data? data;
  String? message;
  int? statusCode;

  ProviderModel({this.data, this.message, this.statusCode});

  ProviderModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
    statusCode = json['status_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    data['status_code'] = this.statusCode;
    return data;
  }
}

class Data {
  List<ProvidersUniversity>? providersUniversity;
  List<ProvidersUniversity>? providersPlatform;

  Data({this.providersUniversity, this.providersPlatform});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['providersUniversity'] != null) {
      providersUniversity = <ProvidersUniversity>[];
      json['providersUniversity'].forEach((v) {
        providersUniversity!.add(new ProvidersUniversity.fromJson(v));
      });
    }
    if (json['providersPlatform'] != null) {
      providersPlatform = <ProvidersUniversity>[];
      json['providersPlatform'].forEach((v) {
        providersPlatform!.add(new ProvidersUniversity.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.providersUniversity != null) {
      data['providersUniversity'] =
          this.providersUniversity!.map((v) => v.toJson()).toList();
    }
    if (this.providersPlatform != null) {
      data['providersPlatform'] =
          this.providersPlatform!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProvidersUniversity {
  int? id;
  String? titleEn;
  String? titleAr;
  String? shortDescriptionAr;
  String? shortDescriptionEn;
  String? name;
  String? createdBy;
  int? isActive;
  String? image;
  String? type;
  String? createdAt;
  String? updatedAt;

  ProvidersUniversity(
      {this.id,
      this.titleEn,
      this.titleAr,
      this.shortDescriptionAr,
      this.shortDescriptionEn,
      this.name,
      this.createdBy,
      this.isActive,
      this.image,
      this.type,
      this.createdAt,
      this.updatedAt});

  ProvidersUniversity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    titleEn = json['title_en'];
    titleAr = json['title_ar'];
    shortDescriptionAr = json['short_description_ar'];
    shortDescriptionEn = json['short_description_en'];
    name = json['name'];
    createdBy = json['created_by'];
    isActive = json['is_active'];
    image = json['image'];
    type = json['type'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title_en'] = this.titleEn;
    data['title_ar'] = this.titleAr;
    data['short_description_ar'] = this.shortDescriptionAr;
    data['short_description_en'] = this.shortDescriptionEn;
    data['name'] = this.name;
    data['created_by'] = this.createdBy;
    data['is_active'] = this.isActive;
    data['image'] = this.image;
    data['type'] = this.type;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
