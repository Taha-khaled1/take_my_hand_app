import 'package:take_hand/presentation_layer/src/style_packge.dart';
import 'package:take_hand/presentation_layer/utils/helper_view.dart';
import 'package:take_hand/presentation_layer/utils/responsive_design/ui_components/info_widget.dart';

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
  });

  final Color backgroundColor;
  final String text;
  final double? width, height;
  final void Function()? press;
  final double? rectangel;
  final Color? colorText;
  final Color? colorborder;
  final BorderSide? sideIs;
  final double? fontSize;
  @override
  Widget build(BuildContext context) {
    return InfoWidget(
      builder: (context, deviceInfo) {
        return ClayContainer(
          // margin: const EdgeInsets.all(7),
          width: HelperView.widthForTextField(deviceInfo),
          height: height ?? 55,
          spread: 3,
          color: ColorManager.background, borderRadius: rectangel ?? 12,
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(backgroundColor),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  side: sideIs ?? BorderSide.none,
                  borderRadius: BorderRadius.circular(rectangel ?? 12),
                ),
              ),
            ),
            onPressed: press,
            child: Text(text, style: MangeStyles.textButtonStyle),
          ),
        );
      },
    );
  }
}
