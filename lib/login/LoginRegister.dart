import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:soaurl/constants.dart';
import 'package:soaurl/home/MainScreen.dart';
import 'package:soaurl/login/verificaton_page.dart';
import 'package:soaurl/services/download_web.dart';
import 'package:soaurl/services/sign_in_service.dart';
import 'package:soaurl/widgets/background_widget.dart';
import 'package:soaurl/widgets/delayed_animations.dart';

class LoginRegister extends StatefulWidget {
  LoginRegister({
    Key key,
  }) : super(key: key);

  @override
  _LoginRegisterState createState() => _LoginRegisterState();
}

class _LoginRegisterState extends State<LoginRegister>
    with SingleTickerProviderStateMixin {
  final int delayedAmount = 500;
  // double _scale;
  AnimationController _controller;
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 200,
      ),
      lowerBound: 0.0,
      upperBound: 0.1,
    )..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // _scale = 1 - _controller.value;
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffffffff),
        body: BackgroundWidget(
          size: size,
          child: Container(
            padding: EdgeInsets.all(20),
            // height: size.height * 0.1,
            width: size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                DelayedAnimation(
                  delay: delayedAmount,
                  child: Container(
                      child: SvgPicture.asset(
                    'assets/icons/logo.svg',
                    width: size.width * 0.5,
                  )),
                ),
                DelayedAnimation(
                  delay: delayedAmount + 200,
                  child: Container(
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
                ),
                SizedBox(
                  height: 10,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    DelayedAnimation(
                      delay: delayedAmount + 600,
                      child: TextButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.transparent)),
                        // color: Colors.transparent,
                        onPressed: () => SignInService.signInWithGoogle().then(
                            (value) => value == null
                                ? null
                                : Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            user.phoneNumber == null
                                                ? VerificationPage()
                                                : MainScreen()),
                                    (route) => false)),
                        child: Container(
                          padding: EdgeInsets.all(10),
                          // margin: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.6),
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SvgPicture.asset(
                                'assets/icons/google.svg',
                                width: 30,
                              ),
                              Text(
                                'Login with Google!',
                                style: TextStyle(
                                  fontSize: 25,
                                  // color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    DelayedAnimation(
                      delay: delayedAmount + 900,
                      child: TextButton(
                        // style: ButtonStyle(
                        //     backgroundColor: MaterialStateProperty.all<Color>(
                        //         Colors.transparent)),
                        onPressed: () => SignInService.signInWithGoogle().then(
                            (value) => value == null
                                ? null
                                : Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            user.phoneNumber == null
                                                ? VerificationPage()
                                                : MainScreen()),
                                    (route) => false)),
                        child: Text(
                          'New Here! Register here',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class WebLandingPage extends StatefulWidget {
  const WebLandingPage({Key key}) : super(key: key);

  @override
  _WebLandingPageState createState() => _WebLandingPageState();
}

class _WebLandingPageState extends State<WebLandingPage>
    with SingleTickerProviderStateMixin {
  final int delayedAmount = 500;
  // double _scale;
  AnimationController _controller;
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 200,
      ),
      lowerBound: 0.0,
      upperBound: 0.1,
    )..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: BackgroundWidget(
        size: size,
        child: Container(
          alignment: Alignment.topCenter,
          child: Column(
            children: [
              DelayedAnimation(
                delay: delayedAmount,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                            child: SvgPicture.asset(
                          'assets/icons/logo.svg',
                          width: 50,
                        )),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          // alignment: Alignment.centerLeft,
                          child: Text(
                            'SOAUrl',
                            style: TextStyle(
                              fontSize: 25,
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
                      ],
                    ),
                    GestureDetector(
                      onTap: () => SignInService.signInWithGoogle().then(
                          (value) => value == null
                              ? null
                              : Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          user.phoneNumber == null
                                              ? VerificationPage()
                                              : MainScreen()),
                                  (route) => false)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: AutoSizeText(
                          'Login',
                          maxFontSize: 25,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              DelayedAnimation(
                delay: delayedAmount + 200,
                child: Wrap(
                  // alignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  direction: Axis.horizontal,
                  children: [
                    Container(
                      width: size.width > 700 ? 350 : size.width,
                      padding: EdgeInsets.all(10),
                      alignment: Alignment.center,
                      child: SvgPicture.asset(
                        'assets/images/url_illustration.svg',
                        width: size.width > 700 ? size.width * 0.35 : 250,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10.0),
                      width: size.width > 700 ? (size.width * 0.5) : size.width,
                      // height: 250, //size.width > 700 ? 250 : 200,
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: size.width > 700
                            ? MainAxisAlignment.center
                            : MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          AutoSizeText(
                            'Better Shorten then Regreting!',
                            maxFontSize: 45,
                            minFontSize: 30,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          AutoSizeText(
                            'A URL shortener built with powerful tools to make your long url easy to remeber which leads to your growth and helps you get great numbers of clicks on your link.',
                            maxFontSize: 30,
                            minFontSize: 18,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                onPressed: () {},
                                style: ButtonStyle(
                                    padding: MaterialStateProperty.all(
                                        EdgeInsets.all(15)),
                                    backgroundColor: MaterialStateProperty.all(
                                        Colors.white)),
                                child: Text(
                                  'Download Our App',
                                  style: TextStyle(
                                      fontSize: size.width > 700 ? 25 : 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                              ),
                              TextButton(
                                onPressed: () =>
                                    SignInService.signInWithGoogle().then(
                                        (value) => value == null
                                            ? null
                                            : Navigator.pushAndRemoveUntil(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        user.phoneNumber == null
                                                            ? VerificationPage()
                                                            : MainScreen()),
                                                (route) => false)),
                                style: ButtonStyle(
                                  padding: MaterialStateProperty.all(
                                      EdgeInsets.all(15)),
                                  // backgroundColor: MaterialStateProperty.all(
                                  //     Colors.blueGrey[200]),
                                ),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: SvgPicture.asset(
                                        'assets/icons/google.svg',
                                        width: 25,
                                      ),
                                    ),
                                    Text(
                                      'Register Here',
                                      style: TextStyle(
                                          fontSize: size.width > 700 ? 25 : 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // DelayedAnimation(
              //   delay: delayedAmount + 400,
              // child:
              // )
            ],
          ),
        ),
      ),
    );
  }
}
