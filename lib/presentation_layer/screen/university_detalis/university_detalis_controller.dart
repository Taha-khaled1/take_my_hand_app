import 'package:get/get.dart';
import 'package:take_hand/application_layer/utils/handling.dart';
import 'package:take_hand/application_layer/utils/statusrequst.dart';
import 'package:take_hand/data_layer/data_source/university_source.dart';
import 'package:take_hand/data_layer/models/university_model_detalis.dart';
import 'package:take_hand/presentation_layer/utils/helper_function.dart';

class UniversityDetalisController extends GetxController with UniversitySource {
  String text =
      "الجامعة الأمريكية هي جامعة بحثية خاصة تقع في واشنطن العاصمة. تأسست في عام 1893 وهي من أقدم الجامعات الخاصة في عاصمة الولايات المتحدة. تُعرف الجامعة بقوة برامجها في العلاقات الدولية، والعلوم السياسية، والأعمال، والاتصالات. لديها قيد حوالي 14,000 طالب جامعي وتقدم أكثر من 200 برنامج دراسي عبر 7 كليات وأقسام. يقع الحرم الرئيسي للجامعة في شمال غرب واشنطن العاصمة، بالقرب من العديد من المؤسسات السياسية والحكومية الهامة. تُعتبر الجامعة الأمريكية من الجامعات المرموقة في منطقة واشنطن العاصمة الكبرى وتحتل مراتب متقدمة من حيث الأكاديميات، والإنتاج البحثي، والحياة الجامعية.";
  bool isExpanded = false;

  void toggleExpansion() {
    isExpanded = !isExpanded;
    update();
  }

  late StatusRequest statusRequest;
  UniversityDetalisModel? universityDetalisModel;
  var response;
  final int? id = Get.arguments["id"];
  getUniversityDetalisResponse() async {
    try {
      HelperFunction.printRedText("==================> ${id}");
      statusRequest = StatusRequest.loading;
      response = await getUniversityDetalis(id!);
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        HelperFunction.printRedText("==================> ${response}");
        universityDetalisModel =
            await UniversityDetalisModel.fromJson(response);
      }
    } catch (e) {
      HelperFunction.printRedText("==================> ${e}");
      statusRequest = StatusRequest.serverfailure;
    }
    update();
  }

  @override
  void onInit() async {
    HelperFunction.printCyanText("==================> ${id}");
    getUniversityDetalisResponse();
    super.onInit();
  }
}
