import 'package:take_hand/presentation_layer/screen/home_screen/widget/custom_circle_image.dart';
import 'package:take_hand/presentation_layer/screen/home_screen/widget/custom_tag.dart';
import 'package:take_hand/presentation_layer/screen/university_college_screen/university_college_controller.dart';
import 'package:take_hand/presentation_layer/screen/university_detalis/university_detalis_screen.dart';
import 'package:take_hand/presentation_layer/src/account_url.dart';

class UniversityCollegeScreen extends GetView<UniversityCollegeController> {
  const UniversityCollegeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar("الشاشه الرئيسيه"),
      backgroundColor: ColorManager.background,
      body: InfoWidget(
        builder: (context, deviceInfo) {
          return ListView.builder(
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: ClayContainer(
                  color: ColorManager.backgroundpersonalimage,
                  depth: 15,
                  spread: 1.5,
                  width: deviceInfo.localWidth * 0.9,
                  // height: 150,
                  child: Padding(
                    padding: const EdgeInsets.all(7),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            CustomCircleImage(
                              radius: 35,
                              image:
                                  "https://wallpapers.com/images/featured/hd-a5u9zq0a0ymy2dug.jpg",
                            ),
                            AppSizedBox.sizedBox_w20,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "كلية الحاسبات و الذكاء الاصطناعي",
                                  style: MangeStyles().getSemiBoldStyle(
                                    color: ColorManager.white,
                                    fontSize: FontSize.s16,
                                  ),
                                ),
                                Text(
                                  "4 سنوات الدراسه",
                                  style: MangeStyles().getRegularStyle(
                                    color: ColorManager.kTextgray400,
                                    fontSize: FontSize.s16,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        AppSizedBox.sizedBox_10,
                        Text(
                          "التنسيق" +
                              " : " +
                              "في 2023 - 53% علمي علوم, 53% علمي رياضة",
                          style: MangeStyles().getRegularStyle(
                            color: ColorManager.kTextgreen,
                            fontSize: FontSize.s14,
                          ),
                        ),
                        AppSizedBox.sizedBox_10,
                        ReadMoreText(
                          text: controller.text,
                        ),
                        AppSizedBox.sizedBox_10,
                        Align(
                          alignment: AlignmentDirectional.topStart,
                          child: CustomTag(
                            horizontalPadding: 5,
                            borderRadius: 10,
                            width: 112,
                            height: 40,
                            title: "نظام الساعات معتمدة",
                            color: Colors.white10,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
