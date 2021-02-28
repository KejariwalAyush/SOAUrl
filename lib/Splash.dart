import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:soaurl/constants.dart';
import 'package:soaurl/home/MainScreen.dart';
import 'package:soaurl/login/LoginRegister.dart';

class Splash extends StatefulWidget {
  Splash({
    Key key,
  }) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  final _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    user = _auth.currentUser;
    // Future.microtask(() => _getDatafromFirestore()).whenComplete(() => nav());
    Future.delayed(Duration(seconds: 3)).whenComplete(() => nav());
  }

  nav() async {
    if (user != null) {
      log('User Present');
      log(user.toString());
      log("Phone: " + user.phoneNumber);
      // if (user.phoneNumber != null && user.phoneNumber.isNotEmpty) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => MainScreen()),
          (route) => false);
      // } else
      //   Navigator.pushAndRemoveUntil(
      //       context,
      //       MaterialPageRoute(builder: (context) => VerificationPage()),
      //       (route) => false);
    } else {
      log("***User not loggedin!***");
      return Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (BuildContext context) => LoginRegister()));
    }
  }

  _getDatafromFirestore() async {
    var x = await FirebaseFirestore.instance
        .collection('resturants')
        .doc(user.uid)
        .get();
    if (x.data() != null) {
    } else
      return;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(1.0, -1.0),
            end: Alignment(-1.0, 1.0),
            colors: [const Color(0xffc651cd), const Color(0xff441d7d)],
            stops: [0.0, 1.0],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  // height: MediaQuery.of(context).size.height * 0.5,
                  child: Image.asset(
                'assets/images/logo-no-bg.png',
                height: 500,
              )),
              // SizedBox(
              //   height: 10,
              // ),
              Text(
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
            ],
          ),
        ),
      ),
    );
  }
}
