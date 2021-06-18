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
        minimumFetchInterval: Duration(seconds: 100),
      ));

      await _remoteConfig.setDefaults(defaults);
      await _remoteConfig
          .fetchAndActivate()
          .then((val) => print('Fetch Complete Activated: $val'));
      Get.log(
          'Remote Config Ready --> Is Under Maintainance : ${_remoteConfig.getBool(_UnderMaintainance)}');
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
