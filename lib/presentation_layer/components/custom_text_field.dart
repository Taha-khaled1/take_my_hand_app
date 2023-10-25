import 'package:take_hand/presentation_layer/src/style_packge.dart';
import 'package:take_hand/presentation_layer/utils/helper_view.dart';
import 'package:take_hand/presentation_layer/utils/responsive_design/ui_components/info_widget.dart';

class CustomTextfield extends StatelessWidget {
  final String titel;
  final bool? obscureText;
  final IconData? icon;
  final VoidCallback? onIconTap;
  final String? Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final double width;
  final TextDirection? textDirection;
  final String? initialValue;
  final BorderStyle? borderStyle;
  final int? maxLines;
  final Color? fillColor;
  final bool? enableBorder;
  final bool readOnly;
  final VoidCallback? onTap;
  final void Function(String)? onChanged;

  const CustomTextfield({
    Key? key,
    this.icon,
    this.onIconTap,
    this.obscureText,
    required this.validator,
    required this.onSaved,
    required this.titel,
    required this.width,
    this.textDirection,
    this.initialValue,
    this.borderStyle,
    this.maxLines,
    this.fillColor,
    this.enableBorder = true,
    this.readOnly = false,
    this.onTap,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InfoWidget(
      builder: (context, deviceInfo) {
        return ClayContainer(
          spread: 2,
          width: HelperView.widthForTextField(deviceInfo),
          color: ColorManager.background,
          borderRadius: 15,
          child: TextFormField(
            style: const TextStyle(color: ColorManager.white),
            autocorrect: false,
            enableSuggestions: false,
            onTap: onTap,
            readOnly: readOnly,
            maxLines: maxLines,
            initialValue: initialValue,
            textDirection: textDirection,
            obscureText: obscureText == null ? false : obscureText!,
            onSaved: onSaved,
            validator: validator,
            onChanged: onChanged,
            decoration: InputDecoration(
              prefixIcon: icon != null
                  ? IconButton(
                      onPressed: onIconTap,
                      icon: Icon(icon),
                    )
                  : null,

              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  width: 1.2,
                  style: borderStyle ?? BorderStyle.solid,
                  color: ColorManager.background,
                ),
              ),

              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  width: 1.2,
                  color: ColorManager.kPrimary,
                ),
              ),

              //  enabled: true,
              filled: true,
              fillColor: const Color(0xff141418),
              hintText: titel,
              hintStyle: MangeStyles().getBoldStyle(
                color: ColorManager.white,
                fontSize: FontSize.s16,
              ),
            ),
          ),
        );
      },
    );
  }
}
