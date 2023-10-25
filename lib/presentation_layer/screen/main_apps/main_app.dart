// ignore_for_file: library_private_types_in_public_api

import 'package:take_hand/presentation_layer/screen/account_screen/account_screen.dart';
import 'package:take_hand/presentation_layer/screen/college_screen/college_screen.dart';
import 'package:take_hand/presentation_layer/screen/favorite_screen/favorite_screen.dart';
import 'package:take_hand/presentation_layer/screen/main_apps/widget/body_bottom_navigation.dart';
import 'package:take_hand/presentation_layer/screen/home_screen/home_screen.dart';
import 'package:get/get.dart';
import 'package:take_hand/presentation_layer/screen/main_apps/tab_app_controller.dart';
import 'package:take_hand/presentation_layer/src/style_packge.dart';

class NavBarHome extends StatefulWidget {
  const NavBarHome({super.key});

  @override
  _NavBarHomeState createState() => _NavBarHomeState();
}

class _NavBarHomeState extends State<NavBarHome> with WidgetsBindingObserver {
  final TabAppController tabController = Get.put(TabAppController());
  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    CollegeScreen(),
    FavoriteScreen(),
    AccountScreen(),
  ];
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GetBuilder<TabAppController>(
        init: TabAppController(),
        initState: (_) {},
        builder: (_) {
          return Center(
            child: _widgetOptions.elementAt(tabController.currentIndex),
          );
        },
      ),
      bottomNavigationBar:
          BodybottomNavigationBar(tabController: tabController),
    );
  }
}
