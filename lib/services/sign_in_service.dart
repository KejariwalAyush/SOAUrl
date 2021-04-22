import 'dart:developer';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:soaurl/constants.dart';

class SignInService {
  static final _auth = FirebaseAuth.instance;
  // static User user;

  static Future<String> signInWithGoogle() async {
    if (kIsWeb) {
      // The `GoogleAuthProvider` can only be used while running on the web
      GoogleAuthProvider authProvider = GoogleAuthProvider();

      try {
        final UserCredential userCredential =
            await _auth.signInWithPopup(authProvider);

        user = userCredential.user;
      } catch (e) {
        print(e);
      }
    } else {
      try {
        final GoogleSignInAccount googleSignInAccount =
            await GoogleSignIn().signIn();
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        final UserCredential authResult =
            await _auth.signInWithCredential(credential);
        user = authResult.user;
      } on Exception catch (e) {
        log('Error in Signing in:' + e.toString());
      }
    }

    if (user != null) {
      assert(!user.isAnonymous);
      assert(await user.getIdToken() != null);

      final User currentUser = _auth.currentUser;
      assert(user.uid == currentUser.uid);
      Fluttertoast.showToast(msg: 'Signed in Sucessfully');

      log('signInWithGoogle succeeded: $user');

      return '$user';
    }
    Fluttertoast.showToast(
      msg: 'Google Signed in Failed!',
      gravity: ToastGravity.BOTTOM,
      textColor: Colors.red,
    );

    return null;
  }

  static Future<void> signOutGoogle() async {
    try {
      await GoogleSignIn().signOut();
    } on Exception catch (e) {
      log('Error while logging out' + e.toString());
    }

    log("User Signed Out");
  }

  static Future<void> deleteAccount() async {
    try {
      await _auth.currentUser.delete();
      await GoogleSignIn().disconnect();
    } on Exception catch (e) {
      Fluttertoast.showToast(
        msg: 'Account Deletion Failed!',
        gravity: ToastGravity.BOTTOM,
        textColor: Colors.red,
      );
      log('Error while deleting account' + e.toString());
    }
  }

  // static Future<void> signupWithEmailandPassword(
  //     {String email, String password}) async {
  //   try {
  //     var userCred = await _auth.createUserWithEmailAndPassword(
  //         email: email, password: password);
  //     user = userCred.user;
  //     log('Signed up: ' + user.toString());
  //     if (user != null) Fluttertoast.showToast(msg: 'Signed up Sucessfully');
  //     return null;
  //   } on Exception catch (e) {
  //     Fluttertoast.showToast(
  //       msg: 'Signed in Failed: ' + e.toString(),
  //       gravity: ToastGravity.BOTTOM,
  //       textColor: Colors.red,
  //     );
  //     log('Error Signing up: ' + e.toString());
  //   }
  // }

  // static Future<String> signinWithEmail({String email, String password}) async {
  //   try {
  //     var userCred = await _auth.signInWithEmailAndPassword(
  //         email: email, password: password);
  //     user = userCred.user;
  //     log('Signed in: ' + user.toString());
  //     if (user != null) Fluttertoast.showToast(msg: 'Signed in Sucessfully');

  //     return null;
  //   } on Exception catch (e) {
  //     Fluttertoast.showToast(
  //       msg: 'Signed in Failed: ' + e.toString(),
  //       gravity: ToastGravity.BOTTOM,
  //       textColor: Colors.red,
  //     );
  //     log('Error Signing in: ' + e.toString());
  //     return e.toString();
  //   }
  // }

  // static Future<void> signOutEmail() async {
  //   await _auth.signOut();
  //   return null;
  // }

  // static Future<void> resetPasswordwithEmail({String email}) async {
  //   await _auth.sendPasswordResetEmail(email: email);
  //   return null;
  // }

  /// Phone verification
  // static String _verificationId;
  // static Future<void> sendOTP(String phone) async {
  //   await _auth.verifyPhoneNumber(
  //     phoneNumber: phone.toString(),
  //     verificationCompleted: (PhoneAuthCredential phoneAuthCredential) async {
  //       await _auth.signInWithCredential(phoneAuthCredential);
  //       log("Phone number automatically verified and user signed in: ${_auth.currentUser.uid}");
  //       await user.updatePhoneNumber(phoneAuthCredential);
  //       log('Updated Phone no. of user');
  //     },
  //     verificationFailed: (error) =>
  //         log('Error verification failed: ' + error.message),
  //     codeSent: (verificationId, forceResendingToken) {
  //       _verificationId = verificationId;
  //       log(verificationId);
  //       log(forceResendingToken.toString());
  //     },
  //     codeAutoRetrievalTimeout: (verificationId) =>
  //         log('Timeout: ' + verificationId),
  //   );
  // }

  // static void signInWithPhoneNumber(String smsCode) async {
  //   try {
  //     final AuthCredential credential = PhoneAuthProvider.credential(
  //       verificationId: _verificationId,
  //       smsCode: smsCode,
  //     );

  //     final User user = (await _auth.signInWithCredential(credential)).user;

  //     log("Successfully signed in UID: ${user.uid}");
  //   } catch (e) {
  //     log("Failed to sign in: " + e.toString());
  //   }
  // }
}
