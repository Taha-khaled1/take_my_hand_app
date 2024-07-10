class ClassCentralModel {
  final String name;
  final String link;
  final String rating;
  final String reviewCount;
  final String picture;
  final String provider;
  final String category;
  final String creator;

  ClassCentralModel({
    required this.name,
    required this.link,
    required this.rating,
    required this.reviewCount,
    required this.picture,
    required this.provider,
    required this.category,
    required this.creator,
  });

  factory ClassCentralModel.fromMap(Map<String, String> data) {
    return ClassCentralModel(
      name: data['name'] ?? '',
      link: data['link'] ?? '',
      rating: data['rating'] ?? '',
      reviewCount: data['reviewCount'] ?? '',
      picture: data['picture'] ?? '',
      provider: data['provider'] ?? '',
      category: data['category'] ?? '',
      creator: data['creator'] ?? '',
    );
  }
}
