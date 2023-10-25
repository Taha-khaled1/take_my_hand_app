import 'package:get/get.dart';
import 'package:take_hand/presentation_layer/screen/support_screen/support_controller.dart';
import 'package:take_hand/presentation_layer/src/components_packge.dart';
import 'package:take_hand/presentation_layer/src/style_packge.dart';
import 'package:take_hand/presentation_layer/utils/helper_view.dart';
import 'package:take_hand/presentation_layer/utils/responsive_design/ui_components/info_widget.dart';

class SupportScreen extends StatelessWidget {
  const SupportScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.background,
      appBar: appbar(AppStrings.share_app.tr),
      body: InfoWidget(
        builder: (context, deviceInfo) {
          return Center(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      " اذا كان هناك مشكله او تريد دوره تعليميه غير موجوده فلا تتردد فتواصل معنا ",
                      style: MangeStyles().getBoldStyle(
                        color: ColorManager.grey2,
                        fontSize: FontSize.s16,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  SizedBox(
                    height: 60,
                    width: HelperView.widthForTextField(deviceInfo),

                    child: const SelectedProblem(),
                    // child: DropdownButton<String>(
                    //   underline: const SizedBox(),
                    //   value: _selectedValue,
                    //   isExpanded: true,
                    //   elevation: 5,
                    //   borderRadius: BorderRadius.circular(15),
                    //   style: MangeStyles().getBoldStyle(
                    //     color: ColorManager.white,
                    //     fontSize: FontSize.s16,
                    //   ),
                    //   hint: Text(
                    //     "نوع المشكله",
                    //     style: MangeStyles().getBoldStyle(
                    //       color: ColorManager.white,
                    //       fontSize: FontSize.s16,
                    //     ),
                    //   ),
                    //   onChanged: (String? newValue) {
                    //     // setState(() {
                    //     //   _selectedValue = newValue;
                    //     // });
                    //     Navigator.of(context).pop();
                    //   },
                    //   items: <String>[
                    //     "مشكله تواجهها",
                    //     "كورس غير موجود",
                    //     "مجال غير موجود",
                    //     "كليه غير موجوده"
                    //   ].map<DropdownMenuItem<String>>((String value) {
                    //     return DropdownMenuItem<String>(
                    //       value: value,
                    //       child: Text(value),
                    //     );
                    //   }).toList(),
                    // ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomTextfield(
                    validator: (value) {
                      return null;
                    },
                    onSaved: (value) {
                      return null;
                    },
                    titel: "اكتب اسمك",
                    width: 0,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomTextfield(
                    validator: (value) {
                      return null;
                    },
                    onSaved: (value) {
                      return null;
                    },
                    titel: "بريدك الاكتروني",
                    width: 0,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  ClayContainer(
                    spread: 2,
                    width: HelperView.widthForTextField(deviceInfo),
                    color: ColorManager.background,
                    borderRadius: 15,
                    child: TextFormField(
                      autocorrect: false,
                      validator: (value) {
                        return null;
                      },
                      onSaved: (newValue) {},
                      maxLines: 5,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color(0xff141418),
                        hintText: "اكتب رسالتك",
                        hintStyle: MangeStyles().getBoldStyle(
                          color: ColorManager.white,
                          fontSize: FontSize.s16,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomButton(
                    backgroundColor: ColorManager.kPrimary,
                    text: "ارسال",
                    press: () {},
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class SelectedProblem extends StatelessWidget {
  const SelectedProblem({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SupportController>(
      init: SupportController(),
      initState: (_) {},
      builder: (_) {
        return ClayContainer(
          height: 60,
          color: ColorManager.background,
          borderRadius: 15,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            child: DropdownButton<String>(
              dropdownColor: ColorManager.background,
              underline: const SizedBox(),
              value: _.selectedValue,
              isExpanded: true,
              elevation: 5,
              borderRadius: BorderRadius.circular(15),
              style: MangeStyles().getBoldStyle(
                color: ColorManager.kPrimary,
                fontSize: FontSize.s16,
              ),
              hint: Text(
                "نوع المشكله",
                style: MangeStyles().getBoldStyle(
                  color: ColorManager.white,
                  fontSize: FontSize.s16,
                ),
              ),
              onChanged: (String? newValue) {
                _.changeValue(newValue ?? "مشكله تواجهها");
              },
              items: <String>[
                "مشكله تواجهها",
                "كورس غير موجود",
                "مجال غير موجود",
                "كليه غير موجوده"
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: MangeStyles().getBoldStyle(
                      color: ColorManager.white,
                      fontSize: FontSize.s16,
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }
}
