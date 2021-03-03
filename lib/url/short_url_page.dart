import 'dart:developer';

import 'package:auto_size_text_field/auto_size_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:soaurl/constants.dart';
import 'package:soaurl/models/shorten_url_request.dart';
import 'package:soaurl/services/network_helper.dart';
import 'package:soaurl/widgets/background_widget.dart';

class ShortUrlPage extends StatefulWidget {
  @override
  _ShortUrlPageState createState() => _ShortUrlPageState();
}

class _ShortUrlPageState extends State<ShortUrlPage> {
  String qrData = "https://github.com/KejariwalAyush";
  GlobalKey previewContainer = new GlobalKey();

  final longUrl = TextEditingController();
  final shortUrl = TextEditingController();

  bool isUrlAvailable;
  bool checkingUrl;
  bool isLoading;
  bool showCheckUrlButton = true;
  bool isLongUrlValid = false;

  // final shortUrl = TextEditingController();
  @override
  void initState() {
    isUrlAvailable = false;
    checkingUrl = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    String shortlink = 'https://soaurl.ml/' + (shortUrl.text ?? '');
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
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.all(20),
                  // width: size.width,
                  child: SvgPicture.asset(
                    'assets/images/url.svg',
                    fit: BoxFit.fill,
                    height: 100,
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  // width: size.width,
                  child: Text(
                    'Shorten Url',
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
                          controller: longUrl,
                          // onEditingComplete: () async {
                          //   NetworkHelper nh = new NetworkHelper();
                          //   await nh.checkValidUrl(longUrl.text);
                          // },
                          // onSubmitted: (link) async {
                          //   NetworkHelper nh = new NetworkHelper();
                          //   await nh.checkValidUrl(link);
                          // },
                          style: GoogleFonts.varela(color: Colors.white),
                          minFontSize: 14,
                          maxFontSize: 20,
                          maxLines: 1,
                          minLines: 1,

                          decoration: InputDecoration(
                              labelStyle: TextStyle(color: Colors.white),
                              hintStyle: TextStyle(color: Colors.white),
                              helperStyle: TextStyle(color: Colors.white),
                              icon: Icon(
                                Icons.add_link,
                                size: 30,
                                color: Colors.white,
                              ),
                              hintText: "Enter your long link here...",
                              fillColor: Colors.white),
                          // overflow: TextOverflow.ellipsis,
                        ),
                        //TextField for input link
                        AutoSizeTextField(
                          controller: shortUrl,
                          style: GoogleFonts.varela(color: Colors.white),
                          minFontSize: 14,
                          maxFontSize: 20,
                          maxLines: 2, minLines: 1,
                          onChanged: (value) {
                            setState(() {
                              showCheckUrlButton = true;
                              checkingUrl = false;
                            });
                          },

                          decoration: InputDecoration(
                              labelStyle: TextStyle(color: Colors.white),
                              hintStyle: TextStyle(color: Colors.white),
                              helperStyle: TextStyle(color: Colors.white),
                              icon: Icon(
                                Icons.short_text_rounded,
                                size: 30,
                                color: Colors.white,
                              ),
                              hintText: "Enter your short title here...",
                              fillColor: Colors.white),
                          // overflow: TextOverflow.ellipsis,
                        ),
                        // Display shorten Url and check available button
                        Container(
                          alignment: Alignment.centerLeft,
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                          // width: size.width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                shortlink,
                                style: GoogleFonts.varela(
                                  fontSize: 15,
                                  color: const Color(0xfff2eaff),
                                  fontWeight: FontWeight.w700,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              checkingUrl
                                  ? CircularProgressIndicator(
                                      valueColor:
                                          new AlwaysStoppedAnimation<Color>(
                                              Colors.white),
                                    )
                                  : showCheckUrlButton
                                      ? FlatButton(
                                          onPressed: (shortUrl.text == '' ||
                                                  shortlink
                                                      .trim()
                                                      .contains(' '))
                                              ? null
                                              : () async {
                                                  setState(() {
                                                    checkingUrl = true;
                                                    showCheckUrlButton = false;
                                                  });
                                                  await Future.delayed(
                                                      Duration(seconds: 10));
                                                  setState(() {
                                                    isUrlAvailable = true;
                                                    checkingUrl = false;
                                                  });
                                                },
                                          textColor: Colors.amber[400],
                                          disabledTextColor: Colors.grey[400],
                                          child: Text(
                                            'Check Availablity',
                                            style: GoogleFonts.varela(
                                              fontSize: 15,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        )
                                      : isUrlAvailable
                                          ? Image.asset(
                                              'assets/images/correct.png',
                                              fit: BoxFit.contain,
                                              height: 30,
                                            )
                                          : Image.asset(
                                              'assets/images/wrong.png',
                                              fit: BoxFit.contain,
                                              height: 30,
                                            ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          //Button for generating Short Url
                          child: RaisedButton(
                            onPressed: isUrlAvailable
                                ? () async {
                                    NetworkHelper nh = new NetworkHelper();
                                    if (!(await nh
                                        .checkValidUrl(longUrl.text))) {
                                      Fluttertoast.showToast(
                                          msg: 'Invalid Long Url',
                                          backgroundColor: Colors.redAccent);
                                      return;
                                    }

                                    var data = ShortenUrlRequestModel(
                                        userId: user.uid,
                                        email: user.email,
                                        longUrl: longUrl.text,
                                        shortUrl: shortUrl.text,
                                        noOfDays: 7,
                                        dateTime: DateTime.now());
                                    log(data.toJson());
                                  }
                                : null,
                            //Title given on Button
                            child: Text(
                              "Shorten your Url",
                              style: TextStyle(
                                // color: Colors.purple[900],
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            textColor: Colors.purple[900],
                            // disabledColor: Colors.blueGrey[100],
                            disabledTextColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                              side: BorderSide(color: Colors.indigo[900]),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        //         Padding(
                        //           padding: const EdgeInsets.all(8.0),
                        //           //Button for generating QR code
                        //           child: RaisedButton(
                        //             onPressed: () async {
                        //               log('Generate Pressed');
                        //               //a little validation for the textfield
                        //               // log(qrdataFeed.text);
                        //               if (longUrl.text.isEmpty) {
                        //                 setState(() {
                        //                   // log(qrData);
                        //                   qrData = "";
                        //                 });
                        //               } else {
                        //                 setState(() {
                        //                   // log(qrdataFeed.text);
                        //                   qrData = longUrl.text;
                        //                 });
                        //                 QrDetails qrDetails = QrDetails(
                        //                     text: qrData,
                        //                     time: DateTime.now(),
                        //                     scanned: false);
                        //                 SharedPreferences sp =
                        //                     await SharedPreferences.getInstance();
                        //                 List<String> _history =
                        //                     sp.getStringList('history') ?? [];
                        //                 if (_history.length > 24) _history.removeLast();
                        //                 _history.add(qrDetails.toJson());
                        //                 sp.setStringList('history', _history);
                        //                 log('added to history');
                        //               }
                        //               log(qrData);
                        //             },
                        //             //Title given on Button
                        //             child: Text(
                        //               "Generate QR Code",
                        //               style: TextStyle(
                        //                 color: Colors.purple[900],
                        //               ),
                        //             ),
                        //             shape: RoundedRectangleBorder(
                        //               borderRadius: BorderRadius.circular(20),
                        //               side: BorderSide(color: Colors.indigo[900]),
                        //             ),
                        //           ),
                        //         ),
                        //         SizedBox(height: 20),
                        //         Row(
                        //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        //           crossAxisAlignment: CrossAxisAlignment.center,
                        //           children: [
                        //             Container(
                        //               key: UniqueKey(),
                        //               child: RepaintBoundary(
                        //                 key: previewContainer,
                        //                 child: Container(
                        //                   padding: EdgeInsets.all(10),
                        //                   decoration: BoxDecoration(
                        //                       borderRadius: BorderRadius.circular(17),
                        //                       color: Colors.white),
                        //                   child: PrettyQr(
                        //                     data: qrData,
                        //                     size: 200,
                        //                     roundEdges: roundedQr,
                        //                     typeNumber: 3,
                        //                     errorCorrectLevel: QrErrorCorrectLevel.M,
                        //                     image: qrWithLogo
                        //                         ? AssetImage(
                        //                             'assets/images/logo-no-bg.png',
                        //                           )
                        //                         : null,
                        //                   ),
                        //                 ),
                        //               ),
                        //             ),
                        //             IconButton(
                        //               icon: Icon(Icons.share_rounded,
                        //                   size: 30, color: Colors.white),
                        //               tooltip: 'Share QR',
                        //               onPressed: () {
                        //                 ShareFilesAndScreenshotWidgets()
                        //                     .shareScreenshot(previewContainer, 800,
                        //                         "QR", "qr.png", "image/png",
                        //                         text: "");
                        //               },
                        //             ),
                        //           ],
                        //         ),
                        //         SizedBox(
                        //           height: 20,
                        //         ),
                        //         //Button to Save scaned QR code
                        //         if (qrData != null)
                        //           SaveItButton(
                        //             qrData: qrData,
                        //             scanned: false,
                        //           ),
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
