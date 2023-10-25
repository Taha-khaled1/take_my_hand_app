import 'package:cached_network_image/cached_network_image.dart';
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
        child: Stack(
          children: <Widget>[
            // College Image
            ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            // Gradient Overlay (For better text visibility)
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.transparent,
                    Colors.black.withOpacity(0.7),
                  ],
                ),
              ),
            ),
            // College Name
            Positioned(
              right: 10,
              bottom: 10,
              child: Text(
                collegeName,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
