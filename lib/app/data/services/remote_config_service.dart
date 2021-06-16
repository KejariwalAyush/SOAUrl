import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:get/get.dart';

const String _UnderMaintainance = "under_maintaince";

class RemoteConfigService extends GetxService {
  late final RemoteConfig _remoteConfig;
  final defaults = <String, dynamic>{_UnderMaintainance: false};

  Future<RemoteConfigService> init() async {
    _remoteConfig = RemoteConfig.instance;
    try {
      await _remoteConfig.setConfigSettings(RemoteConfigSettings(
        fetchTimeout: Duration(seconds: 10),
        minimumFetchInterval: Duration(hours: 1),
      ));

      await _remoteConfig.setDefaults(defaults);
      await _remoteConfig.fetchAndActivate();
      if (!isUnderMaintainance)
        Get.snackbar('❗❗❗Under Maintaince❗❗❗',
            'App is under Maintainance for some time will be back soon, Thanks for your support');
    } catch (e) {
      Get.log(
          'Unable to fetch remote config. Cached or default values will be used: \n $e');
      FirebaseCrashlytics.instance.log(
          'Unable to fetch remote config. Cached or default values will be used: \n $e');
    }
    return this;
  }

  bool get isUnderMaintainance => _remoteConfig.getBool(_UnderMaintainance);
}
