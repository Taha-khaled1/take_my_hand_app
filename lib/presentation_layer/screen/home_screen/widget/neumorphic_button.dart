import 'package:take_hand/presentation_layer/src/style_packge.dart';

class NeumorphicButton extends StatelessWidget {
  final VoidCallback onPressed;

  const NeumorphicButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          color: ColorManager.background,
          borderRadius: BorderRadius.circular(40),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              offset: const Offset(4.0, 4.0),
              blurRadius: 15.0,
              spreadRadius: 1.0,
            ),
            BoxShadow(
              color: Colors.grey[850]!,
              offset: const Offset(-4.0, -4.0),
              blurRadius: 15.0,
              spreadRadius: 1.0,
            ),
          ],
        ),
        child: Icon(
          Icons.play_arrow, // Replace with your desired icon or content
          color: Colors.grey[700],
          size: 40,
        ),
      ),
    );
  }
}
