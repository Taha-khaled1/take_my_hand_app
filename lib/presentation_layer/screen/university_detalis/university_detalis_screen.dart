import 'package:cached_network_image/cached_network_image.dart';
import 'package:take_hand/presentation_layer/components/appbar.dart';
import 'package:take_hand/presentation_layer/resources/routes_manager.dart';
import 'package:take_hand/presentation_layer/resources/values_manager.dart';
import 'package:take_hand/presentation_layer/screen/home_screen/widget/custom_circle_image.dart';
import 'package:take_hand/presentation_layer/screen/university_detalis/university_detalis_controller.dart';
import 'package:take_hand/presentation_layer/screen/university_detalis/widget/rank_card.dart';
import 'package:take_hand/presentation_layer/src/get_packge.dart';
import 'package:take_hand/presentation_layer/src/style_packge.dart';

class UniversityDetalisScreen extends GetView<UniversityDetalisController> {
  const UniversityDetalisScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar("الشاشه الرئيسيه"),
      backgroundColor: ColorManager.background,
      body: InfoWidget(
        builder: (context, deviceInfo) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 290,
                  width: deviceInfo.localWidth,
                  color: ColorManager.background,
                  child: Stack(
                    children: [
                      CachedNetworkImage(
                        imageUrl:
                            "https://img.freepik.com/free-photo/autumn-leaf-falling-revealing-intricate-leaf-vein-generated-by-ai_188544-9869.jpg?w=1380&t=st=1719253513~exp=1719254113~hmac=7a72da12a07c52f7621c128609c365d0acdadfaaee2e81bdc492793f74a2f02a",
                        height: 250,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      PositionedDirectional(
                        start: 5,
                        bottom: 3,
                        child: CustomCircleImage(
                          radius: 45,
                          image:
                              "https://wallpapers.com/images/featured/hd-a5u9zq0a0ymy2dug.jpg",
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
                        "جامعة النيل الدوليه",
                        style: MangeStyles().getSemiBoldStyle(
                          color: ColorManager.white,
                          fontSize: FontSize.s22,
                        ),
                      ),
                      AppSizedBox.sizedBox_10,
                      Text(
                        "تاسست في عام 1856",
                        style: MangeStyles().getRegularStyle(
                          color: ColorManager.kTextgray,
                          fontSize: FontSize.s14,
                        ),
                      ),
                      AppSizedBox.sizedBox_10,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RankCard(
                            image: "assets/icons/thunder.png",
                            rank: '365',
                            country: "مصر",
                            deviceInfo: deviceInfo,
                          ),
                          RankCard(
                            image: "assets/icons/world.png",
                            rank: '100',
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
                        text: controller.text,
                      ),
                      AppSizedBox.sizedBox_10,
                      CommunityCard(
                        deviceInfo: deviceInfo,
                        iconAsset: "assets/icons/college.png",
                        title: 'الكليات',
                        des:
                            "ستجد هنا جميع الكليات وتنسيقهم و المجموع و المواد وكل شئ",
                        onPressed: () {
                          Get.toNamed(Routes.universityCollegeScreen);
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
          );
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
