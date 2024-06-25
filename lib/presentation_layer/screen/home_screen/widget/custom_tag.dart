import 'package:take_hand/presentation_layer/src/style_packge.dart';

class CustomTag extends StatelessWidget {
  const CustomTag({
    super.key,
    required this.title,
    required this.color,
  });
  final String title;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 50,
      height: 25,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        title,
        style: MangeStyles().getSemiBoldStyle(
          color: Color(0xffFFFFFF),
          fontSize: 12,
        ),
      ),
    );
  }
}
