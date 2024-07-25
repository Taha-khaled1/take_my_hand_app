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
  List<CareersField>? careersCollege;
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
      careersCollege = <CareersField>[];
      json['careers_college'].forEach((v) {
        careersCollege!.add(new CareersField.fromJson(v));
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
  String? title;
  String? createdAt;
  String? images;
  int? id;
  String? address;
  String? logo;
  int? views;
  int? isPopular;
  String? globally;
  int? totalColleges;

  Universities(
      {this.title,
      this.createdAt,
      this.images,
      this.id,
      this.address,
      this.logo,
      this.views,
      this.isPopular,
      this.globally,
      this.totalColleges});

  Universities.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    createdAt = json['created_at'];
    images = json['images'];
    id = json['id'];
    address = json['address'];
    logo = json['logo'];
    views = json['views'];
    isPopular = json['is_popular'];
    globally = json['globally'];
    totalColleges = json['total_colleges'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['created_at'] = this.createdAt;
    data['images'] = this.images;
    data['id'] = this.id;
    data['address'] = this.address;
    data['logo'] = this.logo;
    data['views'] = this.views;
    data['is_popular'] = this.isPopular;
    data['globally'] = this.globally;
    data['total_colleges'] = this.totalColleges;
    return data;
  }
}

class Banners {
  String? image;
  String? type;
  String? name;
  int? id;
  String? bannerUrl;
  String? keyId;
  String? key;

  Banners(
      {this.image,
      this.type,
      this.name,
      this.id,
      this.bannerUrl,
      this.keyId,
      this.key});

  Banners.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    type = json['type'];
    name = json['name'];
    id = json['id'];
    bannerUrl = json['banner_url'];
    keyId = json['key_id'];
    key = json['key'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['type'] = this.type;
    data['name'] = this.name;
    data['id'] = this.id;
    data['banner_url'] = this.bannerUrl;
    data['key_id'] = this.keyId;
    data['key'] = this.key;
    return data;
  }
}

class Articles {
  String? title;
  String? createdAt;
  String? image;
  String? createdBy;
  int? id;
  int? articleCategoryId;
  Category? category;

  Articles(
      {this.title,
      this.createdAt,
      this.image,
      this.createdBy,
      this.id,
      this.articleCategoryId,
      this.category});

  Articles.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    createdAt = json['created_at'];
    image = json['image'];
    createdBy = json['created_by'];
    id = json['id'];
    articleCategoryId = json['article_category_id'];
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['created_at'] = this.createdAt;
    data['image'] = this.image;
    data['created_by'] = this.createdBy;
    data['id'] = this.id;
    data['article_category_id'] = this.articleCategoryId;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    return data;
  }
}

class Category {
  int? id;
  String? title;

  Category({this.id, this.title});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    return data;
  }
}

class CareersField {
  String? title;
  String? createdAt;
  String? image;
  String? type;
  int? views;
  int? id;

  CareersField(
      {this.title, this.createdAt, this.image, this.type, this.views, this.id});

  CareersField.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    createdAt = json['created_at'];
    image = json['image'];
    type = json['type'];
    views = json['views'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['created_at'] = this.createdAt;
    data['image'] = this.image;
    data['type'] = this.type;
    data['views'] = this.views;
    data['id'] = this.id;
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
