class ArticleModel {
  Data? data;
  String? message;
  int? statusCode;

  ArticleModel({this.data, this.message, this.statusCode});

  ArticleModel.fromJson(Map<String, dynamic> json) {
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
  List<Articles>? articles;
  List<ArticleCategories>? articleCategories;

  Data({this.articles, this.articleCategories});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['articles'] != null) {
      articles = <Articles>[];
      json['articles'].forEach((v) {
        articles!.add(new Articles.fromJson(v));
      });
    }
    if (json['articleCategories'] != null) {
      articleCategories = <ArticleCategories>[];
      json['articleCategories'].forEach((v) {
        articleCategories!.add(new ArticleCategories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.articles != null) {
      data['articles'] = this.articles!.map((v) => v.toJson()).toList();
    }
    if (this.articleCategories != null) {
      data['articleCategories'] =
          this.articleCategories!.map((v) => v.toJson()).toList();
    }
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

class ArticleCategories {
  String? title;
  String? createdAt;
  String? image;
  int? id;

  ArticleCategories({this.title, this.createdAt, this.image, this.id});

  ArticleCategories.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    createdAt = json['created_at'];
    image = json['image'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['created_at'] = this.createdAt;
    data['image'] = this.image;
    data['id'] = this.id;
    return data;
  }
}
