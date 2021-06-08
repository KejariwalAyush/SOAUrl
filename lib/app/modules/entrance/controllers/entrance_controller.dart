import 'package:get/get.dart';
import 'package:soaurl/app/data/data.dart';
import 'package:soaurl/app/routes/app_pages.dart';

class EntranceController extends GetxController {
  @override
  void onInit() async {
    super.onInit();
    print('Splash init');
    await Future.delayed(300.milliseconds);
  }

  @override
  void onReady() {
    super.onReady();
    Get.find<AuthService>().fireUser == null
        ? Get.offNamed(Routes.LOGIN)
        : Get.offNamed(Routes.HOME);
  }

  @override
  void onClose() {}

  // Future<void> checkUserLoggedIn() async {
  //   FirebaseAuth.instance.authStateChanges().listen((User user) {
  //     if (user == null) {
  //       print('User is currently signed out!');
  //       Get.offNamed(Routes.LOGIN);
  //     } else {
  //       print('User is signed in!');
  //       final ss = Get.find<SettingsService>();
  //       ss.fireUser = user;
  //       update();
  //       Get.offNamed(Routes.HOME);
  //     }
  //   });
  //   // if (firebaseAuth == null) {
  //   //   firebaseAuth = FirebaseAuth.instance;
  //   //   update();
  //   // }
  //   // if (firebaseAuth.currentUser == null) {
  //   //   Get.offNamed(Routes.LOGIN);
  //   // } else {
  //   //   firebaseUser = firebaseAuth.currentUser;
  //   //   update();
  //   //   Get.offNamed(Routes.HOME);
  //   // }
  // }
}
