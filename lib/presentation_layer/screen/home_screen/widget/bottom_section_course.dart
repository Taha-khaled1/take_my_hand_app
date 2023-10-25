import 'package:take_hand/presentation_layer/src/style_packge.dart';

class BottomSectionCourse extends StatelessWidget {
  const BottomSectionCourse({
    super.key,
    required this.college,
    required this.star,
  });
  final String college, star;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          college,
          style: MangeStyles().getRegularStyle(
            color: ColorManager.white,
            fontSize: 14,
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        const SizedBox(
          height: 17,
          child: VerticalDivider(
            thickness: 2,
            color: ColorManager.kPrimary,
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          star,
          style: MangeStyles().getRegularStyle(
            color: ColorManager.white,
            fontSize: 14,
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        const Icon(
          Icons.star,
          color: Colors.yellow,
        ),
      ],
    );
  }
}
