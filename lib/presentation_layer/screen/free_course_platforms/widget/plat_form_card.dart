import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';
import 'package:take_hand/presentation_layer/screen/free_course_platforms/course_platforms_controller.dart';
import 'package:take_hand/presentation_layer/src/style_packge.dart';

class PlatformCard extends StatelessWidget {
  final String platformName;
  final String description;
  final String imageUrl;
  final void Function()? onPressed;
  PlatformCard({
    required this.platformName,
    required this.description,
    required this.imageUrl,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CoursePlatformsController>(
      init: CoursePlatformsController(),
      builder: (_) {
        return GestureDetector(
          onTap: onPressed,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClayContainer(
              color: ColorManager.background,
              borderRadius: 20,
              depth: 20,
              spread: 2,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundColor: ColorManager.white,
                      radius: 35,
                      backgroundImage: CachedNetworkImageProvider(
                        imageUrl,
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            platformName,
                            style: TextStyle(
                              fontFamily: FontConstants.fontFamily,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Color(0xffB6C0C8),
                              shadows: [
                                Shadow(
                                  blurRadius: 8.0,
                                  color: Colors.grey.withOpacity(0.5),
                                  offset: Offset(2.0, 2.0),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            description,
                            style: MangeStyles().getRegularStyle(
                              color: ColorManager.kTextgray,
                              fontSize: FontSize.s16,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    // SizedBox(width: 16),
                    // CustomButton(
                    //   height: 40,
                    //   width: 100,
                    //   rectangel: 10,
                    //   depth: 0,
                    //   spread: 0,
                    //   backgroundColor: ColorManager.backgroundpersonalimage,
                    //   text: "exploer",
                    //   press: onPressed,
                    //   fontSize: FontSize.s14,
                    // ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
