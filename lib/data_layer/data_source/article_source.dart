import 'package:take_hand/data_layer/database/database.dart';
import 'package:take_hand/presentation_layer/resources/msnge_api.dart';

mixin ArticleSource {
  dynamic getArticles() async {
    CurdSQL curd = CurdSQL();
    var respons = await curd.getrequest(
      APiMange.articles,
    );

    return respons;
  }

  dynamic getArticlesDetalis(int id) async {
    CurdSQL curd = CurdSQL();
    var respons = await curd.getrequest(
      APiMange.articlesDetalis + "/$id",
    );

    return respons;
  }
}
