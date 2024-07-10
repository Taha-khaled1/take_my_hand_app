class HomeModel {
  Data? data;
  String? message;
  int? statusCode;

  HomeModel({this.data, this.message, this.statusCode});

  HomeModel.fromJson(Map<String, dynamic> json) {
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
  List<Universities>? universities;
  List<Banners>? banners;
  List<Articles>? articles;
  List<CareersField>? careersField;
  List<CareersCollege>? careersCollege;
  List<Courses>? courses;

  Data(
      {this.universities,
      this.banners,
      this.articles,
      this.careersField,
      this.careersCollege,
      this.courses});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['universities'] != null) {
      universities = <Universities>[];
      json['universities'].forEach((v) {
        universities!.add(new Universities.fromJson(v));
      });
    }
    if (json['banners'] != null) {
      banners = <Banners>[];
      json['banners'].forEach((v) {
        banners!.add(new Banners.fromJson(v));
      });
    }
    if (json['articles'] != null) {
      articles = <Articles>[];
      json['articles'].forEach((v) {
        articles!.add(new Articles.fromJson(v));
      });
    }
    if (json['careers_field'] != null) {
      careersField = <CareersField>[];
      json['careers_field'].forEach((v) {
        careersField!.add(new CareersField.fromJson(v));
      });
    }
    if (json['careers_college'] != null) {
      careersCollege = <CareersCollege>[];
      json['careers_college'].forEach((v) {
        careersCollege!.add(new CareersCollege.fromJson(v));
      });
    }
    if (json['courses'] != null) {
      courses = <Courses>[];
      json['courses'].forEach((v) {
        courses!.add(new Courses.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.universities != null) {
      data['universities'] = this.universities!.map((v) => v.toJson()).toList();
    }
    if (this.banners != null) {
      data['banners'] = this.banners!.map((v) => v.toJson()).toList();
    }
    if (this.articles != null) {
      data['articles'] = this.articles!.map((v) => v.toJson()).toList();
    }
    if (this.careersField != null) {
      data['careers_field'] =
          this.careersField!.map((v) => v.toJson()).toList();
    }
    if (this.careersCollege != null) {
      data['careers_college'] =
          this.careersCollege!.map((v) => v.toJson()).toList();
    }
    if (this.courses != null) {
      data['courses'] = this.courses!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Universities {
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

  Universities(
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

  Universities.fromJson(Map<String, dynamic> json) {
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

class Banners {
  int? id;
  String? imageAr;
  String? imageEn;
  int? arrange;
  String? name;
  int? status;
  String? type;
  String? bannerUrl;
  int? keyId;
  String? key;
  String? createdAt;
  String? updatedAt;

  Banners(
      {this.id,
      this.imageAr,
      this.imageEn,
      this.arrange,
      this.name,
      this.status,
      this.type,
      this.bannerUrl,
      this.keyId,
      this.key,
      this.createdAt,
      this.updatedAt});

  Banners.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    imageAr = json['image_ar'];
    imageEn = json['image_en'];
    arrange = json['arrange'];
    name = json['name'];
    status = json['status'];
    type = json['type'];
    bannerUrl = json['banner_url'];
    keyId = json['key_id'];
    key = json['key'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image_ar'] = this.imageAr;
    data['image_en'] = this.imageEn;
    data['arrange'] = this.arrange;
    data['name'] = this.name;
    data['status'] = this.status;
    data['type'] = this.type;
    data['banner_url'] = this.bannerUrl;
    data['key_id'] = this.keyId;
    data['key'] = this.key;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Articles {
  int? id;
  String? titleEn;
  String? titleAr;
  String? descriptionAr;
  String? descriptionEn;
  int? views;
  int? isActive;
  String? image;
  String? createdBy;
  String? createdByImage;
  int? articleCategoryId;
  String? createdAt;
  String? updatedAt;

  Articles(
      {this.id,
      this.titleEn,
      this.titleAr,
      this.descriptionAr,
      this.descriptionEn,
      this.views,
      this.isActive,
      this.image,
      this.createdBy,
      this.createdByImage,
      this.articleCategoryId,
      this.createdAt,
      this.updatedAt});

  Articles.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    titleEn = json['title_en'];
    titleAr = json['title_ar'];
    descriptionAr = json['description_ar'];
    descriptionEn = json['description_en'];
    views = json['views'];
    isActive = json['is_active'];
    image = json['image'];
    createdBy = json['created_by'];
    createdByImage = json['created_by_image'];
    articleCategoryId = json['article_category_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title_en'] = this.titleEn;
    data['title_ar'] = this.titleAr;
    data['description_ar'] = this.descriptionAr;
    data['description_en'] = this.descriptionEn;
    data['views'] = this.views;
    data['is_active'] = this.isActive;
    data['image'] = this.image;
    data['created_by'] = this.createdBy;
    data['created_by_image'] = this.createdByImage;
    data['article_category_id'] = this.articleCategoryId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class CareersCollege {
  int? id;
  String? titleEn;
  String? titleAr;
  int? views;
  int? isActive;
  String? image;
  String? type;
  String? createdAt;
  String? updatedAt;

  CareersCollege(
      {this.id,
      this.titleEn,
      this.titleAr,
      this.views,
      this.isActive,
      this.image,
      this.type,
      this.createdAt,
      this.updatedAt});

  CareersCollege.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    titleEn = json['title_en'];
    titleAr = json['title_ar'];
    views = json['views'];
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
    data['views'] = this.views;
    data['is_active'] = this.isActive;
    data['image'] = this.image;
    data['type'] = this.type;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class CareersField {
  int? id;
  String? titleEn;
  String? titleAr;
  int? views;
  int? isActive;
  String? image;
  String? type;
  String? createdAt;
  String? updatedAt;

  CareersField(
      {this.id,
      this.titleEn,
      this.titleAr,
      this.views,
      this.isActive,
      this.image,
      this.type,
      this.createdAt,
      this.updatedAt});

  CareersField.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    titleEn = json['title_en'];
    titleAr = json['title_ar'];
    views = json['views'];
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
    data['views'] = this.views;
    data['is_active'] = this.isActive;
    data['image'] = this.image;
    data['type'] = this.type;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Courses {
  int? id;
  String? title;
  int? price;
  int? discountPrice;
  int? isActive;
  int? articleCategoryId;
  int? views;
  String? descriptionNameEn;
  String? descriptionNameAr;
  String? createdBy;
  String? provider;
  int? rating;
  int? numberOfReviews;
  int? numberOfHours;
  String? image;
  String? url;
  int? learningPathId;
  int? universityId;
  int? careerId;
  String? type;
  String? createdAt;
  String? updatedAt;

  Courses(
      {this.id,
      this.title,
      this.price,
      this.discountPrice,
      this.isActive,
      this.articleCategoryId,
      this.views,
      this.descriptionNameEn,
      this.descriptionNameAr,
      this.createdBy,
      this.provider,
      this.rating,
      this.numberOfReviews,
      this.numberOfHours,
      this.image,
      this.url,
      this.learningPathId,
      this.universityId,
      this.careerId,
      this.type,
      this.createdAt,
      this.updatedAt});

  Courses.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    discountPrice = json['discount_price'];
    isActive = json['is_active'];
    articleCategoryId = json['article_category_id'];
    views = json['views'];
    descriptionNameEn = json['description_name_en'];
    descriptionNameAr = json['description_name_ar'];
    createdBy = json['created_by'];
    provider = json['provider'];
    rating = json['rating'];
    numberOfReviews = json['number_of_reviews'];
    numberOfHours = json['number_of_hours'];
    image = json['image'];
    url = json['url'];
    learningPathId = json['learning_path_id'];
    universityId = json['university_id'];
    careerId = json['career_id'];
    type = json['type'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['price'] = this.price;
    data['discount_price'] = this.discountPrice;
    data['is_active'] = this.isActive;
    data['article_category_id'] = this.articleCategoryId;
    data['views'] = this.views;
    data['description_name_en'] = this.descriptionNameEn;
    data['description_name_ar'] = this.descriptionNameAr;
    data['created_by'] = this.createdBy;
    data['provider'] = this.provider;
    data['rating'] = this.rating;
    data['number_of_reviews'] = this.numberOfReviews;
    data['number_of_hours'] = this.numberOfHours;
    data['image'] = this.image;
    data['url'] = this.url;
    data['learning_path_id'] = this.learningPathId;
    data['university_id'] = this.universityId;
    data['career_id'] = this.careerId;
    data['type'] = this.type;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
