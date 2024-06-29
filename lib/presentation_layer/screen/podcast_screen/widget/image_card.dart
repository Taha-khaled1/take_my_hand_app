import 'package:glowy_borders/glowy_borders.dart';
import 'package:take_hand/presentation_layer/screen/home_screen/widget/custom_tag.dart';
import 'package:take_hand/presentation_layer/src/style_packge.dart';

List<ImageCard> imageList = [];

class ImageCard extends StatefulWidget {
  const ImageCard({super.key});

  @override
  _ImageCardState createState() => _ImageCardState();
}

class _ImageCardState extends State<ImageCard> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedGradientBorder(
          animationTime: 5,
          borderSize: 2.5,
          glowSize: 1,
          gradientColors: [
            Colors.cyan,
            // Colors.transparent,
            Colors.transparent,
            Colors.purple,
          ],
          animationProgress: 200,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          child: Container(
            height: 280,
            width: 230,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: const DecorationImage(
                image: NetworkImage(
                  "https://willcwood.scusd.edu/sites/main/files/imagecache/lightbox/main-images/camera_lense_0.jpeg",
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 10,
          left: 10,
          child: Image.asset(
            'assets/icons/youtube.png',
            width: 50,
            height: 50,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomTag(
            title: "تكنلوجيا",
            color: ColorManager.error,
            colorText: Colors.white,
          ),
        ),
      ],
    );
  }
}
