import 'package:cached_network_image/cached_network_image.dart';
import 'package:take_hand/presentation_layer/screen/home_screen/home_controller.dart';
import 'package:take_hand/presentation_layer/screen/home_screen/widget/carousel_slider_banner.dart';
import 'package:take_hand/presentation_layer/screen/home_screen/widget/custom_circle_image.dart';
import 'package:take_hand/presentation_layer/src/get_packge.dart';
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
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (_) {
          return Stack(
            children: [
              CarouselSliderBanner(
                carouselController: _.carouselController,
                aspectRatio: 16 / 9,
                viewportFraction: 1,
                height: 200,
                autoPlay: false,
                callbackFunction: (index, reason) {
                  _.current = index;
                  _.update();
                },
                items: images!.map((url) {
                  return Container(
                    height: 190,
                    width: 270,
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
              PositionedDirectional(
                end: 100,
                bottom: 3,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: images!.asMap().entries.map((entry) {
                    return GestureDetector(
                      onTap: () {
                        _.carouselController.animateToPage(entry.key);
                        _.update();
                      },
                      child: Container(
                        width: 8.0,
                        height: 8.0,
                        margin: EdgeInsets.symmetric(
                          vertical: 5.0,
                          horizontal: 4.0,
                        ),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: ColorManager.background
                              .withOpacity(_.current == entry.key ? 1 : 0.4),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          );
        });
  }
}
