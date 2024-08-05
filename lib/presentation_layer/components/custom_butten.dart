import 'package:take_hand/presentation_layer/src/style_packge.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.width,
    this.height,
    required this.backgroundColor,
    required this.text,
    required this.press,
    this.rectangel,
    this.colorText,
    this.colorborder,
    this.sideIs,
    this.fontSize,
    this.spread,
    this.depth,
  });

  final Color backgroundColor;
  final String text;
  final double? width, height;
  final void Function()? press;
  final double? rectangel;
  final Color? colorText;
  final Color? colorborder;
  final BorderSide? sideIs;
  final double? fontSize, spread;
  final int? depth;
  @override
  Widget build(BuildContext context) {
    return InfoWidget(
      builder: (context, deviceInfo) {
        return ClayContainer(
          width: width ?? HelperView.widthForTextField(deviceInfo),
          height: height ?? 55,
          spread: spread ?? 3,
          depth: depth ?? 15,
          color: ColorManager.background,
          borderRadius: rectangel ?? 12,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.all(0),
              backgroundColor: (backgroundColor),
              shape: RoundedRectangleBorder(
                side: sideIs ?? BorderSide.none,
                borderRadius: BorderRadius.circular(rectangel ?? 12),
              ),
            ),
            onPressed: press,
            child: Text(
              text,
              style: MangeStyles().getSemiBoldStyle(
                fontSize: fontSize ?? FontSize.s18,
                color: colorText ?? ColorManager.white,
              ),
            ),
          ),
        );
      },
    );
  }
}
