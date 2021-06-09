import 'package:soaurl/app/data/data.dart';
import 'package:flutter/foundation.dart' show kDebugMode;

class SettingsService extends GetxService {
  RxBool showAd = true.obs;
  RxBool showLogoinQR = true.obs;

  Future<SettingsService> init() async {
    if (kDebugMode) print('Debug Mode Active');

    if (GetPlatform.isWeb || kDebugMode) showAd.toggle();
    // else if (GetPlatform.isAndroid) showAd = true;
    // showLogoinQR = true;

    print('$runtimeType ready!');
    return this;
  }
}
