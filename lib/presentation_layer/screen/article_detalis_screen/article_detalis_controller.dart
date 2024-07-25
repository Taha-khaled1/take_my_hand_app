import 'package:take_hand/data_layer/data_source/article_source.dart';
import 'package:take_hand/data_layer/models/article_model_detalis.dart';
import 'package:take_hand/presentation_layer/src/get_packge.dart';
import 'package:take_hand/presentation_layer/utils/helper_function.dart';

class ArticleDetalisController extends GetxController with ArticleSource {
  late StatusRequest statusRequest;
  ArticleDetalisModel? articlesModel;
  var response;
  final int? id = Get.arguments["id"];
  getArticleDetalisResponse() async {
    try {
      HelperFunction.printRedText("==================> ${id}");
      statusRequest = StatusRequest.loading;
      response = await getArticlesDetalis(id!);
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        HelperFunction.printRedText("==================> ${response}");
        articlesModel = await ArticleDetalisModel.fromJson(response);
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
    getArticleDetalisResponse();
    super.onInit();
  }
}
