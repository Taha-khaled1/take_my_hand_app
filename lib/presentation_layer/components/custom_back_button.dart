import 'package:take_hand/presentation_layer/src/get_packge.dart';
import 'package:take_hand/presentation_layer/src/style_packge.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    super.key,
    this.onTap,
    this.height,
    this.width,
    this.borderRadius,
    this.child,
  });

  final void Function()? onTap;
  final double? height, width, borderRadius;
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: GestureDetector(
        onTap: onTap ??
            () {
              Get.back();
            },
        child: ClayContainer(
          color: ColorManager.background,
          height: height ?? 40,
          width: width ?? 40,
          borderRadius: borderRadius ?? 50,
          spread: 2,
          curveType: CurveType.concave,
          child: child ??
              Icon(
                Icons.arrow_forward_ios,
                color: ColorManager.white,
                size: 30,
              ),
        ),
      ),
    );
  }
}
