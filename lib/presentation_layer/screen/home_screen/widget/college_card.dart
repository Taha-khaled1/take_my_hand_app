import 'package:cached_network_image/cached_network_image.dart';
import 'package:take_hand/presentation_layer/resources/values_manager.dart';
import 'package:take_hand/presentation_layer/screen/track_screen/track_screen.dart';
import 'package:take_hand/presentation_layer/src/get_packge.dart';
import 'package:take_hand/presentation_layer/src/style_packge.dart';

class CollegeCard extends StatelessWidget {
  final String imageUrl;
  final String collegeName;

  const CollegeCard(
      {super.key, required this.imageUrl, required this.collegeName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => const TrackScreen());
      },
      child: ClayContainer(
        color: ColorManager.background,
        height: 200,
        width: 200,
        borderRadius: 15,
        spread: 1.5,
        depth: 20,
        child: Column(
          children: <Widget>[
            AppSizedBox.sizedBox_5,
            CachedNetworkImage(
              imageUrl: imageUrl,
              fit: BoxFit.contain,
              height: 130,
              width: 150,
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
            AppSizedBox.sizedBox_10,
            Text(
              collegeName,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            AppSizedBox.sizedBox_5,
          ],
        ),
      ),
    );
  }
}
  // Gradient Overlay (For better text visibility)
            // Container(
            //   decoration: BoxDecoration(
            //     gradient: LinearGradient(
            //       begin: Alignment.topCenter,
            //       end: Alignment.bottomCenter,
            //       colors: [
            //         Colors.transparent,
            //         Colors.transparent,
            //         Colors.black.withOpacity(0.7),
            //       ],
            //     ),
            //   ),
            // ),
            // College Name    // College Image