import 'package:take_hand/data_layer/database/database.dart';
import 'package:take_hand/presentation_layer/resources/msnge_api.dart';

mixin ProviderSource {
  dynamic getProviderHome() async {
    CurdSQL curd = CurdSQL();
    var respons = await curd.getrequest(
      APiMange.providers,
    );

    return respons;
  }
}
