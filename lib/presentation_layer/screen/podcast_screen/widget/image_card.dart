import 'package:glowy_borders/glowy_borders.dart';
import 'package:take_hand/presentation_layer/screen/home_screen/widget/custom_tag.dart';
import 'package:take_hand/presentation_layer/src/style_packge.dart';

class ImageCard extends StatefulWidget {
  const ImageCard({
    super.key,
    required this.title,
    required this.image,
    required this.category,
  });
  final String title, image, category;
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
              image: DecorationImage(
                image: NetworkImage(
                  widget.image,
                ),
                fit: BoxFit.fill,
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
            title: widget.category,
            color: ColorManager.error,
            colorText: Colors.white,
          ),
        ),
      ],
    );
  }
}
