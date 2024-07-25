import 'package:take_hand/data_layer/data_source/university_source.dart';
import 'package:take_hand/data_layer/models/college_model.dart';

import 'package:take_hand/presentation_layer/src/get_packge.dart';
import 'package:take_hand/presentation_layer/utils/helper_function.dart';

class UniversityCollegeController extends GetxController with UniversitySource {
  String text =
      "الجامعة الأمريكية هي جامعة بحثية خاصة تقع في واشنطن العاصمة. تأسست في عام 1893 وهي من أقدم الجامعات الخاصة في عاصمة الولايات المتحدة. تُعرف الجامعة بقوة برامجها في العلاقات الدولية، والعلوم السياسية، والأعمال، والاتصالات. لديها قيد حوالي 14,000 طالب جامعي وتقدم أكثر من 200 برنامج دراسي عبر 7 كليات وأقسام. يقع الحرم الرئيسي للجامعة في شمال غرب واشنطن العاصمة، بالقرب من العديد من المؤسسات السياسية والحكومية الهامة. تُعتبر الجامعة الأمريكية من الجامعات المرموقة في منطقة واشنطن العاصمة الكبرى وتحتل مراتب متقدمة من حيث الأكاديميات، والإنتاج البحثي، والحياة الجامعية.";
  late StatusRequest statusRequest;
  CollegeModel? collegeModel;
  var response;
  final int? id = Get.arguments["id"];
  getCollegeResponse() async {
    try {
      statusRequest = StatusRequest.loading;
      response = await getCollege(id!);
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        HelperFunction.printRedText("==================> ${response}");
        collegeModel = await CollegeModel.fromJson(response);
      }
    } catch (e) {
      HelperFunction.printRedText("==================> ${e}");
      statusRequest = StatusRequest.serverfailure;
    }
    update();
  }

  @override
  void onInit() async {
    getCollegeResponse();
    super.onInit();
  }
}
