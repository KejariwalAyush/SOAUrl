import 'package:get/get.dart';
import 'package:soaurl/app/data/data.dart';
import 'package:soaurl/app/routes/app_pages.dart';

class EntranceController extends GetxController {
  @override
  void onInit() async {
    super.onInit();
    print('Splash init');
    await Future.delayed(700.milliseconds);
  }

  @override
  void onReady() {
    super.onReady();
    if (Get.find<RemoteConfigService>().isUnderMaintainance)
      Get.offNamed(Routes.ERROR);
    else {
      var _auth = Get.find<AuthService>();
      _auth.fireUser == null
          ? Get.offNamed(Routes.LOGIN)
          : Get.offNamed(Routes.HOME);
    }
  }

  @override
  void onClose() {}
}
