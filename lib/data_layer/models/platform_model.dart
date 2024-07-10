import '../../presentation_layer/src/style_packge.dart';

class PlatformModel {
  final String webName;
  final String platformName;
  final String description;
  final String imageUrl;
  final String provider;
  final VoidCallback? tap;
  PlatformModel({
    required this.webName,
    required this.platformName,
    required this.description,
    required this.imageUrl,
    required this.provider,
    this.tap,
  });
}
