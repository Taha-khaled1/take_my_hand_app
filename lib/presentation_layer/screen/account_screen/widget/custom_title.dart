import 'package:take_hand/presentation_layer/src/account_url.dart';

class CustomTitle extends StatelessWidget {
  const CustomTitle({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      child: Text(
        text,
        style: MangeStyles().getBoldStyle(
          color: ColorManager.white,
          fontSize: FontSize.s18,
        ),
      ),
    );
  }
}
