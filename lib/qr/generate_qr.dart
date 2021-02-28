import 'dart:developer';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:auto_size_text_field/auto_size_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:share_files_and_screenshot_widgets/share_files_and_screenshot_widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:soaurl/models/qr_details.dart';
import 'package:soaurl/widgets/background_widget.dart';

class GenerateQR extends StatefulWidget {
  @override
  _GenerateQRState createState() => _GenerateQRState();
}

class _GenerateQRState extends State<GenerateQR> {
  String qrData = "https://github.com/KejariwalAyush";
  GlobalKey previewContainer = new GlobalKey();

  final qrdataFeed = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: BackgroundWidget(
          size: size,
          child: SingleChildScrollView(
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
                SizedBox(
                  height: 30,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.all(20),
                  // width: size.width,
                  child: SvgPicture.asset(
                    'assets/images/qr_large.svg',
                    fit: BoxFit.fill,
                    height: 100,
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  // width: size.width,
                  child: Text(
                    'Generate QR',
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
                  child: SingleChildScrollView(
                    //Scroll view given to Column
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 20),
                        //TextField for input link
                        AutoSizeTextField(
                          controller: qrdataFeed,
                          style: TextStyle(color: Colors.white),
                          minFontSize: 14,
                          maxFontSize: 20,
                          maxLines: 2, minLines: 1,

                          decoration: InputDecoration(
                              labelStyle: TextStyle(color: Colors.white),
                              hintStyle: TextStyle(color: Colors.white),
                              helperStyle: TextStyle(color: Colors.white),
                              icon: Icon(
                                Icons.text_fields_rounded,
                                size: 30,
                                color: Colors.white,
                              ),
                              hintText: "Enter your link/text here...",
                              fillColor: Colors.white),
                          // overflow: TextOverflow.ellipsis,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          //Button for generating QR code
                          child: RaisedButton(
                            onPressed: () async {
                              log('Generate Pressed');
                              //a little validation for the textfield
                              // log(qrdataFeed.text);
                              if (qrdataFeed.text.isEmpty) {
                                setState(() {
                                  // log(qrData);
                                  qrData = "";
                                });
                              } else {
                                setState(() {
                                  // log(qrdataFeed.text);
                                  qrData = qrdataFeed.text;
                                });
                                QrDetails qrDetails = QrDetails(
                                    text: qrData,
                                    time: DateTime.now(),
                                    scanned: false);
                                SharedPreferences sp =
                                    await SharedPreferences.getInstance();
                                List<String> _history =
                                    sp.getStringList('history') ?? [];
                                if (_history.length > 24) _history.removeLast();
                                _history.add(qrDetails.toJson());
                                sp.setStringList('history', _history);
                                log('added to history');
                              }
                              log(qrData);
                            },
                            //Title given on Button
                            child: Text(
                              "Generate QR Code",
                              style: TextStyle(
                                color: Colors.purple[900],
                              ),
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                              side: BorderSide(color: Colors.indigo[900]),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            RepaintBoundary(
                              key: previewContainer,
                              child: Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(17),
                                    color: Colors.white),
                                child: QrImage(
                                  data: qrData,
                                  size: 200,
                                  foregroundColor: Colors.black,
                                  gapless: true,
                                ),
                              ),
                            ),
                            IconButton(
                              icon: Icon(Icons.share_rounded,
                                  size: 30, color: Colors.white),
                              tooltip: 'Share QR',
                              onPressed: () {
                                ShareFilesAndScreenshotWidgets()
                                    .shareScreenshot(previewContainer, 800,
                                        "QR", "qr.png", "image/png",
                                        text: "");
                              },
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        //Button to Save scaned QR code
                        if (qrData != null)
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: FlatButton.icon(
                              padding: EdgeInsets.all(15),

                              onPressed: () {},
                              icon: Icon(Icons.bookmark),
                              label: Text(
                                "Save it For Later!",
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
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
