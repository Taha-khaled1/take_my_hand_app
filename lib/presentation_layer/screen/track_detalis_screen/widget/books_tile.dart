import 'package:take_hand/presentation_layer/screen/track_detalis_screen/widget/book_card.dart';
import 'package:take_hand/presentation_layer/src/style_packge.dart';

class BooksTile extends StatelessWidget {
  const BooksTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      trailing: const Icon(
        Icons.keyboard_arrow_down_sharp,
        color: ColorManager.white,
      ),
      iconColor: Colors.amber,
      title: Text(
        "اضغط لمشاهدة افضل الكتب",
        style: MangeStyles().getBoldStyle(
          color: ColorManager.grey2,
          fontSize: FontSize.s16,
        ),
      ),
      children: const [
        BookCardTile(),
        BookCardTile(),
        BookCardTile(),
        BookCardTile(),
      ],
    );
  }
}
