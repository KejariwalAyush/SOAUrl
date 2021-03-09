import 'package:animations/animations.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:soaurl/home/Profile.dart';
import 'package:soaurl/home/components/active_urls_container.dart';
import 'package:soaurl/home/components/short_url_button.dart';
import 'package:soaurl/login/LoginRegister.dart';
import 'package:soaurl/qr/generate_qr.dart';
import 'package:soaurl/qr/scan_qr.dart';
import 'package:soaurl/services/sign_in_service.dart';
import 'package:soaurl/url/short_url_page.dart';
import 'package:soaurl/widgets/background_widget.dart';
import 'package:soaurl/widgets/menu_widget.dart';

import 'components/generate_qr_button.dart';
import 'components/scan_qr_button.dart';

class MainScreen extends StatelessWidget {
  MainScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey<SliderMenuContainerState> _key =
        new GlobalKey<SliderMenuContainerState>();
    Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () {
        if (_key.currentState.isDrawerOpen) {
          _key.currentState.closeDrawer();
          return Future.value(false);
        } else
          return Future.value(true);
      },
      child: SafeArea(
        child: SliderMenuContainer(
          hasAppBar: false,
          key: _key,
          animationDuration: 300,
          isDraggable: false,
          sliderMenuOpenSize: size.width * 0.6,
          slideDirection: SlideDirection.RIGHT_TO_LEFT,
          sliderMenu: MenuWidget(
            onItemClick: () {
              _key.currentState.closeDrawer();
            },
          ),
          sliderMain: Scaffold(
            backgroundColor: const Color(0xffffffff),
            body: Container(
              width: size.width,
              height: size.height,
              child: BackgroundWidget(
                size: size,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.all(20),
                        // height: size.height * 0.1,
                        width: size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            OpenContainer(
                              closedBuilder: (context, action) =>
                                  SvgPicture.asset(
                                'assets/icons/profile.svg',
                                allowDrawingOutsideViewBox: true,
                                fit: BoxFit.fill,
                                height: 30,
                              ),
                              openBuilder: (context, action) => ProfilePage(),
                              closedElevation: 0,
                              openElevation: 0,
                              closedColor: Colors.transparent,
                              openColor: Colors.transparent,
                            ),
                            GestureDetector(
                              onTap: () {
                                (_key.currentState?.isDrawerOpen ?? false)
                                    ? _key.currentState.closeDrawer()
                                    : _key.currentState.openDrawer();
                              },
                              child: RotatedBox(
                                quarterTurns: 2,
                                child: SvgPicture.asset(
                                  'assets/icons/menu.svg',
                                  allowDrawingOutsideViewBox: true,
                                  fit: BoxFit.fill,
                                  height: 30,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          Container(
                              alignment: Alignment.centerLeft,
                              child: SvgPicture.asset(
                                'assets/icons/logo.svg',
                                width: size.width * 0.5,
                              )),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            alignment: Alignment.centerLeft,
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
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      OpenContainer(
                        closedBuilder: (context, action) =>
                            ShortUrlButton(size: size),
                        openBuilder: (context, action) => ShortUrlPage(),
                        closedElevation: 0,
                        openElevation: 0,
                        closedColor: Colors.transparent,
                        openColor: Colors.transparent,
                      ),
                      // if (!kIsWeb)
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            OpenContainer(
                              closedBuilder: (context, action) =>
                                  ScanQrButton(size: size),
                              openBuilder: (context, action) => ScanQR(),
                              closedElevation: 0,
                              openElevation: 0,
                              closedColor: Colors.transparent,
                              openColor: Colors.transparent,
                            ),
                            OpenContainer(
                              closedBuilder: (context, action) =>
                                  GenerateQrButton(size: size),
                              openBuilder: (context, action) => GenerateQR(),
                              closedElevation: 0,
                              openElevation: 0,
                              closedColor: Colors.transparent,
                              openColor: Colors.transparent,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ActiveUrlsContainer(size: size),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class WebMainScreen extends StatelessWidget {
  const WebMainScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: BackgroundWidget(
        size: size,
        child: Scrollbar(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
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
                      onTap: () => SignInService.signOutGoogle().then((value) =>
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => WebLandingPage()),
                              (route) => false)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: AutoSizeText(
                          'Logout',
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
                Wrap(
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
                          ElevatedButton(
                            onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ShortUrlPage(),
                                )),
                            style: ButtonStyle(
                                padding: MaterialStateProperty.all(
                                    EdgeInsets.all(15)),
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.white)),
                            child: AutoSizeText(
                              'Shorten Url Now',
                              maxFontSize: 25,
                              minFontSize: 18,
                              style: TextStyle(
                                  // fontSize:
                                  //     size.width > 700 ? 25 : 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                ActiveUrlsContainer(size: size),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
