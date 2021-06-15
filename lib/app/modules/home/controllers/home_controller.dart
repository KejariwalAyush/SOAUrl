import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:soaurl/app/data/data.dart';
import 'package:soaurl/app/data/services/ad_service.dart';
import 'package:soaurl/app/routes/app_pages.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeController extends GetxController {
  late InterstitialAd _interstitialAd;
  final AdService _ad = Get.find<AdService>();
  final SettingsService _ss = Get.find<SettingsService>();
  final ReceiveIntentService _intentService = Get.find<ReceiveIntentService>();
  final GlobalKey<SliderMenuContainerState> menuKey =
      new GlobalKey<SliderMenuContainerState>();

  RxBool _isInterstitialAdReady = false.obs;
  @override
  void onInit() {
    super.onInit();
    _interstitialAd = _ad.fullPageAd();
  }

  @override
  void onReady() {
    String? sharedText = _intentService.sharedText;
    print(sharedText);
    if (sharedText != null && sharedText != '' && sharedText != 'null')
      Get.toNamed(Routes.QR, parameters: {'text': sharedText});
    super.onReady();
  }

  @override
  void onClose() {}

  void refreshData() {}

  void quickshort() {
    if (_ss.showAd.value) _interstitialAd.load();
    Get.bottomSheet(
      Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: kBorderRadius.topLeft,
                topRight: kBorderRadius.topRight),
            gradient: kcgMain),
        child: Column(
          children: [
            TextField(),
            TextField(),
            20.heightBox,
            KbWhiteButton(
                child: 'Shorten it'.text.make(),
                onPressed: () {
                  Get.log(_isInterstitialAdReady.value.toString());
                  _interstitialAd
                      .isLoaded()
                      .then((value) => _interstitialAd.show());
                }),
          ],
        ).p16(),
      ),
      backgroundColor: Colors.transparent,
      isDismissible: false,
    );
  }

  void customshort() => Get.toNamed(Routes.SHORT);
  void generateQR() => Get.toNamed(Routes.QR);
  void openNotification() => Get.toNamed(Routes.NOTIFICATIONS);
  void openDrawer() {
    (menuKey.currentState?.isDrawerOpen ?? false)
        ? menuKey.currentState!.closeDrawer()
        : menuKey.currentState!.openDrawer();
  }
}
