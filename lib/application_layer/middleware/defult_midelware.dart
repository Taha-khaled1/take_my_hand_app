// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:take_hand/main.dart';
// import 'package:take_hand/presentation_layer/src/get_packge.dart';
// import 'package:take_hand/presentation_layer/src/style_packge.dart';
// import 'package:get/get_navigation/src/routes/route_middleware.dart';

// class Midelware extends GetMiddleware {
//   @override
//   // ignore: overridden_fields
//   final int? priority = 1;

//   @override
//   RouteSettings? redirect(String? route) {
//     print(sharedPreferences.getString('id'));
//     if (sharedPreferences.getString('id') != null) {
//       // Get.to(() => Example());
//       return const RouteSettings(name: 'home');
//     } else {
//       return const RouteSettings(name: 'login');
//     }
//   }
// }

// class MyMidelware extends GetMiddleware {
//   @override
//   // ignore: overridden_fields
//   final int? priority = 1;

//   @override
//   RouteSettings? redirect(String? route) {
//     print('--------------------------------');
//     final String userId =
//         sharedPreferences.getString('id')!; // replace with the actual user ID
//     final CollectionReference usersCollection =
//         FirebaseFirestore.instance.collection('users');
//     usersCollection.doc(userId).get().then((docSnapshot) {
//       if (docSnapshot.exists) {
//         return const RouteSettings(name: 'home');
//       } else {
//         return const RouteSettings(name: 'info');
//       }
//     });
//     return null;
//   }
// }
