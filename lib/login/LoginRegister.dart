import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:soaurl/constants.dart';
import 'package:soaurl/home/MainScreen.dart';
import 'package:soaurl/login/verificaton_page.dart';
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
                    'assets/images/logo.svg',
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
                                'assets/images/google.svg',
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

// body: Stack(
//   children: <Widget>[
//     Transform.translate(
//       offset: Offset(-35.1, -38.0),
//       child:
//           // Adobe XD layer: 'BG' (group)
//           SizedBox(
//         width: 441.0,
//         height: 872.0,
//         child: Stack(
//           children: <Widget>[
//             Pinned.fromSize(
//               bounds: Rect.fromLTWH(35.1, 38.0, 375.0, 812.0),
//               size: Size(441.1, 871.6),
//               pinLeft: true,
//               pinRight: true,
//               pinTop: true,
//               pinBottom: true,
//               child: Container(
//                 decoration: BoxDecoration(
//                   gradient: LinearGradient(
//                     begin: Alignment(1.0, -1.0),
//                     end: Alignment(-1.0, 1.0),
//                     colors: [
//                       const Color(0xffc651cd),
//                       const Color(0xff441d7d)
//                     ],
//                     stops: [0.0, 1.0],
//                   ),
//                   border: Border.all(
//                       width: 1.0, color: const Color(0xff707070)),
//                 ),
//               ),
//             ),
//             Pinned.fromSize(
//               bounds: Rect.fromLTWH(0.0, 580.0, 291.6, 291.6),
//               size: Size(441.1, 871.6),
//               pinLeft: true,
//               pinBottom: true,
//               fixedWidth: true,
//               fixedHeight: true,
//               child: Stack(
//                 children: <Widget>[
//                   Pinned.fromSize(
//                     bounds: Rect.fromLTWH(0.0, 0.0, 121.5, 121.5),
//                     size: Size(291.6, 291.6),
//                     pinLeft: true,
//                     pinTop: true,
//                     fixedWidth: true,
//                     fixedHeight: true,
//                     child: SvgPicture.string(
//                       _svg_wkuy5m,
//                       allowDrawingOutsideViewBox: true,
//                       fit: BoxFit.fill,
//                     ),
//                   ),
//                   Pinned.fromSize(
//                     bounds: Rect.fromLTWH(32.4, 0.0, 259.2, 121.5),
//                     size: Size(291.6, 291.6),
//                     pinLeft: true,
//                     pinRight: true,
//                     pinTop: true,
//                     fixedHeight: true,
//                     child: SvgPicture.string(
//                       _svg_u1w7x8,
//                       allowDrawingOutsideViewBox: true,
//                       fit: BoxFit.fill,
//                     ),
//                   ),
//                   Pinned.fromSize(
//                     bounds: Rect.fromLTWH(0.0, 0.0, 291.6, 291.6),
//                     size: Size(291.6, 291.6),
//                     pinLeft: true,
//                     pinRight: true,
//                     pinTop: true,
//                     pinBottom: true,
//                     child: SvgPicture.string(
//                       _svg_oh57zq,
//                       allowDrawingOutsideViewBox: true,
//                       fit: BoxFit.fill,
//                     ),
//                   ),
//                   Pinned.fromSize(
//                     bounds: Rect.fromLTWH(32.4, 170.1, 259.2, 121.5),
//                     size: Size(291.6, 291.6),
//                     pinLeft: true,
//                     pinRight: true,
//                     pinBottom: true,
//                     fixedHeight: true,
//                     child: SvgPicture.string(
//                       _svg_fbn3cr,
//                       allowDrawingOutsideViewBox: true,
//                       fit: BoxFit.fill,
//                     ),
//                   ),
//                   Pinned.fromSize(
//                     bounds: Rect.fromLTWH(170.1, 178.2, 89.1, 81.0),
//                     size: Size(291.6, 291.6),
//                     pinRight: true,
//                     pinBottom: true,
//                     fixedWidth: true,
//                     fixedHeight: true,
//                     child: SvgPicture.string(
//                       _svg_c893sq,
//                       allowDrawingOutsideViewBox: true,
//                       fit: BoxFit.fill,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Pinned.fromSize(
//               bounds: Rect.fromLTWH(208.1, 0.0, 233.0, 233.0),
//               size: Size(441.1, 871.6),
//               pinRight: true,
//               pinTop: true,
//               fixedWidth: true,
//               fixedHeight: true,
//               child: Stack(
//                 children: <Widget>[
//                   Pinned.fromSize(
//                     bounds: Rect.fromLTWH(14.9, 76.0, 123.6, 149.3),
//                     size: Size(233.0, 233.0),
//                     pinLeft: true,
//                     pinBottom: true,
//                     fixedWidth: true,
//                     fixedHeight: true,
//                     child: SvgPicture.string(
//                       _svg_gd6rfi,
//                       allowDrawingOutsideViewBox: true,
//                       fit: BoxFit.fill,
//                     ),
//                   ),
//                   Pinned.fromSize(
//                     bounds: Rect.fromLTWH(94.4, 7.7, 123.6, 149.3),
//                     size: Size(233.0, 233.0),
//                     pinRight: true,
//                     pinTop: true,
//                     fixedWidth: true,
//                     fixedHeight: true,
//                     child: SvgPicture.string(
//                       _svg_fqurg7,
//                       allowDrawingOutsideViewBox: true,
//                       fit: BoxFit.fill,
//                     ),
//                   ),
//                   Pinned.fromSize(
//                     bounds: Rect.fromLTWH(0.0, 0.0, 233.0, 233.0),
//                     size: Size(233.0, 233.0),
//                     pinLeft: true,
//                     pinRight: true,
//                     pinTop: true,
//                     pinBottom: true,
//                     child: Container(
//                       decoration: BoxDecoration(
//                         color: const Color(0x17000000),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     ),
//     Transform.translate(
//       offset: Offset(120.0, 201.0),
//       child:
//           // Adobe XD layer: 'logo' (shape)
//           Container(
//         width: 137.0,
//         height: 137.0,
//         decoration: BoxDecoration(
//           image: DecorationImage(
//             image: const AssetImage(''),
//             fit: BoxFit.fill,
//           ),
//         ),
//       ),
//     ),
//     Transform.translate(
//       offset: Offset(66.0, 384.0),
//       child: Text(
//         'SOAUrl',
//         style: TextStyle(
//           fontFamily: 'Sitka Text',
//           fontSize: 65,
//           color: const Color(0xfff2eaff),
//           fontWeight: FontWeight.w700,
//           shadows: [
//             Shadow(
//               color: const Color(0xa1363636),
//               offset: Offset(0, 3),
//               blurRadius: 6,
//             )
//           ],
//         ),
//         textAlign: TextAlign.left,
//       ),
//     ),
//     Transform.translate(
//       offset: Offset(24.0, 599.0),
//       child:
//           // Adobe XD layer: 'Signin google' (group)
//           SizedBox(
//         width: 327.0,
//         height: 52.0,
//         child: Stack(
//           children: <Widget>[
//             Pinned.fromSize(
//               bounds: Rect.fromLTWH(0.0, 0.0, 327.0, 52.0),
//               size: Size(327.0, 52.0),
//               pinLeft: true,
//               pinRight: true,
//               pinTop: true,
//               pinBottom: true,
//               child: Container(
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(17.0),
//                   color: const Color(0xfff2eaff),
//                   border: Border.all(
//                       width: 1.0, color: const Color(0xff242424)),
//                   boxShadow: [
//                     BoxShadow(
//                       color: const Color(0xff363636),
//                       offset: Offset(0, 3),
//                       blurRadius: 6,
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             Pinned.fromSize(
//               bounds: Rect.fromLTWH(33.3, 10.6, 28.3, 29.0),
//               size: Size(327.0, 52.0),
//               pinLeft: true,
//               fixedWidth: true,
//               fixedHeight: true,
//               child: Stack(
//                 children: <Widget>[
//                   Pinned.fromSize(
//                     bounds: Rect.fromLTWH(0.0, 0.0, 28.3, 29.0),
//                     size: Size(28.3, 29.0),
//                     pinLeft: true,
//                     pinRight: true,
//                     pinTop: true,
//                     pinBottom: true,
//                     child: Stack(
//                       children: <Widget>[
//                         Pinned.fromSize(
//                           bounds: Rect.fromLTWH(-1.3, 5.9, 11.2, 17.1),
//                           size: Size(28.3, 29.0),
//                           pinLeft: true,
//                           pinTop: true,
//                           pinBottom: true,
//                           fixedWidth: true,
//                           child: SvgPicture.string(
//                             _svg_1a8ui2,
//                             allowDrawingOutsideViewBox: true,
//                             fit: BoxFit.fill,
//                           ),
//                         ),
//                         Pinned.fromSize(
//                           bounds: Rect.fromLTWH(0.0, 0.0, 28.3, 29.0),
//                           size: Size(28.3, 29.0),
//                           pinLeft: true,
//                           pinRight: true,
//                           pinTop: true,
//                           pinBottom: true,
//                           child: SvgPicture.string(
//                             _svg_k7w5z2,
//                             allowDrawingOutsideViewBox: true,
//                             fit: BoxFit.fill,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Pinned.fromSize(
//                     bounds: Rect.fromLTWH(0.0, 0.0, 28.3, 29.0),
//                     size: Size(28.3, 29.0),
//                     pinLeft: true,
//                     pinRight: true,
//                     pinTop: true,
//                     pinBottom: true,
//                     child: Stack(
//                       children: <Widget>[
//                         Pinned.fromSize(
//                           bounds: Rect.fromLTWH(-1.3, -1.3, 31.6, 15.8),
//                           size: Size(28.3, 29.0),
//                           pinLeft: true,
//                           pinRight: true,
//                           pinTop: true,
//                           fixedHeight: true,
//                           child: SvgPicture.string(
//                             _svg_omki8t,
//                             allowDrawingOutsideViewBox: true,
//                             fit: BoxFit.fill,
//                           ),
//                         ),
//                         Pinned.fromSize(
//                           bounds: Rect.fromLTWH(0.0, 0.0, 28.3, 29.0),
//                           size: Size(28.3, 29.0),
//                           pinLeft: true,
//                           pinRight: true,
//                           pinTop: true,
//                           pinBottom: true,
//                           child: SvgPicture.string(
//                             _svg_k7w5z2,
//                             allowDrawingOutsideViewBox: true,
//                             fit: BoxFit.fill,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Pinned.fromSize(
//                     bounds: Rect.fromLTWH(0.0, 0.0, 28.3, 29.0),
//                     size: Size(28.3, 29.0),
//                     pinLeft: true,
//                     pinRight: true,
//                     pinTop: true,
//                     pinBottom: true,
//                     child: Stack(
//                       children: <Widget>[
//                         Pinned.fromSize(
//                           bounds: Rect.fromLTWH(0.0, 0.0, 28.3, 29.0),
//                           size: Size(28.3, 29.0),
//                           pinLeft: true,
//                           pinRight: true,
//                           pinTop: true,
//                           pinBottom: true,
//                           child: Stack(
//                             children: <Widget>[
//                               Pinned.fromSize(
//                                 bounds:
//                                     Rect.fromLTWH(-1.3, -1.3, 31.6, 31.6),
//                                 size: Size(28.3, 29.0),
//                                 pinLeft: true,
//                                 pinRight: true,
//                                 pinTop: true,
//                                 pinBottom: true,
//                                 child: SvgPicture.string(
//                                   _svg_hc78bz,
//                                   allowDrawingOutsideViewBox: true,
//                                   fit: BoxFit.fill,
//                                 ),
//                               ),
//                               Pinned.fromSize(
//                                 bounds:
//                                     Rect.fromLTWH(0.0, 0.0, 28.3, 29.0),
//                                 size: Size(28.3, 29.0),
//                                 pinLeft: true,
//                                 pinRight: true,
//                                 pinTop: true,
//                                 pinBottom: true,
//                                 child: SvgPicture.string(
//                                   _svg_k7w5z2,
//                                   allowDrawingOutsideViewBox: true,
//                                   fit: BoxFit.fill,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Pinned.fromSize(
//                     bounds: Rect.fromLTWH(0.0, 0.0, 28.3, 29.0),
//                     size: Size(28.3, 29.0),
//                     pinLeft: true,
//                     pinRight: true,
//                     pinTop: true,
//                     pinBottom: true,
//                     child: Stack(
//                       children: <Widget>[
//                         Pinned.fromSize(
//                           bounds: Rect.fromLTWH(0.0, 0.0, 28.3, 29.0),
//                           size: Size(28.3, 29.0),
//                           pinLeft: true,
//                           pinRight: true,
//                           pinTop: true,
//                           pinBottom: true,
//                           child: Stack(
//                             children: <Widget>[
//                               Pinned.fromSize(
//                                 bounds:
//                                     Rect.fromLTWH(7.2, 5.9, 23.1, 24.4),
//                                 size: Size(28.3, 29.0),
//                                 pinRight: true,
//                                 pinBottom: true,
//                                 fixedWidth: true,
//                                 fixedHeight: true,
//                                 child: SvgPicture.string(
//                                   _svg_eg970e,
//                                   allowDrawingOutsideViewBox: true,
//                                   fit: BoxFit.fill,
//                                 ),
//                               ),
//                               Pinned.fromSize(
//                                 bounds:
//                                     Rect.fromLTWH(0.0, 0.0, 28.3, 29.0),
//                                 size: Size(28.3, 29.0),
//                                 pinLeft: true,
//                                 pinRight: true,
//                                 pinTop: true,
//                                 pinBottom: true,
//                                 child: SvgPicture.string(
//                                   _svg_k7w5z2,
//                                   allowDrawingOutsideViewBox: true,
//                                   fit: BoxFit.fill,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Pinned.fromSize(
//               bounds: Rect.fromLTWH(96.0, 16.0, 194.0, 20.0),
//               size: Size(327.0, 52.0),
//               pinRight: true,
//               fixedWidth: true,
//               fixedHeight: true,
//               child: Text(
//                 'Sign in with Google',
//                 style: TextStyle(
//                   fontFamily: 'Sitka Text',
//                   fontSize: 20,
//                   color: const Color(0xff363636),
//                   fontWeight: FontWeight.w700,
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//             ),
//           ],
//         ),
//       ),
//     ),
//     Transform.translate(
//       offset: Offset(24.0, 675.0),
//       child:
//           // Adobe XD layer: 'Signin google' (group)
//           SizedBox(
//         width: 327.0,
//         height: 52.0,
//         child: Stack(
//           children: <Widget>[
//             Pinned.fromSize(
//               bounds: Rect.fromLTWH(0.0, 0.0, 327.0, 52.0),
//               size: Size(327.0, 52.0),
//               pinLeft: true,
//               pinRight: true,
//               pinTop: true,
//               pinBottom: true,
//               child: ClipRect(
//                 child: BackdropFilter(
//                   filter: ui.ImageFilter.blur(sigmaX: 9.0, sigmaY: 9.0),
//                   child: Container(
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(17.0),
//                       color: const Color(0x0ef2eaff),
//                       border: Border.all(
//                           width: 1.0, color: const Color(0xe3242424)),
//                       boxShadow: [
//                         BoxShadow(
//                           color: const Color(0xe3363636),
//                           offset: Offset(0, 3),
//                           blurRadius: 6,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             Pinned.fromSize(
//               bounds: Rect.fromLTWH(71.0, 16.0, 188.0, 20.0),
//               size: Size(327.0, 52.0),
//               fixedWidth: true,
//               fixedHeight: true,
//               child: Text(
//                 'New here! Register',
//                 style: TextStyle(
//                   fontFamily: 'Sitka Text',
//                   fontSize: 20,
//                   color: const Color(0xfff2eaff),
//                   fontWeight: FontWeight.w700,
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//             ),
//           ],
//         ),
//       ),
//     ),
//   ],
// ),
// const String _svg_wkuy5m =
//     '<svg viewBox="6.0 6.0 121.5 121.5" ><path transform="translate(0.0, 0.0)" d="M 38.40066528320313 127.5025100708008 L 95.10182952880859 127.5025100708008 C 112.922233581543 127.5025100708008 127.5025100708008 112.922233581543 127.5025100708008 95.10182952880859 L 127.5025100708008 38.40066528320313 C 127.5025100708008 20.58030319213867 112.922233581543 6.000000953674316 95.10182952880859 6.000000953674316 L 38.40066528320313 6.000000953674316 C 20.58030319213867 6.000000953674316 6.000000953674316 20.58030319213867 6.000000953674316 38.40066528320313 L 6.000000953674316 95.10182952880859 C 6.000000953674316 112.922233581543 20.58030319213867 127.5025100708008 38.40066528320313 127.5025100708008 Z M 22.20033645629883 38.40066528320313 C 22.20033645629883 29.49048042297363 29.49048042297363 22.20033645629883 38.40066528320313 22.20033645629883 L 95.10182952880859 22.20033645629883 C 104.0120162963867 22.20033645629883 111.3021697998047 29.49048042297363 111.3021697998047 38.40066528320313 L 111.3021697998047 95.10182952880859 C 111.3021697998047 104.0120162963867 104.0120162963867 111.3021697998047 95.10182952880859 111.3021697998047 L 38.40066528320313 111.3021697998047 C 29.49048042297363 111.3021697998047 22.20033645629883 104.0120162963867 22.20033645629883 95.10182952880859 L 22.20033645629883 38.40066528320313 Z" fill="#e1b4e4" fill-opacity="0.12" stroke="none" stroke-width="1" stroke-opacity="0.12" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
// const String _svg_u1w7x8 =
//     '<svg viewBox="38.4 6.0 259.2 121.5" ><path transform="translate(28.4, 0.0)" d="M 28.63039398193359 95.10182952880859 L 48.88080596923828 95.10182952880859 C 58.60100173950195 95.10182952880859 67.51118469238281 87.00166320800781 67.51118469238281 76.47144317626953 L 67.51118469238281 56.22103500366211 C 67.51118469238281 46.50083923339844 59.41102600097656 37.59064483642578 48.88080596923828 37.59064483642578 L 28.63039398193359 37.59064483642578 C 18.10017776489258 38.40066528320313 10 46.50083923339844 10 57.03105545043945 L 10 77.28146362304688 C 10 87.00166320800781 18.10017776489258 95.10182952880859 28.63039398193359 95.10182952880859 Z M 26.20034027099609 57.03105545043945 C 26.20034027099609 56.22103500366211 27.0103588104248 54.60100173950195 28.63039398193359 54.60100173950195 L 48.88080596923828 54.60100173950195 C 49.69082641601563 54.60100173950195 51.31086730957031 55.41101837158203 51.31086730957031 57.03105545043945 L 51.31086730957031 77.28146362304688 C 51.31086730957031 78.09148406982422 50.5008430480957 79.71150970458984 48.88080596923828 79.71150970458984 L 28.63039398193359 79.71150970458984 C 27.82036781311035 79.71150970458984 26.20034027099609 78.90150451660156 26.20034027099609 77.28146362304688 L 26.20034027099609 57.03105545043945 Z M 269.2053527832031 38.40066528320313 C 269.2053527832031 20.58030319213867 254.6250915527344 6.000000953674316 236.8046722412109 6.000000953674316 L 180.1035308837891 6.000000953674316 C 162.2831573486328 6.000000953674316 147.7028503417969 20.58030319213867 147.7028503417969 38.40066528320313 L 147.7028503417969 95.10182952880859 C 147.7028503417969 112.922233581543 162.2831573486328 127.5025100708008 180.1035308837891 127.5025100708008 L 236.8046722412109 127.5025100708008 C 254.6250915527344 127.5025100708008 269.2053527832031 112.922233581543 269.2053527832031 95.10182952880859 L 269.2053527832031 38.40066528320313 Z M 253.0050048828125 95.10182952880859 C 253.0050048828125 104.0120162963867 245.7148590087891 111.3021697998047 236.8046722412109 111.3021697998047 L 180.1035308837891 111.3021697998047 C 171.1933441162109 111.3021697998047 163.9032135009766 104.0120162963867 163.9032135009766 95.10182952880859 L 163.9032135009766 38.40066528320313 C 163.9032135009766 29.49048042297363 171.1933441162109 22.20033645629883 180.1035308837891 22.20033645629883 L 236.8046722412109 22.20033645629883 C 245.7148590087891 22.20033645629883 253.0050048828125 29.49048042297363 253.0050048828125 38.40066528320313 L 253.0050048828125 95.10182952880859 Z" fill="#e1b4e4" fill-opacity="0.12" stroke="none" stroke-width="1" stroke-opacity="0.12" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
// const String _svg_oh57zq =
//     '<svg viewBox="6.0 6.0 291.6 291.6" ><path transform="translate(0.0, 0.0)" d="M 247.3849639892578 38.40066528320313 L 227.1345672607422 38.40066528320313 C 216.6043395996094 38.40066528320313 208.5041809082031 46.50083923339844 208.5041809082031 57.03105545043945 L 208.5041809082031 77.28146362304688 C 208.5041809082031 87.00166320800781 216.6043395996094 95.91185760498047 227.1345672607422 95.91185760498047 L 247.3849639892578 95.91185760498047 C 257.1051940917969 95.91185760498047 266.0153503417969 87.81169128417969 266.0153503417969 77.28146362304688 L 266.0153503417969 57.03105545043945 C 265.205322265625 46.50083923339844 257.1051940917969 38.40066528320313 247.3849639892578 38.40066528320313 Z M 249.0050201416016 77.28146362304688 C 249.0050201416016 78.09148406982422 248.1950225830078 79.71150970458984 246.5749816894531 79.71150970458984 L 226.3245697021484 79.71150970458984 C 225.5145263671875 79.71150970458984 223.8945159912109 78.90150451660156 223.8945159912109 77.28146362304688 L 223.8945159912109 57.03105545043945 C 223.8945159912109 56.22103500366211 224.7045135498047 54.60100173950195 226.3245697021484 54.60100173950195 L 246.5749816894531 54.60100173950195 C 247.3849639892578 54.60100173950195 249.0050201416016 55.41101837158203 249.0050201416016 57.03105545043945 L 249.0050201416016 77.28146362304688 Z M 289.505859375 143.7028503417969 L 14.10017013549805 143.7028503417969 C 9.240070343017578 143.7028503417969 6.000000953674316 146.9429016113281 6.000000953674316 151.8030242919922 C 6.000000953674316 156.6631317138672 9.240070343017578 159.9031829833984 14.10017013549805 159.9031829833984 L 289.505859375 159.9031829833984 C 294.3659362792969 159.9031829833984 297.6060180664063 156.6631317138672 297.6060180664063 151.8030242919922 C 297.6060180664063 146.9429016113281 294.3659362792969 143.7028503417969 289.505859375 143.7028503417969 Z M 159.9031829833984 119.4023284912109 L 159.9031829833984 14.10017013549805 C 159.9031829833984 9.240070343017578 156.6631317138672 6.000000953674316 151.8030242919922 6.000000953674316 C 146.9429016113281 6.000000953674316 143.7028503417969 9.240070343017578 143.7028503417969 14.10017013549805 L 143.7028503417969 119.4023284912109 C 143.7028503417969 124.262451171875 146.9429016113281 127.5025100708008 151.8030242919922 127.5025100708008 C 156.6631317138672 127.5025100708008 159.9031829833984 124.262451171875 159.9031829833984 119.4023284912109 Z M 159.9031829833984 289.505859375 L 159.9031829833984 184.2036895751953 C 159.9031829833984 179.3435668945313 156.6631317138672 176.1035003662109 151.8030242919922 176.1035003662109 C 146.9429016113281 176.1035003662109 143.7028503417969 179.3435668945313 143.7028503417969 184.2036895751953 L 143.7028503417969 289.505859375 C 143.7028503417969 294.3659362792969 146.9429016113281 297.6060180664063 151.8030242919922 297.6060180664063 C 156.6631317138672 297.6060180664063 159.9031829833984 294.3659362792969 159.9031829833984 289.505859375 Z M 38.40066528320313 297.6060180664063 L 95.10182952880859 297.6060180664063 C 112.922233581543 297.6060180664063 127.5025100708008 283.0257263183594 127.5025100708008 265.205322265625 L 127.5025100708008 208.5041809082031 C 127.5025100708008 190.6838073730469 112.922233581543 176.1035003662109 95.10182952880859 176.1035003662109 L 38.40066528320313 176.1035003662109 C 20.58030319213867 176.1035003662109 6.000000953674316 190.6838073730469 6.000000953674316 208.5041809082031 L 6.000000953674316 265.205322265625 C 6.000000953674316 283.0257263183594 20.58030319213867 297.6060180664063 38.40066528320313 297.6060180664063 Z M 22.20033645629883 208.5041809082031 C 22.20033645629883 199.5940093994141 29.49048042297363 192.3038635253906 38.40066528320313 192.3038635253906 L 95.10182952880859 192.3038635253906 C 104.0120162963867 192.3038635253906 111.3021697998047 199.5940093994141 111.3021697998047 208.5041809082031 L 111.3021697998047 265.205322265625 C 111.3021697998047 274.1155395507813 104.0120162963867 281.4056701660156 95.10182952880859 281.4056701660156 L 38.40066528320313 281.4056701660156 C 29.49048042297363 281.4056701660156 22.20033645629883 274.1155395507813 22.20033645629883 265.205322265625 L 22.20033645629883 208.5041809082031 Z" fill="#e1b4e4" fill-opacity="0.12" stroke="none" stroke-width="1" stroke-opacity="0.12" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
// const String _svg_fbn3cr =
//     '<svg viewBox="38.4 176.1 259.2 121.5" ><path transform="translate(28.4, 149.1)" d="M 28.63039398193359 116.1018371582031 L 48.88080596923828 116.1018371582031 C 58.60100173950195 116.1018371582031 67.51118469238281 108.0016784667969 67.51118469238281 97.47148895263672 L 67.51118469238281 77.22103881835938 C 67.51118469238281 67.50083923339844 59.41102600097656 58.59067916870117 48.88080596923828 58.59067916870117 L 28.63039398193359 58.59067916870117 C 18.10017776489258 59.40067291259766 10 67.50083923339844 10 78.03104400634766 L 10 98.28147888183594 C 10 108.0016784667969 18.10017776489258 116.1018371582031 28.63039398193359 116.1018371582031 Z M 26.20034027099609 78.03104400634766 C 26.20034027099609 77.22103881835938 27.0103588104248 75.60100555419922 28.63039398193359 75.60100555419922 L 48.88080596923828 75.60100555419922 C 49.69082641601563 75.60100555419922 51.31086730957031 76.4110107421875 51.31086730957031 78.03104400634766 L 51.31086730957031 98.28147888183594 C 51.31086730957031 99.09148406982422 50.5008430480957 100.7115249633789 48.88080596923828 100.7115249633789 L 28.63039398193359 100.7115249633789 C 27.82036781311035 100.7115249633789 26.20034027099609 99.90151214599609 26.20034027099609 98.28147888183594 L 26.20034027099609 78.03104400634766 Z M 269.2053527832031 35.10018539428711 C 269.2053527832031 30.24007415771484 265.9652709960938 27.00000381469727 261.1051940917969 27.00000381469727 C 256.2450866699219 27.00000381469727 253.0050048828125 30.24007415771484 253.0050048828125 35.10018539428711 L 253.0050048828125 116.1018371582031 C 253.0050048828125 125.0120468139648 245.7148590087891 132.3021697998047 236.8046722412109 132.3021697998047 L 155.8030395507813 132.3021697998047 C 150.9429321289063 132.3021697998047 147.7028503417969 135.5422668457031 147.7028503417969 140.40234375 C 147.7028503417969 145.2624206542969 150.9429321289063 148.5025329589844 155.8030395507813 148.5025329589844 L 236.8046722412109 148.5025329589844 C 254.6250915527344 148.5025329589844 269.2053527832031 133.9222412109375 269.2053527832031 116.1018371582031 L 269.2053527832031 35.10018539428711 Z" fill="#e1b4e4" fill-opacity="0.12" stroke="none" stroke-width="1" stroke-opacity="0.12" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
// const String _svg_c893sq =
//     '<svg viewBox="176.1 184.2 89.1 81.0" ><path transform="translate(149.1, 156.2)" d="M 35.10018539428711 109.0016708374023 L 108.0016784667969 109.0016708374023 C 112.8617553710938 109.0016708374023 116.1018371582031 105.7615966796875 116.1018371582031 100.9015197753906 C 116.1018371582031 96.04140472412109 112.8617553710938 92.80133819580078 108.0016784667969 92.80133819580078 L 35.10018539428711 92.80133819580078 C 30.24007415771484 92.80133819580078 27.00000381469727 96.04140472412109 27.00000381469727 100.9015197753906 C 27.00000381469727 105.7615966796875 30.24007415771484 109.0016708374023 35.10018539428711 109.0016708374023 Z M 35.10018539428711 44.20033645629883 L 108.0016784667969 44.20033645629883 C 112.8617553710938 44.20033645629883 116.1018371582031 40.96026229858398 116.1018371582031 36.10017395019531 C 116.1018371582031 31.24006271362305 112.8617553710938 28.00000762939453 108.0016784667969 28.00000762939453 L 35.10018539428711 28.00000762939453 C 30.24007415771484 28.00000762939453 27.00000381469727 31.24006271362305 27.00000381469727 36.10017395019531 C 27.00000381469727 40.96026229858398 30.24007415771484 44.20033645629883 35.10018539428711 44.20033645629883 Z M 35.10018539428711 76.60100555419922 L 108.0016784667969 76.60100555419922 C 112.8617553710938 76.60100555419922 116.1018371582031 73.36092376708984 116.1018371582031 68.50083923339844 C 116.1018371582031 63.6407470703125 112.8617553710938 60.40066528320313 108.0016784667969 60.40066528320313 L 35.10018539428711 60.40066528320313 C 30.24007415771484 60.40066528320313 27.00000381469727 63.6407470703125 27.00000381469727 68.50083923339844 C 27.00000381469727 73.36092376708984 30.24007415771484 76.60100555419922 35.10018539428711 76.60100555419922 Z" fill="#e1b4e4" fill-opacity="0.12" stroke="none" stroke-width="1" stroke-opacity="0.12" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
// const String _svg_gd6rfi =
//     '<svg viewBox="14.5 75.4 123.6 149.3" ><path transform="translate(10.53, 54.53)" d="M 102.4639739990234 116.9760208129883 L 104.8575592041016 114.1254577636719 C 107.4941558837891 110.9847564697266 112.1834487915039 110.5749435424805 115.3241577148438 113.211540222168 L 121.0252838134766 117.9951248168945 C 124.1659927368164 120.6316986083984 124.5757904052734 125.3209991455078 121.9428329467773 128.4617004394531 L 119.5492477416992 131.312255859375 L 98.04667663574219 156.9020843505859 C 98.04667663574219 156.9020843505859 98.04667663574219 156.9020843505859 98.04667663574219 156.9020843505859 C 90.98915863037109 165.2942199707031 80.55160522460938 170.1612091064453 69.59540557861328 170.1612091064453 C 60.86962890625 170.1612091064453 52.40134429931641 167.0785369873047 45.71374893188477 161.4716949462891 L 17.26612281799316 137.5900573730469 C 17.26612281799316 137.5900573730469 17.26612281799316 137.5900573730469 17.26612281799316 137.5900573730469 C 8.873995780944824 130.5325317382813 4.007000923156738 120.0985946655273 4.007000923156738 109.1025238037109 C 4.007000923156738 100.3767395019531 7.089673042297363 91.94470977783203 12.73640632629395 85.26076507568359 L 55.70524215698242 34.08112716674805 C 55.70524215698242 34.04485702514648 55.70524215698242 34.04485702514648 55.70524215698242 34.04485702514648 C 62.76275253295898 25.65273284912109 73.20032501220703 20.8220100402832 84.15651702880859 20.8220100402832 C 92.88230133056641 20.8220100402832 101.3505783081055 23.90468406677246 108.0345458984375 29.5151424407959 L 122.1096649169922 41.32358932495117 L 124.9348373413086 43.70631790161133 C 128.0719146728516 46.34654235839844 128.4781036376953 51.0430793762207 125.8415145874023 54.18378829956055 L 121.090576171875 59.84864044189453 C 118.4575958251953 62.98935699462891 113.7683029174805 63.39916229248047 110.6276168823242 60.76619338989258 L 107.7770462036133 58.37260055541992 L 93.69830322265625 46.56051254272461 C 93.69830322265625 46.56051254272461 93.69830322265625 46.56051254272461 93.69830322265625 46.56051254272461 C 91.02544403076172 44.33373260498047 87.6453857421875 43.1079216003418 84.15651702880859 43.1079216003418 C 79.77187347412109 43.1079216003418 75.612060546875 45.03730773925781 72.79051208496094 48.38109970092773 L 29.78177261352539 99.59700012207031 C 29.78177261352539 99.59700012207031 29.78177261352539 99.59700012207031 29.78177261352539 99.59700012207031 C 27.55499839782715 102.2698593139648 26.29291152954102 105.6499328613281 26.29291152954102 109.1424102783203 C 26.29291152954102 113.5234375 28.25857162475586 117.683235168457 31.60236740112305 120.504768371582 L 60.04999923706055 144.3864440917969 C 60.04999923706055 144.3864440917969 60.04999923706055 144.3864440917969 60.04999923706055 144.3864440917969 C 62.72648620605469 146.6531066894531 66.10654449462891 147.8789215087891 69.59540557861328 147.8789215087891 C 73.98006439208984 147.8789215087891 78.13985443115234 145.9459075927734 80.96141815185547 142.5658264160156 L 102.4639739990234 116.9760208129883 Z" fill="#000000" fill-opacity="0.09" stroke="none" stroke-width="1" stroke-opacity="0.09" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
// const String _svg_fqurg7 =
//     '<svg viewBox="94.0 7.1 123.6 149.3" ><path transform="translate(68.09, 5.09)" d="M 51.03562545776367 55.18517684936523 L 48.64202117919922 58.03574371337891 C 46.00904846191406 61.17644500732422 41.31975173950195 61.58625793457031 38.17905807495117 58.94966506958008 L 32.47430419921875 54.16608047485352 C 29.33359718322754 51.52949142456055 28.92378807067871 46.84020233154297 31.56038093566895 43.69950103759766 L 33.9539794921875 40.84894180297852 L 55.45653533935547 15.25912284851074 C 55.45653533935547 15.25912284851074 55.45653533935547 15.25912284851074 55.45653533935547 15.25912284851074 C 62.5140495300293 6.866996288299561 72.94798278808594 2 83.9041748046875 2 C 92.63356781005859 2 101.1018600463867 5.082672119140625 107.7858200073242 10.6895112991333 L 136.2334747314453 34.57117080688477 C 136.2334747314453 34.57117080688477 136.2334747314453 34.57117080688477 136.2334747314453 34.57117080688477 C 144.6292114257813 41.6286735534668 149.4925689697266 52.06260681152344 149.4925689697266 63.05869293212891 C 149.4925689697266 71.78446197509766 146.4098968505859 80.21648406982422 140.7667999267578 86.90045166015625 L 97.79432678222656 138.0800933837891 C 97.79432678222656 138.1163635253906 97.79432678222656 138.1163635253906 97.79432678222656 138.1163635253906 C 90.73681640625 146.5084686279297 80.30287170410156 151.3392181396484 69.34669494628906 151.3392181396484 C 60.61729049682617 151.3392181396484 52.14901351928711 148.2565155029297 45.46505737304688 142.6460723876953 L 31.38992500305176 130.8376312255859 L 28.56473541259766 128.4548950195313 C 25.43128967285156 125.8146743774414 25.02510452270508 121.1181411743164 27.65807151794434 117.9774398803711 L 32.40901565551758 112.3125610351563 C 35.04560852050781 109.171875 39.73127365112305 108.7620468139648 42.87197494506836 111.39501953125 L 45.72616577148438 113.7886352539063 L 59.80128860473633 125.6007080078125 C 59.80128860473633 125.6007080078125 59.80128860473633 125.6007080078125 59.80128860473633 125.6007080078125 C 62.47414779663086 127.8274688720703 65.85420989990234 129.0532989501953 69.34669494628906 129.0532989501953 C 73.72772216796875 129.0532989501953 77.88752746582031 127.1239013671875 80.71269226074219 123.7800979614258 L 123.7178039550781 72.564208984375 C 123.7178039550781 72.564208984375 123.7178039550781 72.564208984375 123.7178039550781 72.564208984375 C 125.9482040405273 69.89134216308594 127.2102737426758 66.51127624511719 127.2102737426758 63.018798828125 C 127.2102737426758 58.63777160644531 125.2409896850586 54.47797012329102 121.8972091674805 51.65642166137695 L 93.44957733154297 27.77477645874023 C 93.44957733154297 27.77477645874023 93.44957733154297 27.77477645874023 93.44957733154297 27.77477645874023 C 90.77671051025391 25.50810241699219 87.39666748046875 24.28229141235352 83.9041748046875 24.28229141235352 C 79.52313995361328 24.28229141235352 75.36336517333984 26.21530532836914 72.54180145263672 29.59536743164063 L 51.03562545776367 55.18517684936523 Z" fill="#000000" fill-opacity="0.09" stroke="none" stroke-width="1" stroke-opacity="0.09" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
// const String _svg_1a8ui2 =
//     '<svg viewBox="-1.3 5.9 11.2 17.1" ><path transform="translate(369.48, -288.37)" d="M -370.7999877929688 311.4328918457031 L -370.7999877929688 294.2999877929688 L -359.5977172851563 302.866455078125 L -370.7999877929688 311.4328918457031 Z" fill="#fbbc05" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
// const String _svg_k7w5z2 =
//     '<svg viewBox="0.0 0.0 28.3 29.0" ><path transform="translate(368.8, -285.3)" d="M -340.7942810058594 297.1612243652344 L -354.3029174804688 297.1612243652344 L -354.3029174804688 302.7623901367188 L -346.5272216796875 302.7623901367188 C -347.2520751953125 306.3207702636719 -350.2832641601563 308.363525390625 -354.3029174804688 308.363525390625 C -359.0474243164063 308.363525390625 -362.869384765625 304.5415649414063 -362.869384765625 299.7970886230469 C -362.869384765625 295.0525512695313 -359.0474243164063 291.2306213378906 -354.3029174804688 291.2306213378906 C -352.2601318359375 291.2306213378906 -350.4150390625 291.9554748535156 -348.96533203125 293.1416015625 L -344.7479858398438 288.9242553710938 C -347.3179321289063 286.6838073730469 -350.6127319335938 285.2999877929688 -354.3029174804688 285.2999877929688 C -362.3422241210938 285.2999877929688 -368.7999877929688 291.7577514648438 -368.7999877929688 299.7970886230469 C -368.7999877929688 307.8363647460938 -362.3422241210938 314.2941589355469 -354.3029174804688 314.2941589355469 C -347.0543823242188 314.2941589355469 -340.4647827148438 309.0224914550781 -340.4647827148438 299.7970886230469 C -340.4647827148438 298.9404296875 -340.5965881347656 298.0178833007813 -340.7942810058594 297.1612243652344 Z" fill="#000000" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
// const String _svg_omki8t =
//     '<svg viewBox="-1.3 -1.3 31.6 15.8" ><path transform="translate(369.48, -284.62)" d="M -370.7999877929688 290.5485229492188 L -359.5977172851563 299.114990234375 L -354.9850158691406 295.0953369140625 L -339.1700134277344 292.525390625 L -339.1700134277344 283.2999877929688 L -370.7999877929688 283.2999877929688 L -370.7999877929688 290.5485229492188 Z" fill="#ea4335" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
// const String _svg_hc78bz =
//     '<svg viewBox="-1.3 -1.3 31.6 31.6" ><path transform="translate(369.48, -284.62)" d="M -370.7999877929688 307.6814270019531 L -351.03125 292.525390625 L -345.8255004882813 293.1843566894531 L -339.1700134277344 283.2999877929688 L -339.1700134277344 314.9299621582031 L -370.7999877929688 314.9299621582031 L -370.7999877929688 307.6814270019531 Z" fill="#34a853" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
// const String _svg_eg970e =
//     '<svg viewBox="7.2 5.9 23.1 24.4" ><path transform="translate(365.05, -288.37)" d="M -334.7364501953125 318.6814270019531 L -355.1641540527344 302.866455078125 L -357.7999877929688 300.8895568847656 L -334.7364501953125 294.2999877929688 L -334.7364501953125 318.6814270019531 Z" fill="#4285f4" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
