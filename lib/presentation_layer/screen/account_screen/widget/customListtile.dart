// ignore_for_file: file_names, deprecated_member_use

import 'package:flutter_svg/flutter_svg.dart';
import 'package:take_hand/presentation_layer/src/style_packge.dart';

class CustomListtile extends StatelessWidget {
  const CustomListtile({
    Key? key,
    this.image,
    required this.onTap,
    required this.titel,
    this.textStyle,
    this.widget,
  }) : super(key: key);
  final void Function()? onTap;
  final String? image, titel;
  final TextStyle? textStyle;
  final Widget? widget;
  @override
  Widget build(BuildContext context) {
    return InfoWidget(
      builder: (context, deviceInfo) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: ClayContainer(
            width: HelperView.widthForTextField(deviceInfo),
            height: 65,
            color: ColorManager.background,
            borderRadius: 15,
            spread: 1.5,
            depth: 10,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Center(
                child: ListTile(
                  contentPadding: EdgeInsets.all(0),
                  onTap: onTap,
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    color: ColorManager.white,
                  ),
                  leading: ClayContainer(
                    color: ColorManager.backgroundpersonalimage,
                    height: 40,
                    width: 40,
                    borderRadius: 15,
                    spread: 2,
                    curveType: CurveType.convex,
                    child: widget ??
                        SvgPicture.asset(
                          image!,
                          color: ColorManager.white,
                        ),
                  ),
                  title: Text(
                    titel!,
                    style: textStyle ??
                        MangeStyles().getBoldStyle(
                          color: ColorManager.white,
                          fontSize: FontSize.s18,
                        ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
