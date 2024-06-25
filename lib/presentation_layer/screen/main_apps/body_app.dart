import 'package:take_hand/presentation_layer/components/appbar.dart';
import 'package:take_hand/presentation_layer/src/style_packge.dart';

class BodyAppScreen extends StatelessWidget {
  const BodyAppScreen({Key? key, this.title, required this.body})
      : super(key: key);
  final String? title;
  final Widget body;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.background,
      appBar: appbar(title ?? ""),
      body: Container(
        constraints: const BoxConstraints(),
        child: body,
      ),
    );
  }
}
