import 'package:take_hand/presentation_layer/src/style_packge.dart';

class CustomTag extends StatelessWidget {
  const CustomTag({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 100,
      height: 30,
      decoration: BoxDecoration(
        color: ColorManager.kPrimary,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Text(
        title,
        style: MangeStyles().getRegularStyle(
          color: ColorManager.white,
          fontSize: 14,
        ),
      ),
    );
  }
}
