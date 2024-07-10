import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:lottie/lottie.dart';
import 'package:take_hand/presentation_layer/resources/routes_manager.dart';
import 'package:take_hand/presentation_layer/resources/values_manager.dart';
import 'package:take_hand/presentation_layer/screen/account_screen/account_screen.dart';
import 'package:take_hand/presentation_layer/screen/account_screen/widget/customListtile.dart';
import 'package:take_hand/presentation_layer/screen/article_screen/article_screen.dart';
import 'package:take_hand/presentation_layer/screen/free_course_platforms/course_platforms_screen.dart';
import 'package:take_hand/presentation_layer/screen/home_screen/widget/custom_circle_image.dart';
import 'package:take_hand/presentation_layer/screen/main_apps/widget/body_bottom_navigation.dart';
import 'package:take_hand/presentation_layer/screen/home_screen/home_screen.dart';
import 'package:get/get.dart';
import 'package:take_hand/presentation_layer/screen/main_apps/tab_app_controller.dart';
import 'package:take_hand/presentation_layer/screen/podcast_screen/podcast_screen.dart';
import 'package:take_hand/presentation_layer/screen/share_screen/share_screen.dart';
import 'package:take_hand/presentation_layer/src/style_packge.dart';
import 'package:take_hand/presentation_layer/utils/helper_function.dart';

class NavBarHome extends StatefulWidget {
  const NavBarHome({super.key});

  @override
  _NavBarHomeState createState() => _NavBarHomeState();
}

class _NavBarHomeState extends State<NavBarHome> with WidgetsBindingObserver {
  final TabAppController tabController = Get.put(TabAppController());
  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    BodcastScreen(),
    CoursePlatformsScreen(),
    ArticleScreen(),
    AccountScreen(),
  ];
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

//Free course platforms
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Directionality(
        textDirection: TextDirection.rtl,
        child: FloatingActionButton.extended(
          elevation: 0,
          extendedPadding: EdgeInsets.all(0),
          onPressed: () {
            Get.toNamed(Routes.chatbotScreen);
          },
          backgroundColor: Colors.transparent,
          label: Transform.translate(
            offset: Offset(-45, -10),
            child: Lottie.asset(
              alignment: Alignment.centerLeft,
              "assets/json/chatbot.json",
              fit: BoxFit.cover,
              width: 80,
              height: 150,
            ),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: GetBuilder<TabAppController>(
        builder: (_) => ZoomDrawer(
          menuScreenOverlayColor: Colors.transparent,
          menuBackgroundColor: ColorManager.background,
          controller: _.zoomDrawerController,
          menuScreen: MenuScreen(),
          mainScreen: _widgetOptions.elementAt(tabController.currentIndex),
          borderRadius: 24.0,
          showShadow: true,
          angle: -03.0, //-03.0,
          drawerShadowsBackgroundColor: Colors.transparent,
          slideWidth: MediaQuery.of(context).size.width * 0.65,
          mainScreenTapClose: true,
          closeCurve: Curves.easeInOut,
          openCurve: Curves.easeInOut,
          duration: const Duration(milliseconds: 350),
          reverseDuration: const Duration(milliseconds: 350),
          menuScreenWidth: double.infinity,
          mainScreenScale: 0.09,
          clipMainScreen: true,
          isRtl: true,
        ),
      ),
      bottomNavigationBar:
          BodybottomNavigationBar(tabController: tabController),
    );
  }
}

class MenuScreen extends GetView<TabAppController> {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClayContainer(
        color: ColorManager.background,
        borderRadius: 20,
        depth: 20,
        spread: 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppSizedBox.sizedBox_40,
            AppSizedBox.sizedBox_40,
            Padding(
              padding: const EdgeInsets.only(bottom: 10, top: 10, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      CustomCircleImage(
                        radius: 25,
                        image: HelperFunction.imageNetworkCheck(''),
                      ),
                      AppSizedBox.sizedBox_w10,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "طه خالد",
                            style: MangeStyles().getSemiBoldStyle(
                              color: ColorManager.white,
                              fontSize: FontSize.s16,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            "مطور البرمجة",
                            style: MangeStyles().getRegularStyle(
                              color: ColorManager.kTextgray,
                              fontSize: FontSize.s14,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ],
                  ),
                  AppSizedBox.sizedBox_10,
                ],
              ),
            ),
            CustomListtile(
              widget: const Icon(Icons.share, color: ColorManager.white),
              titel: AppStrings.share_app.tr,
              onTap: () {
                Get.to(() => const ShareAppScreen());
              },
            ),
            CustomListtile(
              widget: const Icon(Icons.share, color: ColorManager.white),
              titel: AppStrings.share_app.tr,
              onTap: () {
                Get.to(() => const ShareAppScreen());
              },
            ),
            CustomListtile(
              widget: const Icon(Icons.share, color: ColorManager.white),
              titel: AppStrings.share_app.tr,
              onTap: () {
                Get.to(() => const ShareAppScreen());
              },
            ),
            CustomListtile(
              widget: const Icon(Icons.share, color: ColorManager.white),
              titel: AppStrings.share_app.tr,
              onTap: () {
                Get.to(() => const ShareAppScreen());
              },
            ),
            CustomListtile(
              widget: const Icon(Icons.share, color: ColorManager.white),
              titel: AppStrings.share_app.tr,
              onTap: () {
                Get.to(() => const ShareAppScreen());
              },
            ),
          ],
        ),
      ),
    );
  }
}
