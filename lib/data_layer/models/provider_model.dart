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
  String? title;
  String? shortDescription;
  String? name;
  String? image;
  int? id;
  String? createdBy;
  String? type;

  ProvidersUniversity(
      {this.title,
      this.shortDescription,
      this.name,
      this.image,
      this.id,
      this.createdBy,
      this.type});

  ProvidersUniversity.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    shortDescription = json['short_description'];
    name = json['name'];
    image = json['image'];
    id = json['id'];
    createdBy = json['created_by'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['short_description'] = this.shortDescription;
    data['name'] = this.name;
    data['image'] = this.image;
    data['id'] = this.id;
    data['created_by'] = this.createdBy;
    data['type'] = this.type;
    return data;
  }
}
