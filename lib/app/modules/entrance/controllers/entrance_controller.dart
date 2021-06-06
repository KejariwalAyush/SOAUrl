import 'package:get/get.dart';
import 'package:soaurl/app/routes/app_pages.dart';

class EntranceController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    print('Splash init');
  }

  @override
  void onReady() {
    Future.delayed(300.milliseconds).whenComplete(() {
      print('Login');
      Get.offNamed(Routes.LOGIN);
    });
    super.onReady();
  }

  @override
  void onClose() {}
}
