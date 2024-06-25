import 'package:take_hand/presentation_layer/screen/track_detalis_screen/widget/book_card.dart';
import 'package:take_hand/presentation_layer/src/style_packge.dart';

class BookRow extends StatelessWidget {
  const BookRow({
    super.key,
    required this.deviceInfo,
  });
  final DeviceInfo deviceInfo;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: GridView.builder(
        shrinkWrap: true,
        itemCount: 4,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: HelperView.childGridView(deviceInfo),
          childAspectRatio: 1.1,
          crossAxisSpacing: 2,
          mainAxisSpacing: 2,
        ),
        itemBuilder: (context, index) {
          return const BookCard(
            image: "assets/images/downlo0ad.png",
            name: "Clean Code",
          );
        },
      ),
    );
  }
}
