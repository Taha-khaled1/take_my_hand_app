import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:take_hand/presentation_layer/src/style_packge.dart';

class CarouselSliderBanner extends StatelessWidget {
  const CarouselSliderBanner({
    super.key,
    required this.items,
    this.height,
    this.aspectRatio,
    this.viewportFraction,
    this.callbackFunction,
    this.enlargeFactor,
    this.autoPlay,
  });
  final List<Widget> items;
  final double? height, aspectRatio, viewportFraction, enlargeFactor;
  final void Function(int, CarouselPageChangedReason)? callbackFunction;
  final bool? autoPlay;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      // margin: const EdgeInsets.symmetric(horizontal: 12),
      width: MediaQuery.of(context).size.width * 1,
      height: height ?? 160,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: CarouselSlider(
        items: items,
        options: CarouselOptions(
          height: height ?? 160,
          aspectRatio: aspectRatio ?? 16 / 9,
          viewportFraction: viewportFraction ?? 0.8,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: autoPlay ?? true,
          autoPlayInterval: const Duration(seconds: 3),
          autoPlayAnimationDuration: const Duration(seconds: 2),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          enlargeFactor: enlargeFactor ?? 0.3,
          onPageChanged: callbackFunction,
          scrollDirection: Axis.horizontal,
        ),
      ),
    );
  }
}

class BannerCard extends StatelessWidget {
  const BannerCard({
    super.key,
    required this.image,
    required this.text,
  });
  final String image, text;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            offset: const Offset(4.0, 4.0),
            blurRadius: 15.0,
            spreadRadius: 1.0,
          ),
          BoxShadow(
            color: Colors.grey[850]!,
            offset: const Offset(-4.0, -4.0),
            blurRadius: 15.0,
            spreadRadius: 1.0,
          ),
        ],
        borderRadius: BorderRadius.circular(25),
        color: ColorManager.background,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: CachedNetworkImage(
          imageUrl: image,
          fit: BoxFit.cover,
          placeholder: (context, url) => Center(
            child: CircularProgressIndicator(),
          ),
        ),
        // child: Image.network(
        //   element.image!,
        //   fit: BoxFit.cover,
        //   width: 600,
        //   height: 200,
        // ),
      ),
    );
  }
}
