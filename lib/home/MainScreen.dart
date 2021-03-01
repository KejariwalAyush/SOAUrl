import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:soaurl/home/Profile.dart';
import 'package:soaurl/qr/generate_qr.dart';
import 'package:soaurl/qr/scan_qr.dart';
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
                                'assets/images/profile.svg',
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
                                  'assets/images/menu.svg',
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
                                'assets/images/logo.svg',
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
                      ShortUrlButton(size: size),
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
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Your Active Short Urls',
                          style: TextStyle(
                            fontSize: 25,
                            color: const Color(0xfff2eaff),
                            fontWeight: FontWeight.w700,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
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

class ShortUrlButton extends StatelessWidget {
  const ShortUrlButton({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      height: size.height * 0.20,
      width: size.width,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        color: Colors.black.withOpacity(0.65),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text.rich(
              TextSpan(
                style: TextStyle(
                  // fontFamily: 'Sitka Display',
                  fontSize: 20,
                  color: const Color(0xffffffff),
                ),
                children: [
                  TextSpan(
                    text: 'Make your\n',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  TextSpan(
                    text: 'URL short',
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: false),
              textAlign: TextAlign.left,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: SvgPicture.asset(
                'assets/images/url.svg',
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
