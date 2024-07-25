class CollegeModel {
  DataUniversity? data;
  String? message;
  int? statusCode;

  CollegeModel({this.data, this.message, this.statusCode});

  CollegeModel.fromJson(Map<String, dynamic> json) {
    data =
        json['data'] != null ? new DataUniversity.fromJson(json['data']) : null;
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

class DataUniversity {
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
  List<Colleges>? colleges;

  DataUniversity(
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
      this.updatedAt,
      this.colleges});

  DataUniversity.fromJson(Map<String, dynamic> json) {
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
    if (json['colleges'] != null) {
      colleges = <Colleges>[];
      json['colleges'].forEach((v) {
        colleges!.add(new Colleges.fromJson(v));
      });
    }
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
    if (this.colleges != null) {
      data['colleges'] = this.colleges!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Colleges {
  int? id;
  String? titleEn;
  String? titleAr;
  String? logo;
  int? totalYears;
  String? lastYearEn;
  String? lastYearAr;
  String? video;
  String? category;
  String? nategaTansiq;
  String? descriptionAr;
  String? descriptionEn;
  int? isActive;
  int? views;
  int? isCredits;
  int? universityId;
  String? createdAt;
  String? updatedAt;

  Colleges(
      {this.id,
      this.titleEn,
      this.titleAr,
      this.logo,
      this.totalYears,
      this.lastYearEn,
      this.lastYearAr,
      this.video,
      this.category,
      this.nategaTansiq,
      this.descriptionAr,
      this.descriptionEn,
      this.isActive,
      this.views,
      this.isCredits,
      this.universityId,
      this.createdAt,
      this.updatedAt});

  Colleges.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    titleEn = json['title_en'];
    titleAr = json['title_ar'];
    logo = json['logo'];
    totalYears = json['total_years'];
    lastYearEn = json['last_year_en'];
    lastYearAr = json['last_year_ar'];
    video = json['video'];
    category = json['category'];
    nategaTansiq = json['natega_tansiq'];
    descriptionAr = json['description_ar'];
    descriptionEn = json['description_en'];
    isActive = json['is_active'];
    views = json['views'];
    isCredits = json['is_credits'];
    universityId = json['university_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title_en'] = this.titleEn;
    data['title_ar'] = this.titleAr;
    data['logo'] = this.logo;
    data['total_years'] = this.totalYears;
    data['last_year_en'] = this.lastYearEn;
    data['last_year_ar'] = this.lastYearAr;
    data['video'] = this.video;
    data['category'] = this.category;
    data['natega_tansiq'] = this.nategaTansiq;
    data['description_ar'] = this.descriptionAr;
    data['description_en'] = this.descriptionEn;
    data['is_active'] = this.isActive;
    data['views'] = this.views;
    data['is_credits'] = this.isCredits;
    data['university_id'] = this.universityId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
