import 'package:cached_network_image/cached_network_image.dart';
import 'package:take_hand/presentation_layer/src/style_packge.dart';

class CustomCircleImage extends StatelessWidget {
  const CustomCircleImage(
      {Key? key, required this.radius, this.image, this.isWidget = false})
      : super(key: key);
  final double radius;
  final String? image;
  final bool? isWidget;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: ColorManager.white,
      radius: radius,
      // استخدام عنصر ClipOval لعرض الصورة بشكل كامل داخل دائرة CircleAvatar
      child: CachedNetworkImage(
        errorWidget: (context, url, error) {
          return Image.network(
            'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png',
          );
        },
        placeholder: (context, url) {
          return CircularProgressIndicator(
            color: Colors.purple,
          );
        },
        imageUrl: image!, //?? sharedPreferences.getString('image').toString(),
        width: radius * 1.5,
        height: radius * 1.5,
        fit: BoxFit
            .contain, // تحديد كيفية توسيط وتغطية الصورة داخل دائرة ال CircleAvatar
      ),
    );
  }
}
