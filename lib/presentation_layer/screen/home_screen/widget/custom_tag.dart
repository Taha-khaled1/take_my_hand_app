import 'package:take_hand/presentation_layer/src/style_packge.dart';

class CustomTag extends StatelessWidget {
  const CustomTag({
    super.key,
    required this.title,
    required this.color,
    this.width,
    this.height,
    this.horizontalPadding,
    this.borderRadius,
    this.colorText,
  });
  final String title;
  final double? width, height, horizontalPadding, borderRadius;
  final Color? color, colorText;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding ?? 10,
        vertical: 5,
      ),
      // alignment: Alignment.center,
      // width: width ?? 50,
      // height: height ?? 25,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(borderRadius ?? 6),
      ),
      child: Text(
        title,
        style: MangeStyles().getSemiBoldStyle(
          color: colorText ?? Color(0xffFFFFFF),
          fontSize: 12,
        ),
      ),
    );
  }
}
