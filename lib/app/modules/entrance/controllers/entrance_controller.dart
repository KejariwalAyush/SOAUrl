import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:soaurl/app/routes/app_pages.dart';

class EntranceController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    print('Splash init');
    checkUserLoggedIn();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  // Intilize the flutter app
  FirebaseApp firebaseApp;
  User firebaseUser;
  FirebaseAuth firebaseAuth;

  Future<void> initlizeFirebaseApp() async {
    firebaseApp = await Firebase.initializeApp();
  }

  Future<InitializationStatus> _initGoogleMobileAds() {
    return MobileAds.instance.initialize();
  }

  Future<void> checkUserLoggedIn() async {
    _initGoogleMobileAds();
    if (firebaseApp == null) {
      await initlizeFirebaseApp();
    }
    if (firebaseAuth == null) {
      firebaseAuth = FirebaseAuth.instance;
      update();
    }
    if (firebaseAuth.currentUser == null) {
      Get.offNamed(Routes.LOGIN);
    } else {
      firebaseUser = firebaseAuth.currentUser;
      update();
      Get.offNamed(Routes.HOME);
    }
  }
}
