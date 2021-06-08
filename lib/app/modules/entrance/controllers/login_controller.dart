import 'package:soaurl/app/data/data.dart';
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

  Future<void> onSignin() async {
    isLoading.toggle();
    update();
    await Future.microtask(() => Get.find<AuthService>().signInWithGoogle())
        .whenComplete(() {
      print('Login');
      Get.offNamed(Routes.HOME);
    });
    // Future.delayed().whenComplete(() {
    // });
    isLoading.toggle();
    update();
  }
}
