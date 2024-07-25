import 'package:take_hand/data_layer/database/database.dart';
import 'package:take_hand/presentation_layer/resources/msnge_api.dart';

mixin UniversitySource {
  // dynamic getUniversity() async {
  //   CurdSQL curd = CurdSQL();
  //   var respons = await curd.getrequest(
  //     APiMange.articles,
  //   );

  //   return respons;
  // }
  dynamic getCollege(int id) async {
    CurdSQL curd = CurdSQL();
    var respons = await curd.getrequest(
      APiMange.colleges + "$id/colleges",
    );

    return respons;
  }

  dynamic getUniversityDetalis(int id) async {
    CurdSQL curd = CurdSQL();
    var respons = await curd.getrequest(
      APiMange.universitiesDetalis + "/$id",
    );

    return respons;
  }
}
