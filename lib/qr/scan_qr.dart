import 'dart:developer';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:barcode_scan_fix/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:soaurl/models/qr_details.dart';
import 'package:soaurl/widgets/background_widget.dart';
import 'package:soaurl/widgets/save_button_dialog.dart';
import 'package:url_launcher/url_launcher.dart';

class ScanQR extends StatefulWidget {
  @override
  _ScanQRState createState() => _ScanQRState();
}

class _ScanQRState extends State<ScanQR> {
  String qrCodeResult = "Not Yet Scanned";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: BackgroundWidget(
          size: size,
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.all(20),
                // width: size.width,
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: SvgPicture.asset(
                    'assets/images/back_arrow.svg',
                    allowDrawingOutsideViewBox: true,
                    fit: BoxFit.fill,
                    height: 30,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.all(20),
                // width: size.width,
                child: SvgPicture.asset(
                  'assets/images/qr_phone.svg',
                  allowDrawingOutsideViewBox: true,
                  fit: BoxFit.fill,
                  height: 100,
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                // width: size.width,
                child: Text(
                  'Scan QR',
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
              Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    //Message displayed over here
                    Text(
                      "Result",
                      style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                    GestureDetector(
                      onTap: () => _launchURL(qrCodeResult),
                      onLongPress: () {
                        Clipboard.setData(
                          ClipboardData(text: qrCodeResult),
                        );
                        Fluttertoast.showToast(msg: 'Copied to Clipboard!');
                      },
                      child: AutoSizeText(
                        qrCodeResult,
                        minFontSize: 14,
                        maxFontSize: 22,
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),

                    //Button to Save scaned QR code
                    if (qrCodeResult != 'Not Yet Scanned')
                      SaveItButton(
                        qrData: qrCodeResult,
                        scanned: true,
                      ),
                    //Button to scan QR code
                    FlatButton(
                      padding: EdgeInsets.all(15),
                      onPressed: () async {
                        log('Open Scanner');
                        String codeSanner = await BarcodeScanner.scan();
                        //barcode scnner
                        setState(() {
                          qrCodeResult = codeSanner;
                        });
                        QrDetails qrDetails = QrDetails(
                            text: codeSanner,
                            time: DateTime.now(),
                            scanned: true);
                        SharedPreferences sp =
                            await SharedPreferences.getInstance();
                        List<String> _history =
                            sp.getStringList('history') ?? [];
                        if (_history.length > 24) _history.removeLast();
                        _history.add(qrDetails.toJson());
                        sp.setStringList('history', _history);
                      },
                      child: Text(
                        "Open Scanner",
                        style: TextStyle(
                            color: Colors.purple[900],
                            fontWeight: FontWeight.bold),
                      ),
                      //Button having rounded rectangle border
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.indigo[900]),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      color: Colors.white.withOpacity(0.7),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _launchURL(String url) async {
    if (url.trim().contains(' ')) {
      Fluttertoast.showToast(
          msg: 'Could Not Launch url', backgroundColor: Colors.red);
      throw 'Could not launch $url';
    }
    if (!url.contains('http')) url = 'https://' + url;
    log(url);
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      Fluttertoast.showToast(
          msg: 'Could Not Launch url', backgroundColor: Colors.red);
      throw 'Could not launch $url';
    }
  }
}
