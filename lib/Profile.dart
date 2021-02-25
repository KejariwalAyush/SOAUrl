import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'dart:ui' as ui;
import 'package:flutter_svg/flutter_svg.dart';

class Profile extends StatelessWidget {
  Profile({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          Transform.translate(
            offset: Offset(-128.5, -63.0),
            child:
                // Adobe XD layer: 'BG' (group)
                SizedBox(
              width: 592.0,
              height: 907.0,
              child: Stack(
                children: <Widget>[
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(128.5, 63.0, 375.0, 812.0),
                    size: Size(592.5, 906.9),
                    pinTop: true,
                    pinBottom: true,
                    fixedWidth: true,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment(1.0, -1.0),
                          end: Alignment(-1.0, 1.0),
                          colors: [
                            const Color(0xffc651cd),
                            const Color(0xff441d7d)
                          ],
                          stops: [0.0, 1.0],
                        ),
                        border: Border.all(
                            width: 1.0, color: const Color(0xff707070)),
                      ),
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(0.0, 544.0, 362.9, 362.9),
                    size: Size(592.5, 906.9),
                    pinLeft: true,
                    pinBottom: true,
                    fixedWidth: true,
                    fixedHeight: true,
                    child: Stack(
                      children: <Widget>[
                        Pinned.fromSize(
                          bounds: Rect.fromLTWH(0.0, 0.0, 151.2, 151.2),
                          size: Size(362.9, 362.9),
                          pinLeft: true,
                          pinTop: true,
                          fixedWidth: true,
                          fixedHeight: true,
                          child: SvgPicture.string(
                            _svg_qry4uq,
                            allowDrawingOutsideViewBox: true,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Pinned.fromSize(
                          bounds: Rect.fromLTWH(40.3, 0.0, 322.6, 151.2),
                          size: Size(362.9, 362.9),
                          pinLeft: true,
                          pinRight: true,
                          pinTop: true,
                          fixedHeight: true,
                          child: SvgPicture.string(
                            _svg_38h2we,
                            allowDrawingOutsideViewBox: true,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Pinned.fromSize(
                          bounds: Rect.fromLTWH(0.0, 0.0, 362.9, 362.9),
                          size: Size(362.9, 362.9),
                          pinLeft: true,
                          pinRight: true,
                          pinTop: true,
                          pinBottom: true,
                          child: SvgPicture.string(
                            _svg_yqw1dk,
                            allowDrawingOutsideViewBox: true,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Pinned.fromSize(
                          bounds: Rect.fromLTWH(40.3, 211.7, 322.6, 151.2),
                          size: Size(362.9, 362.9),
                          pinLeft: true,
                          pinRight: true,
                          pinBottom: true,
                          fixedHeight: true,
                          child: SvgPicture.string(
                            _svg_u0p44r,
                            allowDrawingOutsideViewBox: true,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Pinned.fromSize(
                          bounds: Rect.fromLTWH(211.7, 221.8, 110.9, 100.8),
                          size: Size(362.9, 362.9),
                          pinRight: true,
                          pinBottom: true,
                          fixedWidth: true,
                          fixedHeight: true,
                          child: SvgPicture.string(
                            _svg_35qjgu,
                            allowDrawingOutsideViewBox: true,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(265.5, 0.0, 327.0, 327.0),
                    size: Size(592.5, 906.9),
                    pinRight: true,
                    pinTop: true,
                    fixedWidth: true,
                    fixedHeight: true,
                    child: Stack(
                      children: <Widget>[
                        Pinned.fromSize(
                          bounds: Rect.fromLTWH(20.5, 106.3, 174.1, 210.5),
                          size: Size(327.0, 327.0),
                          pinLeft: true,
                          pinBottom: true,
                          fixedWidth: true,
                          fixedHeight: true,
                          child: SvgPicture.string(
                            _svg_wt85l0,
                            allowDrawingOutsideViewBox: true,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Pinned.fromSize(
                          bounds: Rect.fromLTWH(132.5, 10.1, 174.1, 210.5),
                          size: Size(327.0, 327.0),
                          pinRight: true,
                          pinTop: true,
                          fixedWidth: true,
                          fixedHeight: true,
                          child: SvgPicture.string(
                            _svg_aw5l11,
                            allowDrawingOutsideViewBox: true,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Pinned.fromSize(
                          bounds: Rect.fromLTWH(0.0, 0.0, 327.0, 327.0),
                          size: Size(327.0, 327.0),
                          pinLeft: true,
                          pinRight: true,
                          pinTop: true,
                          pinBottom: true,
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0x36000000),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(128.5, 817.0, 375.0, 58.0),
                    size: Size(592.5, 906.9),
                    pinBottom: true,
                    fixedWidth: true,
                    fixedHeight: true,
                    child:
                        // Adobe XD layer: 'Banner' (group)
                        Stack(
                      children: <Widget>[
                        Pinned.fromSize(
                          bounds: Rect.fromLTWH(0.0, 0.0, 375.0, 58.0),
                          size: Size(375.0, 58.0),
                          pinLeft: true,
                          pinRight: true,
                          pinTop: true,
                          pinBottom: true,
                          child: ClipRect(
                            child: BackdropFilter(
                              filter: ui.ImageFilter.blur(
                                  sigmaX: 23.0, sigmaY: 23.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: const Color(0x408739f9),
                                  border: Border.all(
                                      width: 1.0,
                                      color: const Color(0xff707070)),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Pinned.fromSize(
                          bounds: Rect.fromLTWH(98.0, 16.0, 179.0, 27.0),
                          size: Size(375.0, 58.0),
                          fixedWidth: true,
                          fixedHeight: true,
                          child: Text(
                            'Banner AD loading...',
                            style: TextStyle(
                              fontFamily: 'Segoe UI',
                              fontSize: 20,
                              color: const Color(0xffffffff),
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(25.0, 34.0),
            child: SvgPicture.string(
              _svg_gn4deo,
              allowDrawingOutsideViewBox: true,
            ),
          ),
          Transform.translate(
            offset: Offset(24.0, 222.0),
            child: Text(
              'User Name',
              style: TextStyle(
                fontFamily: 'Sitka Text',
                fontSize: 50,
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
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(24.0, 120.2),
            child: SizedBox(
              width: 76.0,
              height: 85.0,
              child: Stack(
                children: <Widget>[
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(14.3, 0.0, 47.7, 47.1),
                    size: Size(76.3, 84.8),
                    pinLeft: true,
                    pinRight: true,
                    pinTop: true,
                    fixedHeight: true,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                        color: const Color(0x66363636),
                        border: Border.all(
                            width: 1.0, color: const Color(0x66363636)),
                      ),
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(0.0, 56.5, 76.3, 28.3),
                    size: Size(76.3, 84.8),
                    pinLeft: true,
                    pinRight: true,
                    pinBottom: true,
                    fixedHeight: true,
                    child: SvgPicture.string(
                      _svg_inesvx,
                      allowDrawingOutsideViewBox: true,
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(22.0, 529.0),
            child:
                // Adobe XD layer: 'History button' (group)
                SizedBox(
              width: 328.0,
              height: 31.0,
              child: Stack(
                children: <Widget>[
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(0.0, 0.0, 328.0, 31.0),
                    size: Size(328.0, 31.0),
                    pinLeft: true,
                    pinRight: true,
                    pinTop: true,
                    pinBottom: true,
                    child: ClipRect(
                      child: BackdropFilter(
                        filter: ui.ImageFilter.blur(sigmaX: 14.0, sigmaY: 14.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(17.0),
                            color: Colors.transparent,
                            border: Border.all(
                                width: 1.0, color: const Color(0xff242424)),
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0xff363636),
                                offset: Offset(0, 3),
                                blurRadius: 6,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(129.0, 6.0, 70.0, 20.0),
                    size: Size(328.0, 31.0),
                    fixedWidth: true,
                    fixedHeight: true,
                    child: Text(
                      'History',
                      style: TextStyle(
                        fontFamily: 'Sitka Text',
                        fontSize: 20,
                        color: const Color(0xffcfb5d1),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(25.0, 481.0),
            child:
                // Adobe XD layer: 'saved qr button' (group)
                SizedBox(
              width: 327.0,
              height: 31.0,
              child: Stack(
                children: <Widget>[
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(0.0, 0.0, 327.0, 31.0),
                    size: Size(327.0, 31.0),
                    pinLeft: true,
                    pinRight: true,
                    pinTop: true,
                    pinBottom: true,
                    child: ClipRect(
                      child: BackdropFilter(
                        filter: ui.ImageFilter.blur(sigmaX: 14.0, sigmaY: 14.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(17.0),
                            color: Colors.transparent,
                            border: Border.all(
                                width: 1.0, color: const Color(0xff242424)),
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0xff363636),
                                offset: Offset(0, 3),
                                blurRadius: 6,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(115.0, 6.0, 98.0, 20.0),
                    size: Size(327.0, 31.0),
                    fixedWidth: true,
                    fixedHeight: true,
                    child: Text(
                      'Saved QRs',
                      style: TextStyle(
                        fontFamily: 'Sitka Text',
                        fontSize: 20,
                        color: const Color(0xffcfb5d1),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(24.0, 289.0),
            child:
                // Adobe XD layer: 'Info' (group)
                SizedBox(
              width: 328.0,
              height: 176.0,
              child: Stack(
                children: <Widget>[
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(0.0, 0.0, 328.0, 176.0),
                    size: Size(328.0, 176.0),
                    pinLeft: true,
                    pinRight: true,
                    pinTop: true,
                    pinBottom: true,
                    child: ClipRect(
                      child: BackdropFilter(
                        filter: ui.ImageFilter.blur(sigmaX: 14.0, sigmaY: 14.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(17.0),
                            color: const Color(0x17ffffff),
                            border: Border.all(
                                width: 1.0, color: const Color(0xe5242424)),
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0xe5363636),
                                offset: Offset(0, 3),
                                blurRadius: 6,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(44.0, 29.0, 68.0, 125.3),
                    size: Size(328.0, 176.0),
                    pinLeft: true,
                    pinBottom: true,
                    fixedWidth: true,
                    fixedHeight: true,
                    child:
                        // Adobe XD layer: 'QR Scans' (group)
                        Stack(
                      children: <Widget>[
                        Pinned.fromSize(
                          bounds: Rect.fromLTWH(14.0, 0.0, 37.5, 56.3),
                          size: Size(68.0, 125.3),
                          pinTop: true,
                          fixedWidth: true,
                          fixedHeight: true,
                          child:
                              // Adobe XD layer: 'QR Code-Smartphone-…' (group)
                              Stack(
                            children: <Widget>[
                              Pinned.fromSize(
                                bounds: Rect.fromLTWH(0.0, 0.0, 37.5, 56.3),
                                size: Size(37.5, 56.3),
                                pinLeft: true,
                                pinRight: true,
                                pinTop: true,
                                pinBottom: true,
                                child: SvgPicture.string(
                                  _svg_gibmxd,
                                  allowDrawingOutsideViewBox: true,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Pinned.fromSize(
                                bounds: Rect.fromLTWH(14.1, 46.9, 9.4, 5.6),
                                size: Size(37.5, 56.3),
                                pinBottom: true,
                                fixedWidth: true,
                                fixedHeight: true,
                                child: SvgPicture.string(
                                  _svg_8cizu5,
                                  allowDrawingOutsideViewBox: true,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Pinned.fromSize(
                                bounds: Rect.fromLTWH(12.0, 3.5, 2.0, 2.0),
                                size: Size(37.5, 56.3),
                                pinTop: true,
                                fixedWidth: true,
                                fixedHeight: true,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: const Color(0xff000000),
                                  ),
                                ),
                              ),
                              Pinned.fromSize(
                                bounds: Rect.fromLTWH(16.0, 3.5, 5.5, 2.0),
                                size: Size(37.5, 56.3),
                                pinTop: true,
                                fixedWidth: true,
                                fixedHeight: true,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: const Color(0xff000000),
                                  ),
                                ),
                              ),
                              Pinned.fromSize(
                                bounds: Rect.fromLTWH(8.4, 15.9, 20.6, 20.6),
                                size: Size(37.5, 56.3),
                                pinLeft: true,
                                pinRight: true,
                                fixedHeight: true,
                                child: SvgPicture.string(
                                  _svg_98ltv2,
                                  allowDrawingOutsideViewBox: true,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Pinned.fromSize(
                                bounds: Rect.fromLTWH(8.4, 23.4, 8.4, 5.6),
                                size: Size(37.5, 56.3),
                                fixedWidth: true,
                                fixedHeight: true,
                                child: SvgPicture.string(
                                  _svg_dp7bhp,
                                  allowDrawingOutsideViewBox: true,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Pinned.fromSize(
                                bounds: Rect.fromLTWH(25.3, 32.8, 3.8, 3.8),
                                size: Size(37.5, 56.3),
                                fixedWidth: true,
                                fixedHeight: true,
                                child: SvgPicture.string(
                                  _svg_ctm0e7,
                                  allowDrawingOutsideViewBox: true,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Pinned.fromSize(
                                bounds: Rect.fromLTWH(15.9, 28.1, 7.5, 8.4),
                                size: Size(37.5, 56.3),
                                fixedWidth: true,
                                fixedHeight: true,
                                child: SvgPicture.string(
                                  _svg_qnr75x,
                                  allowDrawingOutsideViewBox: true,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Pinned.fromSize(
                                bounds: Rect.fromLTWH(27.0, 23.5, 2.0, 7.5),
                                size: Size(37.5, 56.3),
                                fixedWidth: true,
                                fixedHeight: true,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: const Color(0xff000000),
                                  ),
                                ),
                              ),
                              Pinned.fromSize(
                                bounds: Rect.fromLTWH(18.5, 24.5, 3.0, 1.5),
                                size: Size(37.5, 56.3),
                                fixedWidth: true,
                                fixedHeight: true,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: const Color(0xff000000),
                                  ),
                                ),
                              ),
                              Pinned.fromSize(
                                bounds: Rect.fromLTWH(23.5, 31.0, 2.0, 2.0),
                                size: Size(37.5, 56.3),
                                fixedWidth: true,
                                fixedHeight: true,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: const Color(0xff000000),
                                  ),
                                ),
                              ),
                              Pinned.fromSize(
                                bounds: Rect.fromLTWH(15.9, 15.9, 5.6, 6.6),
                                size: Size(37.5, 56.3),
                                fixedWidth: true,
                                fixedHeight: true,
                                child: SvgPicture.string(
                                  _svg_6nk60h,
                                  allowDrawingOutsideViewBox: true,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Pinned.fromSize(
                                bounds: Rect.fromLTWH(23.5, 24.5, 2.0, 4.5),
                                size: Size(37.5, 56.3),
                                fixedWidth: true,
                                fixedHeight: true,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: const Color(0xff000000),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Pinned.fromSize(
                          bounds: Rect.fromLTWH(0.0, 74.3, 68.0, 51.0),
                          size: Size(68.0, 125.3),
                          pinLeft: true,
                          pinRight: true,
                          pinBottom: true,
                          fixedHeight: true,
                          child: Text.rich(
                            TextSpan(
                              style: TextStyle(
                                fontFamily: 'Sitka Text',
                                fontSize: 25,
                                color: const Color(0xff363636),
                              ),
                              children: [
                                TextSpan(
                                  text: '0\n',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                TextSpan(
                                  text: 'QR Scans',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                            textHeightBehavior: TextHeightBehavior(
                                applyHeightToFirstAscent: false),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(178.0, 29.0, 122.0, 125.0),
                    size: Size(328.0, 176.0),
                    pinRight: true,
                    pinBottom: true,
                    fixedWidth: true,
                    fixedHeight: true,
                    child:
                        // Adobe XD layer: 'Links Shortened' (group)
                        Stack(
                      children: <Widget>[
                        Pinned.fromSize(
                          bounds: Rect.fromLTWH(30.0, 0.0, 56.0, 56.0),
                          size: Size(122.0, 125.0),
                          pinTop: true,
                          fixedWidth: true,
                          fixedHeight: true,
                          child: Stack(
                            children: <Widget>[
                              Pinned.fromSize(
                                bounds: Rect.fromLTWH(3.5, 18.2, 29.9, 36.1),
                                size: Size(56.0, 56.0),
                                pinLeft: true,
                                pinBottom: true,
                                fixedWidth: true,
                                fixedHeight: true,
                                child: SvgPicture.string(
                                  _svg_1xn8n3,
                                  allowDrawingOutsideViewBox: true,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Pinned.fromSize(
                                bounds: Rect.fromLTWH(22.7, 1.6, 29.9, 36.1),
                                size: Size(56.0, 56.0),
                                pinRight: true,
                                pinTop: true,
                                fixedWidth: true,
                                fixedHeight: true,
                                child: SvgPicture.string(
                                  _svg_kte436,
                                  allowDrawingOutsideViewBox: true,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Pinned.fromSize(
                                bounds: Rect.fromLTWH(0.0, 0.0, 56.0, 56.0),
                                size: Size(56.0, 56.0),
                                pinLeft: true,
                                pinRight: true,
                                pinTop: true,
                                pinBottom: true,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: const Color(0xff363636),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Pinned.fromSize(
                          bounds: Rect.fromLTWH(0.0, 74.0, 122.0, 51.0),
                          size: Size(122.0, 125.0),
                          pinLeft: true,
                          pinRight: true,
                          pinBottom: true,
                          fixedHeight: true,
                          child: Text.rich(
                            TextSpan(
                              style: TextStyle(
                                fontFamily: 'Sitka Text',
                                fontSize: 25,
                                color: const Color(0xff363636),
                              ),
                              children: [
                                TextSpan(
                                  text: '0\n',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                TextSpan(
                                  text: 'Links Shortened',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                            textHeightBehavior: TextHeightBehavior(
                                applyHeightToFirstAscent: false),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(97.8, 728.0),
            child: SizedBox(
              width: 180.0,
              child: Text(
                'App Version 1.0.0',
                style: TextStyle(
                  fontFamily: 'Sitka Text',
                  fontSize: 20,
                  color: const Color(0xffcfb5d1),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

const String _svg_qry4uq =
    '<svg viewBox="6.0 6.0 151.2 151.2" ><path transform="translate(0.0, 0.0)" d="M 46.32592010498047 157.2222137451172 L 116.8962783813477 157.2222137451172 C 139.0755767822266 157.2222137451172 157.2222137451172 139.0755767822266 157.2222137451172 116.8962783813477 L 157.2222137451172 46.32592010498047 C 157.2222137451172 24.14666938781738 139.0755767822266 6.000000953674316 116.8962783813477 6.000000953674316 L 46.32592010498047 6.000000953674316 C 24.14666938781738 6.000000953674316 6.000000953674316 24.14666938781738 6.000000953674316 46.32592010498047 L 6.000000953674316 116.8962783813477 C 6.000000953674316 139.0755767822266 24.14666938781738 157.2222137451172 46.32592010498047 157.2222137451172 Z M 26.16296577453613 46.32592010498047 C 26.16296577453613 35.23628997802734 35.23628997802734 26.16296577453613 46.32592010498047 26.16296577453613 L 116.8962783813477 26.16296577453613 C 127.9859085083008 26.16296577453613 137.0592498779297 35.23628997802734 137.0592498779297 46.32592010498047 L 137.0592498779297 116.8962783813477 C 137.0592498779297 127.9859085083008 127.9859085083008 137.0592498779297 116.8962783813477 137.0592498779297 L 46.32592010498047 137.0592498779297 C 35.23628997802734 137.0592498779297 26.16296577453613 127.9859085083008 26.16296577453613 116.8962783813477 L 26.16296577453613 46.32592010498047 Z" fill="#e1b4e4" fill-opacity="0.12" stroke="none" stroke-width="1" stroke-opacity="0.12" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_38h2we =
    '<svg viewBox="46.3 6.0 322.6 151.2" ><path transform="translate(36.33, 0.0)" d="M 33.18741607666016 116.8962783813477 L 58.39111328125 116.8962783813477 C 70.48888397216797 116.8962783813477 81.57851409912109 106.8147964477539 81.57851409912109 93.70886993408203 L 81.57851409912109 68.50518035888672 C 81.57851409912109 56.40740966796875 71.49703979492188 45.31776809692383 58.39111328125 45.31776809692383 L 33.18741607666016 45.31776809692383 C 20.08149337768555 46.32592010498047 10 56.40740966796875 10 69.51333618164063 L 10 94.71701812744141 C 10 106.8147964477539 20.08149337768555 116.8962783813477 33.18741607666016 116.8962783813477 Z M 30.16296768188477 69.51333618164063 C 30.16296768188477 68.50518035888672 31.17111968994141 66.48888397216797 33.18741607666016 66.48888397216797 L 58.39111328125 66.48888397216797 C 59.39926528930664 66.48888397216797 61.41556930541992 67.49703216552734 61.41556930541992 69.51333618164063 L 61.41556930541992 94.71701812744141 C 61.41556930541992 95.72517395019531 60.40741348266602 97.74146270751953 58.39111328125 97.74146270751953 L 33.18741607666016 97.74146270751953 C 32.17925643920898 97.74146270751953 30.16296768188477 96.73332214355469 30.16296768188477 94.71701812744141 L 30.16296768188477 69.51333618164063 Z M 332.6073913574219 46.32592010498047 C 332.6073913574219 24.14666938781738 314.4607849121094 6.000000953674316 292.2814636230469 6.000000953674316 L 221.7111358642578 6.000000953674316 C 199.5318603515625 6.000000953674316 181.3851928710938 24.14666938781738 181.3851928710938 46.32592010498047 L 181.3851928710938 116.8962783813477 C 181.3851928710938 139.0755767822266 199.5318603515625 157.2222137451172 221.7111358642578 157.2222137451172 L 292.2814636230469 157.2222137451172 C 314.4607849121094 157.2222137451172 332.6073913574219 139.0755767822266 332.6073913574219 116.8962783813477 L 332.6073913574219 46.32592010498047 Z M 312.4444274902344 116.8962783813477 C 312.4444274902344 127.9859085083008 303.37109375 137.0592498779297 292.2814636230469 137.0592498779297 L 221.7111358642578 137.0592498779297 C 210.6214904785156 137.0592498779297 201.5481872558594 127.9859085083008 201.5481872558594 116.8962783813477 L 201.5481872558594 46.32592010498047 C 201.5481872558594 35.23628997802734 210.6214904785156 26.16296577453613 221.7111358642578 26.16296577453613 L 292.2814636230469 26.16296577453613 C 303.37109375 26.16296577453613 312.4444274902344 35.23628997802734 312.4444274902344 46.32592010498047 L 312.4444274902344 116.8962783813477 Z" fill="#e1b4e4" fill-opacity="0.12" stroke="none" stroke-width="1" stroke-opacity="0.12" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_yqw1dk =
    '<svg viewBox="6.0 6.0 362.9 362.9" ><path transform="translate(0.0, 0.0)" d="M 306.4281005859375 46.32592010498047 L 281.2244262695313 46.32592010498047 C 268.1184997558594 46.32592010498047 258.0370178222656 56.40740966796875 258.0370178222656 69.51333618164063 L 258.0370178222656 94.71701812744141 C 258.0370178222656 106.8147964477539 268.1184997558594 117.9044342041016 281.2244262695313 117.9044342041016 L 306.4281005859375 117.9044342041016 C 318.5259399414063 117.9044342041016 329.6155395507813 107.8229598999023 329.6155395507813 94.71701812744141 L 329.6155395507813 69.51333618164063 C 328.6073913574219 56.40740966796875 318.5259399414063 46.32592010498047 306.4281005859375 46.32592010498047 Z M 308.4444274902344 94.71701812744141 C 308.4444274902344 95.72517395019531 307.4363098144531 97.74146270751953 305.4200134277344 97.74146270751953 L 280.21630859375 97.74146270751953 C 279.2081298828125 97.74146270751953 277.1918640136719 96.73332214355469 277.1918640136719 94.71701812744141 L 277.1918640136719 69.51333618164063 C 277.1918640136719 68.50518035888672 278.1999816894531 66.48888397216797 280.21630859375 66.48888397216797 L 305.4200134277344 66.48888397216797 C 306.4281005859375 66.48888397216797 308.4444274902344 67.49703216552734 308.4444274902344 69.51333618164063 L 308.4444274902344 94.71701812744141 Z M 358.8518676757813 177.3851776123047 L 16.08148384094238 177.3851776123047 C 10.03259563446045 177.3851776123047 6.000000953674316 181.4177551269531 6.000000953674316 187.4666748046875 C 6.000000953674316 193.5155639648438 10.03259563446045 197.5481414794922 16.08148384094238 197.5481414794922 L 358.8518676757813 197.5481414794922 C 364.9007263183594 197.5481414794922 368.933349609375 193.5155639648438 368.933349609375 187.4666748046875 C 368.933349609375 181.4177551269531 364.9007263183594 177.3851776123047 358.8518676757813 177.3851776123047 Z M 197.5481414794922 147.1407165527344 L 197.5481414794922 16.08148384094238 C 197.5481414794922 10.03259563446045 193.5155639648438 6.000000953674316 187.4666748046875 6.000000953674316 C 181.4177551269531 6.000000953674316 177.3851776123047 10.03259563446045 177.3851776123047 16.08148384094238 L 177.3851776123047 147.1407165527344 C 177.3851776123047 153.1896362304688 181.4177551269531 157.2222137451172 187.4666748046875 157.2222137451172 C 193.5155639648438 157.2222137451172 197.5481414794922 153.1896362304688 197.5481414794922 147.1407165527344 Z M 197.5481414794922 358.8518676757813 L 197.5481414794922 227.7925872802734 C 197.5481414794922 221.7436828613281 193.5155639648438 217.7110900878906 187.4666748046875 217.7110900878906 C 181.4177551269531 217.7110900878906 177.3851776123047 221.7436828613281 177.3851776123047 227.7925872802734 L 177.3851776123047 358.8518676757813 C 177.3851776123047 364.9007263183594 181.4177551269531 368.933349609375 187.4666748046875 368.933349609375 C 193.5155639648438 368.933349609375 197.5481414794922 364.9007263183594 197.5481414794922 358.8518676757813 Z M 46.32592010498047 368.933349609375 L 116.8962783813477 368.933349609375 C 139.0755767822266 368.933349609375 157.2222137451172 350.7866821289063 157.2222137451172 328.6073913574219 L 157.2222137451172 258.0370178222656 C 157.2222137451172 235.8577575683594 139.0755767822266 217.7110900878906 116.8962783813477 217.7110900878906 L 46.32592010498047 217.7110900878906 C 24.14666938781738 217.7110900878906 6.000000953674316 235.8577575683594 6.000000953674316 258.0370178222656 L 6.000000953674316 328.6073913574219 C 6.000000953674316 350.7866821289063 24.14666938781738 368.933349609375 46.32592010498047 368.933349609375 Z M 26.16296577453613 258.0370178222656 C 26.16296577453613 246.9474029541016 35.23628997802734 237.8740844726563 46.32592010498047 237.8740844726563 L 116.8962783813477 237.8740844726563 C 127.9859085083008 237.8740844726563 137.0592498779297 246.9474029541016 137.0592498779297 258.0370178222656 L 137.0592498779297 328.6073913574219 C 137.0592498779297 339.6970520019531 127.9859085083008 348.7703552246094 116.8962783813477 348.7703552246094 L 46.32592010498047 348.7703552246094 C 35.23628997802734 348.7703552246094 26.16296577453613 339.6970520019531 26.16296577453613 328.6073913574219 L 26.16296577453613 258.0370178222656 Z" fill="#e1b4e4" fill-opacity="0.12" stroke="none" stroke-width="1" stroke-opacity="0.12" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_u0p44r =
    '<svg viewBox="46.3 217.7 322.6 151.2" ><path transform="translate(36.33, 190.71)" d="M 33.18741607666016 137.8962860107422 L 58.39111328125 137.8962860107422 C 70.48888397216797 137.8962860107422 81.57851409912109 127.8148193359375 81.57851409912109 114.7089233398438 L 81.57851409912109 89.50518798828125 C 81.57851409912109 77.40740966796875 71.49703979492188 66.31781005859375 58.39111328125 66.31781005859375 L 33.18741607666016 66.31781005859375 C 20.08149337768555 67.325927734375 10 77.40740966796875 10 90.51332092285156 L 10 115.717041015625 C 10 127.8148193359375 20.08149337768555 137.8962860107422 33.18741607666016 137.8962860107422 Z M 30.16296768188477 90.51332092285156 C 30.16296768188477 89.50518798828125 31.17111968994141 87.4888916015625 33.18741607666016 87.4888916015625 L 58.39111328125 87.4888916015625 C 59.39926528930664 87.4888916015625 61.41556930541992 88.49702453613281 61.41556930541992 90.51332092285156 L 61.41556930541992 115.717041015625 C 61.41556930541992 116.7251739501953 60.40741348266602 118.7414855957031 58.39111328125 118.7414855957031 L 33.18741607666016 118.7414855957031 C 32.17925643920898 118.7414855957031 30.16296768188477 117.7333374023438 30.16296768188477 115.717041015625 L 30.16296768188477 90.51332092285156 Z M 332.6073913574219 37.08150100708008 C 332.6073913574219 31.03260040283203 328.5747680664063 27.00000381469727 322.5259094238281 27.00000381469727 C 316.47705078125 27.00000381469727 312.4444274902344 31.03260040283203 312.4444274902344 37.08150100708008 L 312.4444274902344 137.8962860107422 C 312.4444274902344 148.9859466552734 303.37109375 158.0592498779297 292.2814636230469 158.0592498779297 L 191.4667053222656 158.0592498779297 C 185.4178009033203 158.0592498779297 181.3851928710938 162.0918884277344 181.3851928710938 168.1407470703125 C 181.3851928710938 174.1896057128906 185.4178009033203 178.2222290039063 191.4667053222656 178.2222290039063 L 292.2814636230469 178.2222290039063 C 314.4607849121094 178.2222290039063 332.6073913574219 160.0755920410156 332.6073913574219 137.8962860107422 L 332.6073913574219 37.08150100708008 Z" fill="#e1b4e4" fill-opacity="0.12" stroke="none" stroke-width="1" stroke-opacity="0.12" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_35qjgu =
    '<svg viewBox="217.7 227.8 110.9 100.8" ><path transform="translate(190.71, 199.79)" d="M 37.08150100708008 128.8148040771484 L 127.8148193359375 128.8148040771484 C 133.8636779785156 128.8148040771484 137.8962860107422 124.7822036743164 137.8962860107422 118.7333450317383 C 137.8962860107422 112.684440612793 133.8636779785156 108.6518402099609 127.8148193359375 108.6518402099609 L 37.08150100708008 108.6518402099609 C 31.03260040283203 108.6518402099609 27.00000381469727 112.684440612793 27.00000381469727 118.7333450317383 C 27.00000381469727 124.7822036743164 31.03260040283203 128.8148040771484 37.08150100708008 128.8148040771484 Z M 37.08150100708008 48.1629638671875 L 127.8148193359375 48.1629638671875 C 133.8636779785156 48.1629638671875 137.8962860107422 44.13036346435547 137.8962860107422 38.08148956298828 C 137.8962860107422 32.03258514404297 133.8636779785156 28.0000057220459 127.8148193359375 28.0000057220459 L 37.08150100708008 28.0000057220459 C 31.03260040283203 28.0000057220459 27.00000381469727 32.03258514404297 27.00000381469727 38.08148956298828 C 27.00000381469727 44.13036346435547 31.03260040283203 48.1629638671875 37.08150100708008 48.1629638671875 Z M 37.08150100708008 88.48888397216797 L 127.8148193359375 88.48888397216797 C 133.8636779785156 88.48888397216797 137.8962860107422 84.45627593994141 137.8962860107422 78.40740966796875 C 137.8962860107422 72.35852813720703 133.8636779785156 68.32592010498047 127.8148193359375 68.32592010498047 L 37.08150100708008 68.32592010498047 C 31.03260040283203 68.32592010498047 27.00000381469727 72.35852813720703 27.00000381469727 78.40740966796875 C 27.00000381469727 84.45627593994141 31.03260040283203 88.48888397216797 37.08150100708008 88.48888397216797 Z" fill="#e1b4e4" fill-opacity="0.12" stroke="none" stroke-width="1" stroke-opacity="0.12" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_wt85l0 =
    '<svg viewBox="20.5 106.1 174.1 210.5" ><path transform="translate(16.47, 85.3)" d="M 142.7578735351563 156.3274230957031 L 146.1310424804688 152.3102569580078 C 149.8466796875 147.8842010498047 156.455078125 147.3066864013672 160.8811340332031 151.0223236083984 L 168.9154663085938 157.7636108398438 C 173.3415222167969 161.4792022705078 173.9190368652344 168.0876159667969 170.2085266113281 172.5136566162109 L 166.8353576660156 176.5308227539063 L 136.5327758789063 212.5933990478516 C 136.5327758789063 212.5933990478516 136.5327758789063 212.5933990478516 136.5327758789063 212.5933990478516 C 126.5869522094727 224.4200286865234 111.8777770996094 231.2788543701172 96.43772125244141 231.2788543701172 C 84.14089202880859 231.2788543701172 72.20692443847656 226.9345855712891 62.78240966796875 219.0331268310547 L 22.69247055053711 185.3778228759766 C 22.69247055053711 185.3778228759766 22.69247055053711 185.3778228759766 22.69247055053711 185.3778228759766 C 10.8658332824707 175.4319915771484 4.007000923156738 160.7279205322266 4.007000923156738 145.2316741943359 C 4.007000923156738 132.934814453125 8.351268768310547 121.0519561767578 16.3089485168457 111.632568359375 L 76.86295318603516 39.50747299194336 C 76.86295318603516 39.45635604858398 76.86295318603516 39.45635604858398 76.86295318603516 39.45635604858398 C 86.80877685546875 27.62972640991211 101.5179672241211 20.8220100402832 116.9580078125 20.8220100402832 C 129.2548522949219 20.8220100402832 141.1888122558594 25.16627883911133 150.6082153320313 33.07284164428711 L 170.4436340332031 49.71394729614258 L 174.4250183105469 53.07181167602539 C 178.845947265625 56.79255294799805 179.4183654785156 63.41117477416992 175.7027587890625 67.83721923828125 L 169.0074768066406 75.82044982910156 C 165.2969360351563 80.24650573730469 158.6885375976563 80.82402038574219 154.2625122070313 77.11351013183594 L 150.2453308105469 73.74032592773438 L 130.4048156738281 57.09409713745117 C 130.4048156738281 57.09409713745117 130.4048156738281 57.09409713745117 130.4048156738281 57.09409713745117 C 126.638069152832 53.95599746704102 121.8747024536133 52.22851181030273 116.9580078125 52.22851181030273 C 110.7789306640625 52.22851181030273 104.9167098999023 54.94751358032227 100.9404296875 59.65976333618164 L 40.33020401000977 131.8359680175781 C 40.33020401000977 131.8359680175781 40.33020401000977 131.8359680175781 40.33020401000977 131.8359680175781 C 37.19211196899414 135.6027069091797 35.41351318359375 140.3660888671875 35.41351318359375 145.2878723144531 C 35.41351318359375 151.4618530273438 38.18362426757813 157.3240661621094 42.89588165283203 161.3003234863281 L 82.98581695556641 194.9556579589844 C 82.98581695556641 194.9556579589844 82.98581695556641 194.9556579589844 82.98581695556641 194.9556579589844 C 86.75766754150391 198.1499633789063 91.52103424072266 199.87744140625 96.43772125244141 199.87744140625 C 102.616813659668 199.87744140625 108.4790115356445 197.1533508300781 112.4552993774414 192.3899536132813 L 142.7578735351563 156.3274230957031 Z" fill="#000000" fill-opacity="0.21" stroke="none" stroke-width="1" stroke-opacity="0.21" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_aw5l11 =
    '<svg viewBox="132.5 9.9 174.1 210.5" ><path transform="translate(106.56, 7.92)" d="M 61.31386947631836 76.95142364501953 L 57.94067001342773 80.96858978271484 C 54.23015213012695 85.39463806152344 47.62173843383789 85.97216796875 43.19570541381836 82.25653839111328 L 35.15625381469727 75.5152587890625 C 30.73020553588867 71.79962921142578 30.15267562866211 65.19123077392578 33.86830520629883 60.76518630981445 L 37.24148941040039 56.74802017211914 L 67.54405212402344 20.68547058105469 C 67.54405212402344 20.68547058105469 67.54405212402344 20.68547058105469 67.54405212402344 20.68547058105469 C 77.48988342285156 8.858833312988281 92.19395446777344 2 107.6340026855469 2 C 119.9359436035156 2 131.8699188232422 6.344268321990967 141.289306640625 14.24572944641113 L 181.3792572021484 47.90104675292969 C 181.3792572021484 47.90104675292969 181.3792572021484 47.90104675292969 181.3792572021484 47.90104675292969 C 193.2109985351563 57.84686660766602 200.0647277832031 72.55092620849609 200.0647277832031 88.04720306396484 C 200.0647277832031 100.3440322875977 195.7204437255859 112.2268905639648 187.7678833007813 121.6462860107422 L 127.2087554931641 193.7713928222656 C 127.2087554931641 193.822509765625 127.2087554931641 193.822509765625 127.2087554931641 193.822509765625 C 117.262939453125 205.6491394042969 102.5588531494141 212.4568786621094 87.11882019042969 212.4568786621094 C 74.81686401367188 212.4568786621094 62.88291549682617 208.1125793457031 53.46352005004883 200.2060241699219 L 33.62809371948242 183.5649261474609 L 29.64668655395508 180.2070617675781 C 25.23086166381836 176.4863128662109 24.65844345092773 169.8676910400391 28.36896133422852 165.441650390625 L 35.06425094604492 157.4584045410156 C 38.77987289428711 153.0323791503906 45.3831672668457 152.454833984375 49.80920791625977 156.1653594970703 L 53.83148574829102 159.5385589599609 L 73.66691589355469 176.1847839355469 C 73.66691589355469 176.1847839355469 73.66691589355469 176.1847839355469 73.66691589355469 176.1847839355469 C 77.43365478515625 179.3228607177734 82.197021484375 181.0503540039063 87.11882019042969 181.0503540039063 C 93.29280090332031 181.0503540039063 99.15501403808594 178.3313446044922 103.1363983154297 173.6190795898438 L 163.7415161132813 101.4428939819336 C 163.7415161132813 101.4428939819336 163.7415161132813 101.4428939819336 163.7415161132813 101.4428939819336 C 166.8847198486328 97.6761474609375 168.6632995605469 92.91278076171875 168.6632995605469 87.99098205566406 C 168.6632995605469 81.81700897216797 165.8880767822266 75.95478820800781 161.1758422851563 71.97850799560547 L 121.0858917236328 38.32320785522461 C 121.0858917236328 38.32320785522461 121.0858917236328 38.32320785522461 121.0858917236328 38.32320785522461 C 117.3191528320313 35.12888717651367 112.5558166503906 33.40140533447266 107.6340026855469 33.40140533447266 C 101.4600067138672 33.40140533447266 95.59782409667969 36.12551498413086 91.62153625488281 40.88888168334961 L 61.31386947631836 76.95142364501953 Z" fill="#000000" fill-opacity="0.21" stroke="none" stroke-width="1" stroke-opacity="0.21" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_gn4deo =
    '<svg viewBox="25.0 34.0 39.3 39.3" ><path transform="translate(20.0, 29.0)" d="M 31.22222137451172 5 L 18.11111068725586 5 C 10.8735408782959 5.008429050445557 5.008430004119873 10.87353801727295 5 18.11111068725586 L 5 31.22222137451172 C 5.008430004119873 38.45980072021484 10.87354183197021 44.32490921020508 18.11111450195313 44.33333587646484 L 31.22222137451172 44.33333206176758 C 38.45979690551758 44.32490539550781 44.32490921020508 38.45979309082031 44.33333587646484 31.22222137451172 L 44.33333206176758 18.11111068725586 C 44.32490921020508 10.87353992462158 38.45979690551758 5.008430004119873 31.22222328186035 5 Z M 41.41975021362305 31.22222137451172 C 41.41373443603516 36.85166549682617 36.85166549682617 41.41373443603516 31.22222137451172 41.41975402832031 L 22.48148155212402 41.41975021362305 C 16.04497909545898 41.41975021362305 10.8271598815918 36.20193481445313 10.8271598815918 29.76543045043945 C 10.8271598815918 26.53427124023438 11.07699966430664 23.62651634216309 7.913579940795898 21.21553039550781 L 7.913579940795898 18.11111068725586 C 7.91960334777832 12.48166370391846 12.48166847229004 7.919600009918213 18.11111259460449 7.913579940795898 L 31.22222137451172 7.913579940795898 C 36.85166549682617 7.919600486755371 41.41373443603516 12.48166656494141 41.41975402832031 18.11111068725586 L 41.41975021362305 31.22222137451172 Z M 34.67481231689453 24.66666603088379 C 34.67481231689453 25.47122764587402 34.0225830078125 26.12345695495605 33.21802139282227 26.12345695495605 L 19.23939514160156 26.12345695495605 L 24.08395004272461 31.89890098571777 C 24.43718719482422 32.29507827758789 24.5469913482666 32.85202026367188 24.37056159973145 33.35262298583984 C 24.19413185119629 33.85322570800781 23.75939178466797 34.2182502746582 23.23581504821777 34.3054084777832 C 22.71223640441895 34.3925666809082 22.18268966674805 34.18805694580078 21.85360527038574 33.77160263061523 L 14.99867820739746 25.6033821105957 C 14.99430751800537 25.59828186035156 14.99212169647217 25.59172821044922 14.98775291442871 25.58662986755371 C 14.97099876403809 25.56623458862305 14.95715999603271 25.54438400268555 14.94186401367188 25.52325820922852 C 14.9163703918457 25.48902320861816 14.89379024505615 25.45041847229004 14.8690242767334 25.41691207885742 C 14.85445594787598 25.39214706420898 14.83697414398193 25.36956787109375 14.82313537597656 25.34407424926758 C 14.80929660797119 25.31858062744141 14.8049259185791 25.30182838439941 14.79472827911377 25.27997398376465 C 14.77724647521973 25.24282646179199 14.7626781463623 25.2071361541748 14.74811172485352 25.16415977478027 C 14.73791408538818 25.13574981689453 14.7240743637085 25.10880088806152 14.71606159210205 25.07966423034668 C 14.70804977416992 25.05052757263184 14.70659255981445 25.03595924377441 14.70149326324463 25.01338005065918 C 14.69148349761963 24.97378540039063 14.68370246887207 24.93366241455078 14.67818355560303 24.8931941986084 C 14.67308616638184 24.86405754089355 14.66580200195313 24.83492088317871 14.66288948059082 24.8050594329834 C 14.6599760055542 24.77519798278809 14.66288948059082 24.75261688232422 14.66288948059082 24.72639274597168 C 14.66288948059082 24.70016860961914 14.65633296966553 24.68705749511719 14.65633296966553 24.66666412353516 C 14.65633296966553 24.64626884460449 14.66143131256104 24.62732887268066 14.66288948059082 24.60693359375 C 14.66434669494629 24.58654022216797 14.66288948059082 24.55448913574219 14.66288948059082 24.52826690673828 C 14.66288948059082 24.50204658508301 14.67308616638184 24.46926879882813 14.67818546295166 24.44013214111328 C 14.68370246887207 24.39966583251953 14.69148349761963 24.35954093933105 14.70149326324463 24.3199462890625 C 14.70659255981445 24.29736518859863 14.70950603485107 24.2755126953125 14.71606159210205 24.253662109375 C 14.72261810302734 24.2318115234375 14.73791408538818 24.19757652282715 14.74811172485352 24.16916847229004 C 14.75830936431885 24.14076232910156 14.77724838256836 24.09050178527832 14.79472827911377 24.05335426330566 C 14.8049259185791 24.03150177001953 14.81221008300781 24.01037788391113 14.82313537597656 23.98925590515137 C 14.83406066894531 23.96813201904297 14.85445594787598 23.94118118286133 14.8690242767334 23.91641616821289 C 14.89087677001953 23.87999725341797 14.91345691680908 23.84357643127441 14.94186401367188 23.8100700378418 C 14.95715999603271 23.78894805908203 14.97100067138672 23.7670955657959 14.98775291442871 23.74670028686523 C 14.9921236038208 23.74160194396973 14.99430847167969 23.73504447937012 14.99867820739746 23.72994613647461 L 21.85360527038574 15.56172752380371 C 22.37782669067383 14.97378063201904 23.27445602416992 14.90902900695801 23.87771606445313 15.41555500030518 C 24.48097610473633 15.92208003997803 24.57233238220215 16.81639099121094 24.08395004272461 17.4344310760498 L 19.23939514160156 23.20987510681152 L 33.21802520751953 23.20987510681152 C 34.02258682250977 23.20987510681152 34.6748161315918 23.86210441589355 34.6748161315918 24.66666603088379 Z" fill="#222222" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_inesvx =
    '<svg viewBox="0.0 56.5 76.3 28.3" ><path transform="translate(0.0, 43.21)" d="M 76.29072570800781 27.50778388977051 L 76.29072570800781 27.50778388977051 C 76.31235504150391 27.1723461151123 76.31235504150391 26.83606147766113 76.29072570800781 26.50104141235352 C 76.19658660888672 25.26148796081543 75.84503173828125 24.05162620544434 75.25557708740234 22.93801879882813 C 72.93678283691406 18.40685272216797 66.43580627441406 16.35436248779297 61.01112747192383 15.19241523742676 C 57.14107513427734 14.38669109344482 53.20869827270508 13.8689022064209 49.2508659362793 13.64329433441162 L 45.11025619506836 13.33330154418945 L 43.24690628051758 13.33330154418945 L 40.92788696289063 13.33330154418945 L 35.37912368774414 13.33330154418945 L 33.06023406982422 13.33330154418945 L 31.19683647155762 13.33330154418945 L 27.05597877502441 13.64329433441162 C 23.09840393066406 13.8689022064209 19.16610336303711 14.38669109344482 15.29593181610107 15.19241523742676 C 9.871417999267578 16.19915771484375 3.370240211486816 18.29066276550293 1.051354289054871 22.93801879882813 C 0.4621623158454895 24.05162620544434 0.1105423048138618 25.26148796081543 0.01613906212151051 26.50104141235352 C -0.005379687529057264 26.83606147766113 -0.005379687529057264 27.1723461151123 0.01613906212151051 27.50778388977051 L 0.01613906212151051 27.50778388977051 C -0.003728811396285892 27.84322357177734 -0.003728811396285892 28.17950820922852 0.01613906212151051 28.5145263671875 C 0.1287708729505539 29.74347114562988 0.4943576157093048 30.94020080566406 1.092764496803284 32.03895568847656 C 3.411650419235229 36.57011795043945 9.912807464599609 38.62261581420898 15.33736228942871 39.78456115722656 C 19.21474647521973 40.55254364013672 23.14403533935547 41.06990432739258 27.09741020202637 41.33368301391602 L 31.23826789855957 41.60466384887695 L 32.23207092285156 41.60466384887695 L 33.10166549682617 41.60466384887695 L 43.28804397583008 41.60466384887695 L 44.15780639648438 41.60466384887695 L 45.15139389038086 41.60466384887695 L 49.29242706298828 41.33368301391602 C 53.24601364135742 41.06990432739258 57.17499923706055 40.55254364013672 61.05268478393555 39.78456115722656 C 66.47693634033203 38.73880386352539 72.97834014892578 36.68631744384766 75.29714202880859 32.03895568847656 C 75.86751556396484 30.90541648864746 76.21821594238281 29.68579483032227 76.33229064941406 28.43734741210938 C 76.33737945556641 28.12692070007324 76.32380676269531 27.8165111541748 76.29072570800781 27.50778388977051 Z" fill="#363636" stroke="#363636" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_gibmxd =
    '<svg viewBox="12.0 2.0 37.5 56.3" ><path  d="M 43.875 2 L 17.625 2 C 14.51968383789063 2.003099679946899 12.00310134887695 4.519682884216309 12 7.625 L 12 52.62500381469727 C 12.00310134887695 55.73031997680664 14.51968383789063 58.24689865112305 17.625 58.25 L 43.875 58.25000381469727 C 46.98031997680664 58.24690246582031 49.49690246582031 55.73031997680664 49.50000381469727 52.625 L 49.5 7.625000476837158 C 49.49690246582031 4.519681453704834 46.98031997680664 2.003098487854004 43.875 1.999999523162842 Z M 47.625 52.62500381469727 C 47.625 54.69607543945313 45.94606781005859 56.37500381469727 43.875 56.37500381469727 L 17.625 56.37500381469727 C 15.55393218994141 56.37500381469727 13.875 54.69607162475586 13.875 52.62500381469727 L 13.875 7.625000476837158 C 13.875 5.553932666778564 15.55393218994141 3.874999523162842 17.625 3.875 L 43.875 3.875 C 45.94607162475586 3.875 47.625 5.553932666778564 47.625 7.625000476837158 L 47.625 52.62500381469727 Z" fill="#000000" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_8cizu5 =
    '<svg viewBox="26.1 48.9 9.4 5.6" ><path transform="translate(-0.94, -3.13)" d="M 33.5625 52 L 29.81250190734863 52 C 28.25920104980469 52 27.00000381469727 53.25920104980469 27.00000381469727 54.8125 C 27.00000381469727 56.36579895019531 28.25920104980469 57.625 29.81250190734863 57.625 L 33.5625 57.625 C 35.11580657958984 57.625 36.375 56.36579895019531 36.375 54.8125 C 36.375 53.25920104980469 35.11580657958984 52 33.5625 52 Z M 33.5625 55.75 L 29.81250190734863 55.75 C 29.29473495483398 55.75 28.87500381469727 55.33026885986328 28.87500381469727 54.8125 C 28.87500381469727 54.29473876953125 29.29473495483398 53.875 29.81250190734863 53.875 L 33.5625 53.875 C 34.08026885986328 53.875 34.5 54.29473876953125 34.5 54.8125 C 34.5 55.33026885986328 34.08026885986328 55.75 33.5625 55.75 Z" fill="#000000" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_98ltv2 =
    '<svg viewBox="20.4 17.9 20.6 20.6" ><path transform="translate(-0.56, -1.06)" d="M 21.9375 24.625 L 25.6875 24.625 C 26.20526885986328 24.625 26.625 24.20526885986328 26.625 23.6875 L 26.625 19.9375 C 26.625 19.41973495483398 26.20526885986328 19 25.6875 19 L 21.9375 19 C 21.41973495483398 19 21 19.41973495483398 21 19.9375 L 21 23.6875 C 21 24.20526885986328 21.41973495483398 24.625 21.9375 24.625 Z M 22.875 20.875 L 24.75 20.875 L 24.75 22.75 L 22.875 22.75 L 22.875 20.875 Z M 40.6875 19 L 36.9375 19 C 36.41973495483398 19 36 19.41973495483398 36 19.9375 L 36 23.6875 C 36 24.20526885986328 36.41973495483398 24.625 36.9375 24.625 L 40.6875 24.625 C 41.20526885986328 24.625 41.625 24.20526885986328 41.625 23.6875 L 41.625 19.9375 C 41.625 19.41973495483398 41.20526885986328 19 40.6875 19 Z M 39.75 22.75 L 37.875 22.75 L 37.875 20.875 L 39.75 20.875 L 39.75 22.75 Z M 26.625 34.9375 C 26.625 34.41973495483398 26.20526885986328 34 25.6875 34 L 21.9375 34 C 21.41973495483398 34 21 34.41973495483398 21 34.9375 L 21 38.6875 C 21 39.20526885986328 21.41973495483398 39.625 21.9375 39.625 L 25.6875 39.625 C 26.20526885986328 39.625 26.625 39.20526885986328 26.625 38.6875 L 26.625 34.9375 Z M 24.75 37.75 L 22.875 37.75 L 22.875 35.875 L 24.75 35.875 L 24.75 37.75 Z" fill="#000000" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_dp7bhp =
    '<svg viewBox="20.4 25.4 8.4 5.6" ><path transform="translate(-0.56, -1.56)" d="M 22.875 30.75000190734863 L 24.75 30.75000190734863 L 24.75 32.625 L 26.625 32.625 L 26.625 30.75000190734863 L 29.4375 30.75000190734863 L 29.4375 28.87500381469727 L 27.5625 28.87500381469727 L 27.5625 27.00000381469727 L 25.6875 27.00000381469727 L 25.6875 28.87500381469727 L 22.875 28.87500381469727 L 22.875 27.00000381469727 L 21 27.00000381469727 L 21 32.625 L 22.875 32.625 L 22.875 30.75000190734863 Z" fill="#000000" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_ctm0e7 =
    '<svg viewBox="37.3 34.8 3.8 3.8" ><path transform="translate(-1.69, -2.19)" d="M 40.875 38.875 L 39 38.875 L 39 40.75 L 41.8125 40.75 C 42.33026885986328 40.75 42.75 40.33026885986328 42.75 39.8125 L 42.75 37 L 40.875 37 L 40.875 38.875 Z" fill="#000000" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_qnr75x =
    '<svg viewBox="27.9 30.1 7.5 8.4" ><path transform="translate(-1.06, -1.88)" d="M 33.6875 36.6875 L 34.625 36.6875 L 34.625 34.8125 L 33.6875 34.8125 L 33.6875 32 L 31.81250190734863 32 L 31.81250190734863 34.8125 L 29.00000381469727 34.8125 L 29.00000381469727 36.6875 L 31.81250190734863 36.6875 L 31.81250190734863 38.5625 L 29.00000381469727 38.5625 L 29.00000381469727 40.43750381469727 L 36.5 40.43750381469727 L 36.5 38.5625 L 33.6875 38.5625 L 33.6875 36.6875 Z" fill="#000000" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_6nk60h =
    '<svg viewBox="27.9 17.9 5.6 6.6" ><path transform="translate(-1.06, -1.06)" d="M 30.87500190734863 25.5625 L 32.75 25.5625 L 32.75 24.625 L 34.625 24.625 L 34.625 22.75 L 32.75 22.75 L 32.75 20.875 L 34.625 20.875 L 34.625 19 L 29.00000381469727 19 L 29.00000381469727 20.875 L 30.87500190734863 20.875 L 30.87500190734863 25.5625 Z" fill="#000000" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_1xn8n3 =
    '<svg viewBox="3.5 18.4 29.9 36.1" ><path transform="translate(-0.48, -2.47)" d="M 27.83879852294922 44.09636306762695 L 28.41817474365234 43.40637588500977 C 29.05637168884277 42.64616012573242 30.19142913818359 42.54696655273438 30.95164489746094 43.18516159057617 L 32.33161544799805 44.34304428100586 C 33.09183502197266 44.98123168945313 33.19103240966797 46.11629104614258 32.55371475219727 46.87650680541992 L 31.97433853149414 47.56649398803711 L 26.76958274841309 53.76058959960938 C 26.76958274841309 53.76058959960938 26.76958274841309 53.76058959960938 26.76958274841309 53.76058959960938 C 25.06128692626953 55.79192733764648 22.53484535217285 56.96999740600586 19.88286781311035 56.96999740600586 C 17.7707691192627 56.96999740600586 15.72099304199219 56.22382736206055 14.10224437713623 54.86667251586914 L 7.216409683227539 49.0860481262207 C 7.216409683227539 49.0860481262207 7.216409683227539 49.0860481262207 7.216409683227539 49.0860481262207 C 5.185070514678955 47.37775421142578 4.006999969482422 44.85219192504883 4.006999969482422 42.19055938720703 C 4.006999969482422 40.07845687866211 4.753170013427734 38.03746032714844 6.119977951049805 36.41959381103516 L 16.52071189880371 24.03141021728516 C 16.52071189880371 24.02263259887695 16.52071189880371 24.02263259887695 16.52071189880371 24.02263259887695 C 18.22900390625 21.99129295349121 20.75544738769531 20.82200241088867 23.40742301940918 20.82200241088867 C 25.5195255279541 20.82200241088867 27.56929969787598 21.56817245483398 29.18717193603516 22.92620277404785 L 32.59409332275391 25.78447151184082 L 33.27793884277344 26.3612174987793 C 34.03727722167969 27.00029182434082 34.13559341430664 28.1371021270752 33.49740219116211 28.89731979370117 L 32.34741973876953 30.26851272583008 C 31.71010208129883 31.02873229980469 30.57504653930664 31.12792778015137 29.8148307800293 30.49061012268066 L 29.12484359741211 29.91123390197754 L 25.71704292297363 27.05208396911621 C 25.71704292297363 27.05208396911621 25.71704292297363 27.05208396911621 25.71704292297363 27.05208396911621 C 25.070068359375 26.51308441162109 24.25191307067871 26.21637344360352 23.40742301940918 26.21637344360352 C 22.34610748291016 26.21637344360352 21.33921432495117 26.68338584899902 20.65625 27.49276161193848 L 10.2458610534668 39.88972091674805 C 10.2458610534668 39.88972091674805 10.2458610534668 39.88972091674805 10.2458610534668 39.88972091674805 C 9.706863403320313 40.53669357299805 9.401371955871582 41.35485076904297 9.401371955871582 42.20021820068359 C 9.401371955871582 43.26065444946289 9.877165794372559 44.26754379272461 10.6865406036377 44.95050811767578 L 17.57237434387207 50.73113632202148 C 17.57237434387207 50.73113632202148 17.57237434387207 50.73113632202148 17.57237434387207 50.73113632202148 C 18.2202262878418 51.27978897094727 19.03837776184082 51.57649993896484 19.88286781311035 51.57649993896484 C 20.94418525695801 51.57649993896484 21.95107460021973 51.10860824584961 22.63404083251953 50.29045104980469 L 27.83879852294922 44.09636306762695 Z" fill="#363636" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_kte436 =
    '<svg viewBox="22.8 1.8 29.9 36.1" ><path transform="translate(-3.15, -0.17)" d="M 32.00009918212891 14.87363052368164 L 31.42071914672852 15.56361865997314 C 30.78340148925781 16.32383346557617 29.64834213256836 16.42302894592285 28.88813018798828 15.78483581542969 L 27.50727462768555 14.62695598602295 C 26.7470588684082 13.98876094818115 26.64786148071289 12.85370445251465 27.28605651855469 12.0934886932373 L 27.86543655395508 11.4035005569458 L 33.0701904296875 5.209409713745117 C 33.0701904296875 5.209409713745117 33.0701904296875 5.209409713745117 33.0701904296875 5.209409713745117 C 34.77848434448242 3.178070783615112 37.30405044555664 2 39.95602798461914 2 C 42.06900405883789 2 44.11877822875977 2.746170282363892 45.73665237426758 4.10332202911377 L 52.62248611450195 9.883947372436523 C 52.62248611450195 9.883947372436523 52.62248611450195 9.883947372436523 52.62248611450195 9.883947372436523 C 54.65470123291016 11.59223747253418 55.83189010620117 14.1178035736084 55.83189010620117 16.77943801879883 C 55.83189010620117 18.89153671264648 55.08572387695313 20.93253135681152 53.71979141235352 22.5504035949707 L 43.31818008422852 34.93858337402344 C 43.31818008422852 34.94736480712891 43.31818008422852 34.94736480712891 43.31818008422852 34.94736480712891 C 41.60988998413086 36.97870254516602 39.08432006835938 38.14799499511719 36.43234634399414 38.14799499511719 C 34.31936645507813 38.14799499511719 32.26959609985352 37.40182113647461 30.65172576904297 36.04379653930664 L 27.24480056762695 33.18552398681641 L 26.56095504760742 32.60877990722656 C 25.80249404907227 31.96970558166504 25.70417404174805 30.83289337158203 26.34149169921875 30.07267761230469 L 27.49147033691406 28.70147895812988 C 28.12966918945313 27.9412670135498 29.26384353637695 27.84206771850586 30.0240592956543 28.47938537597656 L 30.71492767333984 29.05876541137695 L 34.12185287475586 31.91791343688965 C 34.12185287475586 31.91791343688965 34.12185287475586 31.91791343688965 34.12185287475586 31.91791343688965 C 34.76882553100586 32.45691299438477 35.58697891235352 32.75362396240234 36.43234634399414 32.75362396240234 C 37.4927864074707 32.75362396240234 38.49967956542969 32.2866096496582 39.18352127075195 31.47723007202148 L 49.59303283691406 19.08027458190918 C 49.59303283691406 19.08027458190918 49.59303283691406 19.08027458190918 49.59303283691406 19.08027458190918 C 50.13290786743164 18.43330192565918 50.43840026855469 17.61514663696289 50.43840026855469 16.76977920532227 C 50.43840026855469 15.70934200286865 49.96172714233398 14.70244884490967 49.1523551940918 14.01948356628418 L 42.26651763916016 8.238861083984375 C 42.26651763916016 8.238861083984375 42.26651763916016 8.238861083984375 42.26651763916016 8.238861083984375 C 41.61954498291016 7.690206050872803 40.80139541625977 7.39349365234375 39.95602798461914 7.39349365234375 C 38.89558410644531 7.39349365234375 37.88869476318359 7.861385822296143 37.20573425292969 8.679540634155273 L 32.00009918212891 14.87363052368164 Z" fill="#363636" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
