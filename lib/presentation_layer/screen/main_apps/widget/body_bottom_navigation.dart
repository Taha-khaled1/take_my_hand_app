import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:take_hand/presentation_layer/screen/main_apps/tab_app_controller.dart';
import 'package:take_hand/presentation_layer/src/style_packge.dart';

class BodybottomNavigationBar extends StatelessWidget {
  const BodybottomNavigationBar({
    super.key,
    required this.tabController,
  });

  final TabAppController tabController;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: ColorManager.background,
        boxShadow: [
          BoxShadow(
            color: ColorManager.black,
            spreadRadius: -5,
            blurRadius: 30,
            offset: Offset(0, 15),
          )
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
          child: GNav(
            rippleColor: Colors.white,
            gap: 8,
            activeColor: Colors.white,
            iconSize: 24,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            duration: const Duration(milliseconds: 400),
            tabBackgroundColor: ColorManager.kPrimary,
            color: Colors.blueAccent,
            tabs: [
              GButton(
                icon: LineIcons.home,
                text: AppStrings.home.tr,
              ),
              const GButton(
                icon: LineIcons.search,
                text: "الكليه",
              ),
              const GButton(
                icon: LineIcons.heart,
                text: "دورات مجانيه",
              ),
              GButton(
                icon: LineIcons.user,
                text: AppStrings.account.tr,
              ),
            ],
            selectedIndex: tabController.currentIndex,
            onTabChange: (index) {
              tabController.changeTabIndex(index);
            },
          ),
        ),
      ),
    );
  }
}
