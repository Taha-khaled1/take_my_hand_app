class ArticleDetalisModel {
  Data? data;
  String? message;
  int? statusCode;

  ArticleDetalisModel({this.data, this.message, this.statusCode});

  ArticleDetalisModel.fromJson(Map<String, dynamic> json) {
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
  Article? article;
  List<Articles>? articles;

  Data({this.article, this.articles});

  Data.fromJson(Map<String, dynamic> json) {
    article =
        json['article'] != null ? new Article.fromJson(json['article']) : null;
    if (json['articles'] != null) {
      articles = <Articles>[];
      json['articles'].forEach((v) {
        articles!.add(new Articles.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.article != null) {
      data['article'] = this.article!.toJson();
    }
    if (this.articles != null) {
      data['articles'] = this.articles!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Article {
  String? title;
  String? description;
  String? createdAt;
  String? image;
  String? createdBy;
  int? id;
  int? articleCategoryId;

  Article(
      {this.title,
      this.description,
      this.createdAt,
      this.image,
      this.createdBy,
      this.id,
      this.articleCategoryId});

  Article.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    createdAt = json['created_at'];
    image = json['image'];
    createdBy = json['created_by'];
    id = json['id'];
    articleCategoryId = json['article_category_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['description'] = this.description;
    data['created_at'] = this.createdAt;
    data['image'] = this.image;
    data['created_by'] = this.createdBy;
    data['id'] = this.id;
    data['article_category_id'] = this.articleCategoryId;
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
