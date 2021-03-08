import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:soaurl/constants.dart';
import 'package:soaurl/home/MainScreen.dart';
import 'package:soaurl/login/verify_otp.dart';
import 'package:soaurl/models/about_user.dart';
import 'package:soaurl/widgets/background_widget.dart';

class VerificationPage extends StatefulWidget {
  @override
  _VerificationPageState createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  TextEditingController phoneController = new TextEditingController();
  TextEditingController otpController = new TextEditingController();

  User _firebaseUser;
  // ignore: unused_field
  String _status;
  bool isLoading = false;

  AuthCredential _phoneAuthCredential;
  String _verificationId;
  // ignore: unused_field
  int _code;

  @override
  void initState() {
    super.initState();
    _getFirebaseUser();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return new Scaffold(
      backgroundColor: Colors.white,
      body: BackgroundWidget(
        size: size,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                child: SvgPicture.asset(
              'assets/images/logo.svg',
              width: size.width * 0.5,
            )),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              // alignment: Alignment.centerLeft,
              child: Text(
                'SOAUrl',
                style: TextStyle(
                  fontSize: 45,
                  color: const Color(0xfff2eaff),
                  fontWeight: FontWeight.w700,
                  shadows: [
                    Shadow(
                      color: const Color(0xa1363636),
                      offset: Offset(0, 3),
                      blurRadius: 6,
                    )
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SingleChildScrollView(
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 30),
                  Padding(
                    padding: EdgeInsets.only(top: 15.0, bottom: 20.0),
                    child: Text(
                      "Verification",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 35.0,
                      ),
                    ),
                  ),
                  RichText(
                      text: TextSpan(
                          style:
                              TextStyle(color: Colors.white60, fontSize: 13.0),
                          children: [
                        TextSpan(
                            text: "We will send you a ",
                            style: TextStyle(
                              color: Colors.white60,
                              fontSize: 14.5,
                            )),
                        TextSpan(
                            text: "One Time Password",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white60,
                              fontSize: 14.5,
                            )),
                      ])),
                  RichText(
                      text: TextSpan(
                          style:
                              TextStyle(color: Colors.black87, fontSize: 13.0),
                          children: [
                        TextSpan(
                            text: "on your phone number",
                            style: TextStyle(
                              color: Colors.white60,
                              fontSize: 14.5,
                            )),
                      ])),
                  SizedBox(height: 15),
                  Container(
                    width: MediaQuery.of(context).size.width * .8,
                    child: TextFormField(
                      controller: phoneController,
                      enableInteractiveSelection: true,
                      keyboardType: TextInputType.number,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 5,
                          fontSize: 25),
                      decoration: InputDecoration(
                        // fillColor: Colors.grey[200],

                        hoverColor: Colors.white,
                        filled: true,
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(25.7),
                        ),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.0))),

                        prefixIcon: Padding(
                          padding: EdgeInsets.all(15),
                          child: RichText(
                            text: TextSpan(
                                style: Theme.of(context).textTheme.bodyText1,
                                // style: TextStyle(
                                //     color: Colors.black87, fontSize: 13.0),
                                children: [
                                  TextSpan(
                                      text: "+91 ",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 25,
                                      )),
                                  TextSpan(
                                      text: " | ",
                                      style: TextStyle(
                                        color: Colors.white70,
                                        fontSize: 30.0,
                                      )),
                                ]),
                          ),
                        ),
                      ),
                      validator: (value) => value.length != 10
                          ? 'Incorrect number entered'
                          : null,
                    ),
                  ),
                  SizedBox(height: 15),
                  isLoading
                      ? CircularProgressIndicator()
                      : Container(
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.5),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30))),
                          height: 43.0,
                          width: MediaQuery.of(context).size.width * .8,
                          child: TextButton(
                              onPressed: _submitPhoneNumber,
                              child: Text("Send Code",
                                  style: new TextStyle(
                                      color: Colors.purple.shade900,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w700)))),
                  SizedBox(
                    height: 50.0,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _handleError(e) {
    print(e.message);
    Fluttertoast.showToast(msg: e.toString(), backgroundColor: Colors.red);
    setState(() {
      _status += e.message + '\n';
    });
  }

  Future<void> _getFirebaseUser() async {
    this._firebaseUser = FirebaseAuth.instance.currentUser;
    setState(() {
      _status =
          (_firebaseUser == null) ? 'Not Logged In\n' : 'Already LoggedIn\n';
    });
  }

  Future<void> _submitPhoneNumber() async {
    setState(() {
      isLoading = true;
    });

    /// NOTE: Either append your phone number country code or add in the code itself
    /// use "+91 " as prefix `phoneNumber`
    String phoneNumber = "+91 " + phoneController.text.toString().trim();
    log(phoneNumber);

    /// The below functions are the callbacks, separated so as to make code more redable
    void verificationCompleted(AuthCredential phoneAuthCredential) {
      try {
        log('verificationCompleted');
        setState(() {
          _status += 'verificationCompleted\n';
          isLoading = false;
        });
        this._phoneAuthCredential = phoneAuthCredential;
        Fluttertoast.showToast(msg: 'Verification Completed!');
        log(phoneAuthCredential.toString());
      } on Exception catch (e) {
        _handleError(e);
      }
    }

    void verificationFailed(FirebaseAuthException error) {
      log('verificationFailed');
      Fluttertoast.showToast(
          msg: 'Verification Failed!', backgroundColor: Colors.red);
      _handleError(error);
    }

    void codeSent(String verificationId, [int code]) {
      log('codeSent');
      this._verificationId = verificationId;
      log(verificationId);
      this._code = code;
      log(code.toString());
      setState(() {
        _status += 'Code Sent\n';
      });
      Fluttertoast.showToast(msg: 'Code Sent Sucessful!');
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => VerifyOTP(
              veryfyOtp: (String otp) => _submitOTP(otp),
              phone: phoneNumber,
            ),
          ));
    }

    void codeAutoRetrievalTimeout(String verificationId) {
      log('codeAutoRetrievalTimeout');
      setState(() {
        _status += 'codeAutoRetrievalTimeout\n';
      });
      log(verificationId);
    }

    await FirebaseAuth.instance.verifyPhoneNumber(
      /// Make sure to prefix with your country code
      phoneNumber: phoneNumber,

      /// `seconds` didn't work. The underlying implementation code only reads in `millisenconds`
      timeout: Duration(milliseconds: 10000),

      /// If the SIM (with phoneNumber) is in the current device this function is called.
      /// This function gives `AuthCredential`. Moreover `login` function can be called from this callback
      /// When this function is called there is no need to enter the OTP, you can click on Login button to sigin directly as the device is now verified
      verificationCompleted: verificationCompleted,

      /// Called when the verification is failed
      verificationFailed: verificationFailed,

      /// This is called after the OTP is sent. Gives a `verificationId` and `code`
      codeSent: codeSent,

      /// After automatic code retrival `tmeout` this function is called
      codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
    ); // All the callbacks are above
  }

  Future<void> _submitOTP(String otp) async {
    /// get the `smsCode` from the user
    String smsCode = otp.trim(); //otpController.text.toString().trim();

    /// when used different phoneNumber other than the current (running) device
    /// we need to use OTP to get `phoneAuthCredential` which is inturn used to signIn/login
    try {
      setState(() {
        this._phoneAuthCredential = PhoneAuthProvider.credential(
            verificationId: this._verificationId, smsCode: smsCode);
      });
      await FirebaseAuth.instance.currentUser
          .updatePhoneNumber(this._phoneAuthCredential);
      await FirebaseFirestore.instance.collection('users').doc(user.uid).set(
          AboutUser(
                  name: user.displayName,
                  phone: user.phoneNumber,
                  email: user.email,
                  id: user.uid)
              .toMap());
      Fluttertoast.showToast(msg: 'Phone No. Added Sucessful!');
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => MainScreen()),
          (route) => false);
    } on Exception catch (e) {
      Fluttertoast.showToast(
          msg: 'Error adding Phone No.: ' + e.toString(),
          backgroundColor: Colors.red);
      log(e.toString());
    }
  }

  // void _reset() {
  //   phoneController.clear();
  //   otpController.clear();
  //   setState(() {
  //     _status = "";
  //   });
  // }

  // void _displayUser() {
  //   setState(() {
  //     _status += _firebaseUser.toString() + '\n';
  //   });
  // }
}
