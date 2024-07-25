import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:take_hand/presentation_layer/resources/routes_manager.dart';
import 'package:take_hand/presentation_layer/resources/values_manager.dart';
import 'package:take_hand/presentation_layer/screen/home_screen/widget/university_header.dart';
import 'package:take_hand/presentation_layer/src/get_packge.dart';
import 'package:take_hand/presentation_layer/src/style_packge.dart';
import 'package:take_hand/presentation_layer/utils/helper_function.dart';

class UniversityCard extends StatelessWidget {
  //
  const UniversityCard({
    super.key,
    this.imageUrl,
    this.titel,
    this.reate,
    this.number_of_college,
    this.location,
    this.images,
    required this.id,
  });
  final String? imageUrl, titel, reate, number_of_college, location;
  final List<String>? images;
  final int id;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        HelperFunction.printCyanText("==================> ${id}");
        Get.toNamed(Routes.universityDetalisScreen, arguments: {"id": id});
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClayContainer(
          width: 265,
          color: ColorManager.background,
          borderRadius: 20,
          depth: 10,
          spread: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              UniversityHeader(
                image: HelperFunction.imageNetworkCheck(imageUrl, isUrl: true),
                images: images,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      titel ?? "",
                      style: MangeStyles().getRegularStyle(
                        color: ColorManager.white,
                        fontSize: FontSize.s16,
                      ),
                    ),
                    AppSizedBox.sizedBox_5,
                    Row(
                      children: [
                        RatingBar.builder(
                          initialRating: 3,
                          itemSize: 22,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          ignoreGestures: true,
                          itemCount: 5,
                          itemPadding: EdgeInsets.symmetric(horizontal: 0),
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {
                            print(rating);
                          },
                        ),
                        const SizedBox(
                          height: 17,
                          child: VerticalDivider(
                            thickness: 2,
                            color: ColorManager.kPrimary,
                          ),
                        ),
                        Text(
                          "الكليات ($number_of_college)",
                          style: MangeStyles().getRegularStyle(
                            color: ColorManager.white,
                            fontSize: FontSize.s16,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Image.asset(
                          "assets/icons/location.png",
                          height: 20,
                        ),
                        // AppSizedBox.sizedBox_w5,
                        Text(
                          HelperFunction.subString(location ?? "", 37),
                          style: MangeStyles().getRegularStyle(
                            color: ColorManager.white,
                            fontSize: FontSize.s12,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
