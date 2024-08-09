import 'package:take_hand/presentation_layer/src/style_packge.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({
    super.key,
    required this.title,
    this.onTap,
  });
  final String title;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 5,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: MangeStyles().getBoldStyle(
              color: ColorManager.grey2,
              fontSize: FontSize.s16,
            ),
          ),
          if (onTap != null)
            GestureDetector(
              onTap: onTap,
              child: Text(
                "المزيد",
                style: MangeStyles().getBoldStyle(
                  color: ColorManager.grey2,
                  fontSize: FontSize.s14,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
