import 'package:cached_network_image/cached_network_image.dart';
import 'package:take_hand/presentation_layer/screen/home_screen/widget/carousel_slider_banner.dart';
import 'package:take_hand/presentation_layer/screen/home_screen/widget/custom_circle_image.dart';
import 'package:take_hand/presentation_layer/src/style_packge.dart';

class UniversityHeader extends StatelessWidget {
  const UniversityHeader({
    super.key,
    required this.image,
    this.images,
  });
  final String image;
  final List<String>? images;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSliderBanner(
          aspectRatio: 16 / 9,
          viewportFraction: 1,
          height: 200,
          items: images!.map((url) {
            return Container(
              height: 190,
              width: 270,
              // width: MediaQuery.of(context).size.width,
              // margin: EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                color: ColorManager.backgroundpersonalimage,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                image: DecorationImage(
                  image: CachedNetworkImageProvider(url),
                  fit: BoxFit.cover,
                ),
              ),
            );
          }).toList(),
        ),
        PositionedDirectional(
          start: 5,
          bottom: 3,
          child: CustomCircleImage(
            radius: 45,
            image: image,
          ),
        ),
      ],
    );
  }
}
