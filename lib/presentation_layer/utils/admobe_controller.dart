import 'dart:io';
import 'package:take_hand/presentation_layer/utils/helper_function.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import '../../main.dart';

class AdmobeController extends GetxController {
  // HomeController homeController = Get.put(HomeController());
  // final BuildContext ctx;
  final int maxFailedLoadAttempts = 3;
  final AdRequest request = const AdRequest(
    keywords: <String>['foo', 'bar'],
    contentUrl: 'http://foo.com/bar.html',
    nonPersonalizedAds: true,
  );

  // HomeController homeController = Get.find();
  RewardedAd? _rewardedAd;
  int _numRewardedLoadAttempts = 0;

  // AdmobeController(this.ctx);
  void _createRewardedAd() {
    RewardedAd.load(
        adUnitId: Platform.isAndroid
            ? sharedPreferences.getString("android_id")!
            : sharedPreferences.getString("ios_id")!,
        request: request,
        rewardedAdLoadCallback: RewardedAdLoadCallback(
          onAdLoaded: (RewardedAd ad) {
            HelperFunction.printRedText(
              '$ad loaded. loaded loaded loaded loaded loaded loaded loaded loaded loaded loaded loaded',
            );
            // showCustomSnackBar(AppStrings.ad_loaded.tr);
            _rewardedAd = ad;
            _numRewardedLoadAttempts = 0;
          },
          onAdFailedToLoad: (LoadAdError error) {
            // printRedText('${AppStrings.something_wrong.tr}: $error');
            _rewardedAd = null;
            _numRewardedLoadAttempts += 1;
            if (_numRewardedLoadAttempts < maxFailedLoadAttempts) {
              _createRewardedAd();
            }
          },
        ));
  }

  void showRewardedAd() {
    if (_rewardedAd == null) {
      // printRedText(AppStrings.show_ad_before_loaded.tr);
      // showCustomSnackBar(AppStrings.show_ad_before_loaded.tr);
      return;
    }

    _rewardedAd!.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (RewardedAd ad) {
        HelperFunction.printRedText('ad onAdShowedFullScreenContent.');
        // showCustomSnackBar('onAdShowedFullScreenContent');
      },
      onAdDismissedFullScreenContent: (RewardedAd ad) {
        HelperFunction.printRedText('$ad onAdDismissedFullScreenContent.');

        ad.dispose();
        _createRewardedAd();
      },
      onAdFailedToShowFullScreenContent: (RewardedAd ad, AdError error) {
        HelperFunction.printRedText(
            '$ad onAdFailedToShowFullScreenContent: $error');
        // showCustomSnackBar('${AppStrings.something_wrong.tr}: $error');
        ad.dispose();
        _createRewardedAd();
      },
    );

    _rewardedAd!.setImmersiveMode(true);
    _rewardedAd!.show(
        onUserEarnedReward: (AdWithoutView ad, RewardItem reward) {
      HelperFunction.printRedText(
          '$ad ------------------------------------- with reward $RewardItem(${reward.amount}, ${reward.type})'); // give him coin
      // homeController.getReward();
      // homeController.createTicketForUser();
      Future.delayed(const Duration(seconds: 2)).then((value) {
        HelperFunction.showToast('you got the ticket');
      });
    });
    _rewardedAd = null;
  }

  @override
  void onInit() {
    _createRewardedAd();
    super.onInit();
  }

  @override
  void onClose() {
    _rewardedAd?.dispose();
    super.onClose();
  }
}
