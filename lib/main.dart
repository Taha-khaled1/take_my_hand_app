import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:take_hand/application_layer/app/myapp.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences sharedPreferences;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPreferences = await SharedPreferences.getInstance();
  // if (sharedPreferences.getString("lang") == null) {
  sharedPreferences.setString("lang", 'ar');
  // }

  await MobileAds.instance.initialize();
  // await Firebase.initializeApp();
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const MyApp(), // Wrap your app
    ),
  );
}
