import 'package:cached_network_image/cached_network_image.dart';
import 'package:take_hand/presentation_layer/resources/routes_manager.dart';
import 'package:take_hand/presentation_layer/screen/home_screen/widget/custom_tag.dart';
import 'package:take_hand/presentation_layer/screen/podcast_screen/widget/custom_lottie_animation.dart';
import 'package:take_hand/presentation_layer/src/get_packge.dart';
import 'package:take_hand/presentation_layer/src/style_packge.dart';

class PodcastCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String date;
  final String creator;
  final String platformLogo;

  const PodcastCard({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.date,
    required this.creator,
    required this.platformLogo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
      child: ClayContainer(
        color: ColorManager.background,
        borderRadius: 15,
        spread: 0,
        depth: 0,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(10),
            onTap: () {
              Get.toNamed(Routes.podcastDetalis);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: CachedNetworkImage(
                          imageUrl: imageUrl,
                          height: 200,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        top: 0,
                        bottom: 0,
                        right: 0,
                        left: 0,
                        child: CustomLottieAnimation(),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomTag(
                          title: "تكنلوجيا",
                          color: ColorManager.error,
                          colorText: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    title,
                    style: MangeStyles().getSemiBoldStyle(
                      color: Colors.white,
                      fontSize: FontSize.s17,
                    ),
                  ),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'By $creator',
                        style: MangeStyles().getSemiBoldStyle(
                          color: ColorManager.kTextgray400,
                          fontSize: FontSize.s14,
                        ),
                      ),
                      Image.asset(
                        platformLogo,
                        width: 35,
                        height: 35,
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: Text(
                      date,
                      style: MangeStyles().getRegularStyle(
                        color: ColorManager.kTextgray,
                        fontSize: FontSize.s14,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
