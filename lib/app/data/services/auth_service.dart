import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:soaurl/app/routes/app_pages.dart';

import '../data.dart';

class AuthService extends GetxService {
  Future<AuthService> init() async {
    _firebaseAuth = FirebaseAuth.instance;
    await checkUserLoggedIn();
    Get.log('$runtimeType ready!');
    return this;
  }

  // Intilize the flutter app
  User? fireUser;
  late FirebaseAuth _firebaseAuth;

  // get fireUser => this.fireUser;

  Future<User?> signInWithGoogle() async {
    try {
      // Show loading screen till we complete our login workflow
      Get.dialog(Center(child: KLoadingWidget()), barrierDismissible: false);
      // Create Firebase auth for storing auth related info such as logged in user etc.
      // _firebaseAuth = FirebaseAuth.instance;
      // Start of google sign in workflow
      final googleUser =
          await (GoogleSignIn().signIn() as Future<GoogleSignInAccount>);
      final googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final userCredentialData =
          await FirebaseAuth.instance.signInWithCredential(credential);
      fireUser = userCredentialData.user;
      // update the state of controller variable to be reflected throughout the app
      return fireUser;
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
      return null;
    }
  }

  Future<void> signOut() async {
    // Show loading widget till we sign out
    Get.dialog(Center(child: KLoadingWidget()), barrierDismissible: false);
    GoogleSignIn().signOut();
    await _firebaseAuth.signOut();
    Get.back();
    // Navigate to Login again
    Get.offNamed(Routes.LOGIN);
  }

  Future<void> checkUserLoggedIn() async {
    _firebaseAuth.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
        fireUser = null;
      } else {
        print('User is signed in!');
        fireUser = user;
      }
    });
    // if (firebaseAuth == null) {
    //   firebaseAuth = FirebaseAuth.instance;
    //   update();
    // }
    // if (firebaseAuth.currentUser == null) {
    //   Get.offNamed(Routes.LOGIN);
    // } else {
    //   firebaseUser = firebaseAuth.currentUser;
    //   update();
    //   Get.offNamed(Routes.HOME);
    // }
  }
}
