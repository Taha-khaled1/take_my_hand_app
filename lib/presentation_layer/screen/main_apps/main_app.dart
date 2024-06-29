import 'package:lottie/lottie.dart';
import 'package:take_hand/presentation_layer/resources/routes_manager.dart';
import 'package:take_hand/presentation_layer/screen/account_screen/account_screen.dart';
import 'package:take_hand/presentation_layer/screen/article_screen/article_screen.dart';
import 'package:take_hand/presentation_layer/screen/free_course_platforms/course_platforms_screen.dart';
import 'package:take_hand/presentation_layer/screen/main_apps/widget/body_bottom_navigation.dart';
import 'package:take_hand/presentation_layer/screen/home_screen/home_screen.dart';
import 'package:get/get.dart';
import 'package:take_hand/presentation_layer/screen/main_apps/tab_app_controller.dart';
import 'package:take_hand/presentation_layer/screen/podcast_screen/podcast_screen.dart';
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
