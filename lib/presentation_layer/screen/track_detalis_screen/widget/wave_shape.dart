import 'package:take_hand/presentation_layer/src/style_packge.dart';

class WaveShape extends StatelessWidget {
  const WaveShape({super.key, required this.color});
  final Color color;
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: WaveClipper(),
      child: Container(
        width: 350,
        height: 150,
        color: color,
      ),
    );
  }
}

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    // Start from the top left corner
    path.lineTo(0, size.height * 0.5);

    // Draw the first curve
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.7,
        size.width * 0.5, size.height * 0.5);

    // Draw the second curve
    path.quadraticBezierTo(
        size.width * 0.75, size.height * 0.3, size.width, size.height * 0.5);

    // Draw the line to the bottom right corner
    path.lineTo(size.width, size.height);

    // Draw the line to the bottom left corner
    path.lineTo(0, size.height);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
