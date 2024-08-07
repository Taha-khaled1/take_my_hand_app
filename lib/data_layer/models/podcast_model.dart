class BodcastModel {
  Data? data;
  String? message;
  int? statusCode;

  BodcastModel({this.data, this.message, this.statusCode});

  BodcastModel.fromJson(Map<String, dynamic> json) {
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
  Podcasts? podcasts;
  List<PodcastsTop>? podcastsTop;

  Data({this.podcasts, this.podcastsTop});

  Data.fromJson(Map<String, dynamic> json) {
    podcasts = json['podcasts'] != null
        ? new Podcasts.fromJson(json['podcasts'])
        : null;
    if (json['podcastsTop'] != null) {
      podcastsTop = <PodcastsTop>[];
      json['podcastsTop'].forEach((v) {
        podcastsTop!.add(new PodcastsTop.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.podcasts != null) {
      data['podcasts'] = this.podcasts!.toJson();
    }
    if (this.podcastsTop != null) {
      data['podcastsTop'] = this.podcastsTop!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Podcasts {
  int? currentPage;
  List<DataPodcasts>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<Links>? links;
  String? nextPageUrl;
  String? path;
  int? perPage;
  String? prevPageUrl;
  int? to;
  int? total;

  Podcasts(
      {this.currentPage,
      this.data,
      this.firstPageUrl,
      this.from,
      this.lastPage,
      this.lastPageUrl,
      this.links,
      this.nextPageUrl,
      this.path,
      this.perPage,
      this.prevPageUrl,
      this.to,
      this.total});

  Podcasts.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = <DataPodcasts>[];
      json['data'].forEach((v) {
        data!.add(new DataPodcasts.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    if (json['links'] != null) {
      links = <Links>[];
      json['links'].forEach((v) {
        links!.add(new Links.fromJson(v));
      });
    }
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current_page'] = this.currentPage;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['first_page_url'] = this.firstPageUrl;
    data['from'] = this.from;
    data['last_page'] = this.lastPage;
    data['last_page_url'] = this.lastPageUrl;
    if (this.links != null) {
      data['links'] = this.links!.map((v) => v.toJson()).toList();
    }
    data['next_page_url'] = this.nextPageUrl;
    data['path'] = this.path;
    data['per_page'] = this.perPage;
    data['prev_page_url'] = this.prevPageUrl;
    data['to'] = this.to;
    data['total'] = this.total;
    return data;
  }
}

class DataPodcasts {
  String? title;
  String? image;
  String? createdBy;
  int? id;
  int? articleCategoryId;
  String? youtubeUrl;
  int? views;
  String? createdAt;
  Category? category;

  DataPodcasts(
      {this.title,
      this.image,
      this.createdBy,
      this.id,
      this.articleCategoryId,
      this.youtubeUrl,
      this.views,
      this.createdAt,
      this.category});

  DataPodcasts.fromJson(Map<String, dynamic> json) {
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

class Links {
  String? url;
  String? label;
  bool? active;

  Links({this.url, this.label, this.active});

  Links.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    label = json['label'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['label'] = this.label;
    data['active'] = this.active;
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
  String? imagek;

  PodcastsTop(
      {this.title,
      this.image,
      this.createdBy,
      this.id,
      this.articleCategoryId,
      this.youtubeUrl,
      this.views,
      this.createdAt,
      this.category,
      this.imagek});

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
    imagek = json['imagek'];
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
    data['imagek'] = this.imagek;
    return data;
  }
}
