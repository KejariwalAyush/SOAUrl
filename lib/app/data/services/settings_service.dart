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
      showAd.update((val) {
        val = box.read("showAd") ?? true;
      });
      showLogoinQR.update((val) {
        val = box.read("showLogoinQR") ?? true;
      });
    }
    print('$runtimeType ready!');
    return this;
  }

  void toggleShowAd() async {
    showAd.toggle();
    await box.write("showAd", showAd.value);
  }

  void toggleShowLogoinQR() async {
    showLogoinQR.toggle();
    await box.write("showLogoinQR", showLogoinQR.value);
  }
}
