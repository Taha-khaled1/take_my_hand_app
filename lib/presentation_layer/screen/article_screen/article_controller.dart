import 'package:take_hand/data_layer/data_source/article_source.dart';
import 'package:take_hand/data_layer/models/article_model.dart';
import 'package:take_hand/presentation_layer/screen/article_screen/widget/article_card.dart';
import 'package:take_hand/presentation_layer/src/get_packge.dart';
import 'package:take_hand/presentation_layer/utils/helper_function.dart';

class ArticleController extends GetxController with ArticleSource {
  late StatusRequest statusRequest;
  ArticleModel? articlesModel;
  var response;
  List<ArticleCard> articleCards = [];

  getArticleResponse() async {
    try {
      statusRequest = StatusRequest.loading;
      response = await getArticles();
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        HelperFunction.printRedText("==================> ${response}");
        articlesModel = await ArticleModel.fromJson(response);
        for (var item in articlesModel!.data!.articles!) {
          articleCards.add(
            ArticleCard(
              id: item.id ?? 1,
              imageUrl: item.image ?? "",
              title: item.title ?? "",
              date: item.createdAt ?? "",
              readTime: 10,
            ),
          );
        }
      }
    } catch (e) {
      HelperFunction.printRedText("==================> ${e}");
      statusRequest = StatusRequest.serverfailure;
    }
    update();
  }

  @override
  void onInit() async {
    getArticleResponse();
    super.onInit();
  }
}
