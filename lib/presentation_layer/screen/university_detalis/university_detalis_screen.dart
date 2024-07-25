import 'package:cached_network_image/cached_network_image.dart';
import 'package:take_hand/presentation_layer/components/appbar.dart';
import 'package:take_hand/presentation_layer/resources/routes_manager.dart';
import 'package:take_hand/presentation_layer/resources/values_manager.dart';
import 'package:take_hand/presentation_layer/screen/home_screen/widget/custom_circle_image.dart';
import 'package:take_hand/presentation_layer/screen/university_detalis/university_detalis_controller.dart';
import 'package:take_hand/presentation_layer/screen/university_detalis/widget/rank_card.dart';
import 'package:take_hand/presentation_layer/src/get_packge.dart';
import 'package:take_hand/presentation_layer/src/style_packge.dart';
import 'package:take_hand/presentation_layer/utils/helper_function.dart';
import 'package:take_hand/presentation_layer/utils/view_handlers/view_handlers.dart';

import '../home_screen/widget/carousel_slider_banner.dart';

class UniversityDetalisScreen extends GetView<UniversityDetalisController> {
  const UniversityDetalisScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar("الشاشه الرئيسيه"),
      backgroundColor: ColorManager.background,
      body: InfoWidget(
        builder: (context, deviceInfo) {
          return GetBuilder<UniversityDetalisController>(
              init: UniversityDetalisController(),
              builder: (_) {
                return HandlingDataView(
                  statusRequest: _.statusRequest,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 220,
                          width: deviceInfo.localWidth,
                          color: ColorManager.background,
                          child: Stack(
                            children: [
                              CarouselSliderBanner(
                                aspectRatio: 16 / 9,
                                viewportFraction: 1,
                                height: MediaQuery.of(context).size.height,
                                items: HelperFunction.StringTolist(_
                                            .universityDetalisModel
                                            ?.data
                                            ?.images! ??
                                        "")
                                    .map((url) {
                                  return Container(
                                    height: MediaQuery.of(context).size.height,
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                      color:
                                          ColorManager.backgroundpersonalimage,
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
                                  image:
                                      "${_.universityDetalisModel?.data?.logo}",
                                ),
                              ),
                            ],
                          ),
                        ),
                        AppSizedBox.sizedBox_10,
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "التقديم مغلق",
                                style: MangeStyles().getRegularStyle(
                                  color: const Color.fromARGB(255, 212, 63, 78),
                                  fontSize: FontSize.s16,
                                ),
                              ),
                              AppSizedBox.sizedBox_10,
                              Text(
                                HelperFunction.translate(
                                  _.universityDetalisModel?.data?.titleAr,
                                  _.universityDetalisModel?.data?.titleEn,
                                ),
                                style: MangeStyles().getSemiBoldStyle(
                                  color: ColorManager.white,
                                  fontSize: FontSize.s22,
                                ),
                              ),
                              AppSizedBox.sizedBox_10,
                              Text(
                                "تاسست في عام ${_.universityDetalisModel?.data?.established}",
                                style: MangeStyles().getRegularStyle(
                                  color: ColorManager.kTextgray,
                                  fontSize: FontSize.s14,
                                ),
                              ),
                              AppSizedBox.sizedBox_10,
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  RankCard(
                                    image: "assets/icons/thunder.png",
                                    rank:
                                        '${_.universityDetalisModel?.data?.locally}',
                                    country: "مصر",
                                    deviceInfo: deviceInfo,
                                  ),
                                  RankCard(
                                    image: "assets/icons/world.png",
                                    rank:
                                        '${_.universityDetalisModel?.data?.globally}',
                                    country: "عالم",
                                    deviceInfo: deviceInfo,
                                  ),
                                ],
                              ),
                              AppSizedBox.sizedBox_10,
                              Text(
                                "نبذه تعريفيه عن " + "الجامعه",
                                style: MangeStyles().getBoldStyle(
                                  color: ColorManager.white,
                                  fontSize: FontSize.s15,
                                ),
                              ),
                              AppSizedBox.sizedBox_10,
                              ReadMoreText(
                                text: HelperFunction.translate(
                                  _.universityDetalisModel?.data?.descriptionAr,
                                  _.universityDetalisModel?.data?.descriptionEn,
                                ),
                              ),
                              AppSizedBox.sizedBox_10,
                              CommunityCard(
                                deviceInfo: deviceInfo,
                                iconAsset: "assets/icons/college.png",
                                title: 'الكليات',
                                des:
                                    "ستجد هنا جميع الكليات وتنسيقهم و المجموع و المواد وكل شئ",
                                onPressed: () {
                                  Get.toNamed(Routes.universityCollegeScreen,
                                      arguments: {
                                        "id": _.universityDetalisModel?.data?.id
                                      });
                                },
                                color: Colors.blueGrey.withOpacity(0.1),
                              ),
                              AppSizedBox.sizedBox_10,
                              CommunityCard(
                                deviceInfo: deviceInfo,
                                iconAsset: "assets/icons/social-media.png",
                                title: 'المجتمع',
                                des:
                                    "ستجد هنا جميع الكليات وتنسيقهم و المجموع و المواد وكل شئ",
                                onPressed: () {},
                                color: Colors.indigoAccent.withOpacity(0.1),
                              ),
                              AppSizedBox.sizedBox_10,
                              CommunityCard(
                                deviceInfo: deviceInfo,
                                iconAsset: "assets/icons/phone.png",
                                title: 'التواصل',
                                des:
                                    "ستجد هنا جميع الكليات وتنسيقهم و المجموع و المواد وكل شئ",
                                onPressed: () {},
                                color: Colors.blue.withOpacity(0.1),
                              ),
                            ],
                          ),
                        ),
                        AppSizedBox.sizedBox_20,
                      ],
                    ),
                  ),
                );
              });
        },
      ),
    );
  }
}

class ReadMoreText extends StatefulWidget {
  const ReadMoreText({
    super.key,
    required this.text,
  });
  final String text;

  @override
  State<ReadMoreText> createState() => _ReadMoreTextState();
}

class _ReadMoreTextState extends State<ReadMoreText> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          isExpanded
              ? widget.text
              : widget.text.length > 80
                  ? "${widget.text.substring(0, 80)}..."
                  : widget.text,
          style: MangeStyles().getRegularStyle(
            color: ColorManager.kTextgray,
            fontSize: FontSize.s14,
          ),
        ),
        if (widget.text.length > 80)
          GestureDetector(
            onTap: () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
            child: Text(
              isExpanded ? 'اقرأ أقل' : 'اقرأ المزيد',
              style: MangeStyles().getRegularStyle(
                color: ColorManager.kPrimary,
                fontSize: FontSize.s14,
              ),
            ),
          ),
      ],
    );
  }
}

class CommunityCard extends StatelessWidget {
  final Color color;
  final String iconAsset, des;
  final String title;
  final VoidCallback onPressed;
  final DeviceInfo deviceInfo;
  const CommunityCard({
    Key? key,
    required this.deviceInfo,
    required this.iconAsset,
    required this.title,
    required this.onPressed,
    required this.color,
    required this.des,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClayContainer(
      color: ColorManager.backgroundpersonalimage,
      depth: 10,
      spread: 1,
      width: deviceInfo.localWidth * 0.9,
      height: 80,
      borderRadius: 10,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: color,
              radius: 30,
              child: Image.asset(
                iconAsset,
                width: 30,
                height: 30,
              ),
            ),
            AppSizedBox.sizedBox_w10,
            AppSizedBox.sizedBox_w10,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: MangeStyles().getRegularStyle(
                    color: ColorManager.white,
                    fontSize: FontSize.s20,
                  ),
                ),
                SizedBox(
                  width: 180,
                  child: Text(
                    des,
                    style: MangeStyles().getRegularStyle(
                      color: ColorManager.kTextgray,
                      fontSize: FontSize.s12,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(child: SizedBox()),
            IconButton(
              onPressed: onPressed,
              icon: Icon(Icons.arrow_forward_ios),
            ),
          ],
        ),
      ),
    );
  }
}
