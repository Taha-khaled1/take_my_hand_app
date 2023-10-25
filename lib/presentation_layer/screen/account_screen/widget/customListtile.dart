// ignore_for_file: file_names

import 'package:flutter_svg/flutter_svg.dart';
import 'package:take_hand/presentation_layer/src/style_packge.dart';
import 'package:take_hand/presentation_layer/utils/helper_view.dart';
import 'package:take_hand/presentation_layer/utils/responsive_design/ui_components/info_widget.dart';

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
            spread: 2,
            child: ListTile(
              onTap: onTap,
              trailing: const Icon(Icons.arrow_forward_ios,
                  color: ColorManager.white),
              leading:
                  widget ?? SvgPicture.asset(image!, color: ColorManager.white),
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
        );
      },
    );
  }
}
