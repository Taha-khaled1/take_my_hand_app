import 'package:get/get.dart';
import 'package:take_hand/presentation_layer/resources/routes_manager.dart';
import 'package:take_hand/presentation_layer/resources/values_manager.dart';
import 'package:take_hand/presentation_layer/screen/home_screen/widget/custom_tag.dart';
import 'package:take_hand/presentation_layer/src/style_packge.dart';
import 'package:take_hand/presentation_layer/utils/helper_function.dart';

class ArticleCard extends StatelessWidget {
  final String imageUrl;
  final String title;

  final String date;
  final int readTime;

  ArticleCard({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.date,
    required this.readTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InfoWidget(
      builder: (context, deviceInfo) {
        return GestureDetector(
          onTap: () {
            Get.toNamed(Routes.articleDetalis);
          },
          child: Padding(
            padding: const EdgeInsets.only(bottom: 2.5, top: 2.5),
            child: ClayContainer(
              color: ColorManager.background,
              // height: 200,
              width: 245,
              borderRadius: 15,
              spread: 1.5,
              depth: 15,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        // width: deviceInfo.localWidth * 0.9,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(7),
                          child: Image.asset(
                            imageUrl,
                            width: double.infinity,
                            height:
                                170, // Adjust the height as per your layout needs
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: CustomTag(
                          horizontalPadding: 10,
                          width: null,
                          title: "برمجه",
                          colorText: ColorManager.white,
                          color: Colors.white.withOpacity(0.1),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          HelperFunction.subString(title, 65),
                          style: MangeStyles().getRegularStyle(
                            color: ColorManager.white,
                            fontSize: FontSize.s16,
                          ),
                        ),
                        AppSizedBox.sizedBox_5,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('$date - ${readTime} Mins read',
                                style: TextStyle(
                                    fontSize: 10, color: Colors.grey)),
                            Row(
                              children: [
                                Icon(Icons.favorite_border, size: 20),
                                SizedBox(width: 10),
                                Icon(Icons.more_vert, size: 20),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  AppSizedBox.sizedBox_10,
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
