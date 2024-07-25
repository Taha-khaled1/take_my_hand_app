import 'package:take_hand/presentation_layer/screen/home_screen/widget/custom_circle_image.dart';
import 'package:take_hand/presentation_layer/screen/home_screen/widget/custom_tag.dart';
import 'package:take_hand/presentation_layer/screen/university_college_screen/university_college_controller.dart';
import 'package:take_hand/presentation_layer/screen/university_detalis/university_detalis_screen.dart';
import 'package:take_hand/presentation_layer/src/account_url.dart';
import 'package:take_hand/presentation_layer/utils/helper_function.dart';
import 'package:take_hand/presentation_layer/utils/view_handlers/view_handlers.dart';

class UniversityCollegeScreen extends GetView<UniversityCollegeController> {
  const UniversityCollegeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar("الشاشه الرئيسيه"),
      backgroundColor: ColorManager.background,
      body: InfoWidget(
        builder: (context, deviceInfo) {
          return GetBuilder<UniversityCollegeController>(
            init: UniversityCollegeController(),
            builder: (_) {
              return HandlingDataView(
                statusRequest: _.statusRequest,
                child: ListView.builder(
                  itemCount: _.collegeModel?.data?.colleges?.length,
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
                                    image: _.collegeModel?.data?.logo,
                                  ),
                                  AppSizedBox.sizedBox_w20,
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        HelperFunction.translate(
                                          _.collegeModel?.data?.colleges?[index]
                                              .titleAr,
                                          _.collegeModel?.data?.colleges?[index]
                                              .titleEn,
                                        ),
                                        style: MangeStyles().getSemiBoldStyle(
                                          color: ColorManager.white,
                                          fontSize: FontSize.s16,
                                        ),
                                      ),
                                      Text(
                                        "${_.collegeModel?.data?.colleges?[index].totalYears} سنوات الدراسه",
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
                                    HelperFunction.translate(
                                      _.collegeModel?.data?.colleges?[index]
                                          .lastYearAr,
                                      _.collegeModel?.data?.colleges?[index]
                                          .lastYearEn,
                                    ), // "في 2023 - 53% علمي علوم, 53% علمي رياضة",
                                style: MangeStyles().getRegularStyle(
                                  color: ColorManager.kTextgreen,
                                  fontSize: FontSize.s14,
                                ),
                              ),
                              AppSizedBox.sizedBox_10,
                              ReadMoreText(
                                text: HelperFunction.translate(
                                  _.collegeModel?.data?.colleges?[index]
                                      .descriptionAr,
                                  _.collegeModel?.data?.colleges?[index]
                                      .descriptionEn,
                                ),
                              ),
                              AppSizedBox.sizedBox_10,
                              Align(
                                alignment: AlignmentDirectional.topStart,
                                child: CustomTag(
                                  horizontalPadding: 7,
                                  borderRadius: 10,
                                  width: 112,
                                  height: 40,
                                  title: _.collegeModel?.data?.colleges?[index]
                                              .isCredits ==
                                          1
                                      ? "نظام ساعات معتمده"
                                      : "نظام ترمات",
                                  color: Colors.white10,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
