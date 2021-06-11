import 'package:flutter/foundation.dart';
import 'package:soaurl/app/data/data.dart';

class SettingsService extends GetxService {
  RxBool showAd = true.obs;
  RxBool showLogoinQR = true.obs;
  final GetStorage box = GetStorage();

  Future<SettingsService> init() async {
    if (kDebugMode) print('Debug Mode Active');
    if (GetPlatform.isWeb) // || kDebugMode)
      showAd.toggle();
    else {
      showAd.value = box.read('showAd') ?? true;
      showLogoinQR.value = box.read('showLogoinQR') ?? true;
      Get.log('ShowAd: ${showAd.value}');
    }
    print('$runtimeType ready!');
    return this;
  }

  void toggleShowAd() {
    showAd.toggle();
    box.write("showAd", showAd.value);
    Get.log(box.read("showAd").toString());
  }

  void toggleShowLogoinQR() {
    showLogoinQR.toggle();
    box.write("showLogoinQR", showLogoinQR.value);
  }
}
