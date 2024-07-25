class UniversityDetalisModel {
  Data? data;
  String? message;
  int? statusCode;

  UniversityDetalisModel({this.data, this.message, this.statusCode});

  UniversityDetalisModel.fromJson(Map<String, dynamic> json) {
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
  int? id;
  String? titleEn;
  String? titleAr;
  String? logo;
  String? images;
  int? isApplicationOpen;
  int? views;
  int? isActive;
  int? isPopular;
  int? countryId;
  String? established;
  String? locally;
  String? globally;
  String? descriptionAr;
  String? descriptionEn;
  String? address;
  String? email;
  String? website;
  String? phone;
  String? abbreviation;
  String? type;
  int? isYoutube;
  String? video;
  int? totalColleges;
  String? latitude;
  String? longitude;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
      this.titleEn,
      this.titleAr,
      this.logo,
      this.images,
      this.isApplicationOpen,
      this.views,
      this.isActive,
      this.isPopular,
      this.countryId,
      this.established,
      this.locally,
      this.globally,
      this.descriptionAr,
      this.descriptionEn,
      this.address,
      this.email,
      this.website,
      this.phone,
      this.abbreviation,
      this.type,
      this.isYoutube,
      this.video,
      this.totalColleges,
      this.latitude,
      this.longitude,
      this.createdAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    titleEn = json['title_en'];
    titleAr = json['title_ar'];
    logo = json['logo'];
    images = json['images'];
    isApplicationOpen = json['is_application_open'];
    views = json['views'];
    isActive = json['is_active'];
    isPopular = json['is_popular'];
    countryId = json['country_id'];
    established = json['established'];
    locally = json['locally'];
    globally = json['globally'];
    descriptionAr = json['description_ar'];
    descriptionEn = json['description_en'];
    address = json['address'];
    email = json['email'];
    website = json['website'];
    phone = json['phone'];
    abbreviation = json['abbreviation'];
    type = json['type'];
    isYoutube = json['is_youtube'];
    video = json['video'];
    totalColleges = json['total_colleges'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title_en'] = this.titleEn;
    data['title_ar'] = this.titleAr;
    data['logo'] = this.logo;
    data['images'] = this.images;
    data['is_application_open'] = this.isApplicationOpen;
    data['views'] = this.views;
    data['is_active'] = this.isActive;
    data['is_popular'] = this.isPopular;
    data['country_id'] = this.countryId;
    data['established'] = this.established;
    data['locally'] = this.locally;
    data['globally'] = this.globally;
    data['description_ar'] = this.descriptionAr;
    data['description_en'] = this.descriptionEn;
    data['address'] = this.address;
    data['email'] = this.email;
    data['website'] = this.website;
    data['phone'] = this.phone;
    data['abbreviation'] = this.abbreviation;
    data['type'] = this.type;
    data['is_youtube'] = this.isYoutube;
    data['video'] = this.video;
    data['total_colleges'] = this.totalColleges;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
