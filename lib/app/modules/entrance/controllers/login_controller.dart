import 'package:get/get.dart';
import 'package:soaurl/app/routes/app_pages.dart';

class LoginController extends GetxController {
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    print('Login init');
  }

  @override
  void onReady() {
    print('Ready');
    super.onReady();
  }

  @override
  void onClose() {}

  void onSignin() {
    isLoading.toggle();
    update();
    Future.delayed(300.milliseconds).whenComplete(() {
      print('Login');
      Get.offNamed(Routes.HOME);
    });
  }
}
