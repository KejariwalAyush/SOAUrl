import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
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

  void onSignin() {
    isLoading.toggle();
    update();
    Future.delayed(300.milliseconds).whenComplete(() {
      print('Login');
      Get.offNamed(Routes.HOME);
    });
  }
}

class AuthController extends GetxController {
  // Intilize the flutter app
  FirebaseApp firebaseApp;
  User firebaseUser;
  FirebaseAuth firebaseAuth;

  Future<void> signInWithGoogle() async {
    try {
      // Show loading screen till we complete our login workflow
      Get.dialog(Center(child: KLoadingWidget()), barrierDismissible: false);
      // Create Firebase auth for storing auth related info such as logged in user etc.
      firebaseAuth = FirebaseAuth.instance;
      // Start of google sign in workflow
      final googleUser = await GoogleSignIn().signIn();
      final googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final userCredentialData =
          await FirebaseAuth.instance.signInWithCredential(credential);
      firebaseUser = userCredentialData.user;
      // update the state of controller variable to be reflected throughout the app
      update();
      Get.offNamed(Routes.HOME);
    } catch (ex) {
      Get.back();
      // Show Error if we catch any error
      Get.snackbar('Sign In Error', 'Error Signing in',
          duration: Duration(seconds: 5),
          backgroundColor: Colors.black,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
          icon: Icon(
            Icons.error,
            color: Colors.red,
          ));
    }
  }

  Future<void> signOut() async {
    // Show loading widget till we sign out
    Get.dialog(Center(child: KLoadingWidget()), barrierDismissible: false);
    await firebaseAuth.signOut();
    Get.back();
    // Navigate to Login again
    Get.offNamed(Routes.LOGIN);
  }
}
