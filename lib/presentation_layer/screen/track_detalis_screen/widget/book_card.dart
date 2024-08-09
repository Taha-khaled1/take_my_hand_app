import 'package:fl_chart/fl_chart.dart';
import 'package:take_hand/presentation_layer/screen/home_screen/widget/custom_tag.dart';
import 'package:take_hand/presentation_layer/src/account_url.dart';
// import 'package:animated_text_kit/animated_text_kit.dart';

class BookCard extends StatelessWidget {
  const BookCard({
    super.key,
    required this.image,
    required this.name,
  });
  final String image, name;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: ClayContainer(
        width: 180,
        color: ColorManager.backgroundpersonalimage,
        borderRadius: 10,
        spread: 1,
        depth: 15,
        curveType: CurveType.convex,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Image.asset(
            image,
            height: 110,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

class UserInfoWidget extends StatelessWidget {
  final String userName;
  final String userSpecialty;
  final String userEvaluation;
  final String userImage;

  UserInfoWidget({
    required this.userName,
    required this.userSpecialty,
    required this.userEvaluation,
    required this.userImage,
  });

  @override
  Widget build(BuildContext context) {
    return ClayContainer(
      color: ColorManager.backgroundpersonalimage,
      width: 200,
      borderRadius: 15,
      spread: 1.5,
      depth: 15,
      curveType: CurveType.concave,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            Positioned(
              top: 0,
              right: 0,
              child: CustomTag(
                title: '5.0',
                color: Color(0xff164B51),
                colorText: Colors.white,
                widget: Icon(
                  Icons.star,
                  color: Colors.yellow,
                  size: 15,
                ),
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              child: Column(
                children: [
                  ClayContainer(
                    color: ColorManager.backgroundpersonalimage,
                    height: 32,
                    width: 32,
                    borderRadius: 8,
                    spread: 1,
                    curveType: CurveType.convex,
                    child: Image.asset("assets/images/youtube.png"),
                  ),
                  AppSizedBox.sizedBox_8,
                  ClayContainer(
                    color: ColorManager.backgroundpersonalimage,
                    height: 32,
                    width: 32,
                    borderRadius: 8,
                    spread: 1,
                    curveType: CurveType.convex,
                    child: Image.asset("assets/images/phone.png"),
                  ),
                  AppSizedBox.sizedBox_8,
                  ClayContainer(
                    color: ColorManager.backgroundpersonalimage,
                    height: 32,
                    width: 32,
                    borderRadius: 8,
                    spread: 1,
                    curveType: CurveType.convex,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Image.asset(
                        "assets/images/google-maps.png",
                        width: 25,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage(
                    "https://i.pinimg.com/736x/67/b4/96/67b49639339ccdadf672c78cc77a58b9.jpg",
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.verified, color: ColorManager.kPrimary3),
                    SizedBox(width: 5),
                    Text(
                      userName,
                      style: TextStyle(
                        fontFamily: FontConstants.fontFamily,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Text(
                  userSpecialty,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white70,
                    fontFamily: FontConstants.fontFamily,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
