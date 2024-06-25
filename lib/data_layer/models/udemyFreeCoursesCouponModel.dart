class UdemyFreeCoursesCouponModel {
  List<Results>? results;

  UdemyFreeCoursesCouponModel({this.results});

  UdemyFreeCoursesCouponModel.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = <Results>[];
      print("CCCCCCCCCCCCCCCCCCCCCCCCCCCCC");
      json['results'].forEach((v) {
        results!.add(new Results.fromJson(v));
        print("OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO");
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    if (this.results != null) {
      data['results'] = this.results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Results {
  String? category;
  String? catslug;
  String? date;

  int? id;
  String? image;
  String? isexpired;
  String? language;

  String? name;
  String? price;
  String? rating;
  String? saleEnd;
  String? salePrice;
  String? saleStart;
  String? shoerDescription;

  String? store;

  String? subcategory;
  String? subcatslug;
  String? type;
  String? url;

  Results({
    this.category,
    this.catslug,
    this.date,
    this.id,
    this.image,
    this.isexpired,
    this.language,
    this.name,
    this.price,
    this.rating,
    this.saleEnd,
    this.salePrice,
    this.saleStart,
    this.shoerDescription,
    this.store,
    this.subcategory,
    this.subcatslug,
    this.type,
    this.url,
  });

  Results.fromJson(Map<String, dynamic> json) {
    category = json['category'];
    catslug = json['catslug'];
    date = json['date'];

    id = json['id'];
    image = json['image'].toString();
    isexpired = json['isexpired'].toString();
    language = json['language'].toString();
    name = json['name'].toString();
    price = json['price'].toString();
    rating = json['rating'].toString();
    saleEnd = json['sale_end'].toString();
    salePrice = json['sale_price'].toString();
    saleStart = json['sale_start'].toString();
    shoerDescription = json['shoer_description'].toString();
    store = json['store'].toString();

    subcategory = json['subcategory'].toString();
    subcatslug = json['subcatslug'].toString();
    type = json['type'].toString();
    url = json['url'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category'] = this.category;
    data['catslug'] = this.catslug;
    data['date'] = this.date;
    data['id'] = this.id;
    data['image'] = this.image;
    data['isexpired'] = this.isexpired;
    data['language'] = this.language;

    data['name'] = this.name;
    data['price'] = this.price;
    data['rating'] = this.rating;
    data['sale_end'] = this.saleEnd;
    data['sale_price'] = this.salePrice;
    data['sale_start'] = this.saleStart;
    data['shoer_description'] = this.shoerDescription;

    data['store'] = this.store;
    data['subcategory'] = this.subcategory;
    data['subcatslug'] = this.subcatslug;
    data['type'] = this.type;
    data['url'] = this.url;

    return data;
  }
}
