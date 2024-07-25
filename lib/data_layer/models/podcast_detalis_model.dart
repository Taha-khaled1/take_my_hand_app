class PodcastDetalisModel {
  Data? data;
  String? message;
  int? statusCode;

  PodcastDetalisModel({this.data, this.message, this.statusCode});

  PodcastDetalisModel.fromJson(Map<String, dynamic> json) {
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
  Podcast? podcast;
  List<PodcastsTop>? podcastsTop;

  Data({this.podcast, this.podcastsTop});

  Data.fromJson(Map<String, dynamic> json) {
    podcast =
        json['podcast'] != null ? new Podcast.fromJson(json['podcast']) : null;
    if (json['podcastsTop'] != null) {
      podcastsTop = <PodcastsTop>[];
      json['podcastsTop'].forEach((v) {
        podcastsTop!.add(new PodcastsTop.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.podcast != null) {
      data['podcast'] = this.podcast!.toJson();
    }
    if (this.podcastsTop != null) {
      data['podcastsTop'] = this.podcastsTop!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Podcast {
  String? title;
  String? description;
  String? image;
  String? createdBy;
  int? id;
  int? articleCategoryId;
  String? youtubeUrl;
  int? views;
  String? createdAt;
  Category? category;

  Podcast(
      {this.title,
      this.description,
      this.image,
      this.createdBy,
      this.id,
      this.articleCategoryId,
      this.youtubeUrl,
      this.views,
      this.createdAt,
      this.category});

  Podcast.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    image = json['image'];
    createdBy = json['created_by'];
    id = json['id'];
    articleCategoryId = json['article_category_id'];
    youtubeUrl = json['youtube_url'];
    views = json['views'];
    createdAt = json['created_at'];
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['description'] = this.description;
    data['image'] = this.image;
    data['created_by'] = this.createdBy;
    data['id'] = this.id;
    data['article_category_id'] = this.articleCategoryId;
    data['youtube_url'] = this.youtubeUrl;
    data['views'] = this.views;
    data['created_at'] = this.createdAt;
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

class PodcastsTop {
  String? title;
  String? image;
  String? createdBy;
  int? id;
  int? articleCategoryId;
  String? youtubeUrl;
  int? views;
  String? createdAt;
  Category? category;

  PodcastsTop(
      {this.title,
      this.image,
      this.createdBy,
      this.id,
      this.articleCategoryId,
      this.youtubeUrl,
      this.views,
      this.createdAt,
      this.category});

  PodcastsTop.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    image = json['image'];
    createdBy = json['created_by'];
    id = json['id'];
    articleCategoryId = json['article_category_id'];
    youtubeUrl = json['youtube_url'];
    views = json['views'];
    createdAt = json['created_at'];
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['image'] = this.image;
    data['created_by'] = this.createdBy;
    data['id'] = this.id;
    data['article_category_id'] = this.articleCategoryId;
    data['youtube_url'] = this.youtubeUrl;
    data['views'] = this.views;
    data['created_at'] = this.createdAt;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    return data;
  }
}
