import 'dart:convert';
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

  TextEditingController longUrl = TextEditingController();
  final shortUrl = TextEditingController();

  bool checkingUrl = false;
  bool isLoading = false;
  bool showCheckUrlButton = true;
  bool isUrlAvailable = false;
  bool isLongUrlValid;
  NetworkHelper nh = new NetworkHelper();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    String shortlink = 'soaurl.ml/' + (shortUrl.text ?? '');
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
                          onChanged: (value) {
                            setState(() {
                              isLongUrlValid = false;
                            });
                          },
                          keyboardType: TextInputType.url,
                          onEditingComplete: () async => await checkLongUrl(),
                          onSubmitted: (value) async => await checkLongUrl(),
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
                              suffixIcon: GestureDetector(
                                onTap: () => checkLongUrl(),
                                child: isLongUrlValid == null
                                    ? SizedBox()
                                    : Container(
                                        padding: EdgeInsets.all(8),
                                        child: isLongUrlValid
                                            ? Image.asset(
                                                'assets/images/correct.png',
                                                fit: BoxFit.contain,
                                                height: 20,
                                              )
                                            : Image.asset(
                                                'assets/images/wrong.png',
                                                fit: BoxFit.contain,
                                                height: 20,
                                              ),
                                      ),
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
                          width: size.width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Text(
                                  shortlink,
                                  style: GoogleFonts.varela(
                                    fontSize: 15,
                                    color: const Color(0xfff2eaff),
                                    fontWeight: FontWeight.w700,
                                  ),
                                  textAlign: TextAlign.start,
                                  overflow: TextOverflow.ellipsis,
                                ),
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
                                                  var res = await nh.postHTTP(
                                                    'http://soaurl.ml/api/link_available',
                                                    jsonEncode({
                                                      "shortUrl": shortUrl.text
                                                    }),
                                                  );
                                                  log(res?.data?.toString() ??
                                                      'NO DATA');

                                                  setState(() {
                                                    if (res?.data == 'true' ??
                                                        false)
                                                      isUrlAvailable = true;
                                                    else
                                                      isUrlAvailable = false;
                                                    checkingUrl = false;
                                                  });
                                                },
                                          textColor: Colors.amber[400],
                                          disabledTextColor: Colors.grey[400],
                                          child: Text(
                                            'Check\nAvailablity',
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
                          child: isLoading
                              ? CircularProgressIndicator(
                                  valueColor: new AlwaysStoppedAnimation<Color>(
                                      Colors.white),
                                )
                              : RaisedButton(
                                  onPressed: isUrlAvailable && isLongUrlValid
                                      ? () async {
                                          setState(() {
                                            isLoading = true;
                                          });
                                          var data = ShortenUrlRequestModel(
                                                  userId:
                                                      'e0f88d7b-de51-49fe-b537-f9f2df160024',
                                                  email: user.email,
                                                  longUrl: longUrl.text,
                                                  shortUrl: shortUrl.text,
                                                  noOfDays: 7,
                                                  dateTime: DateTime.now())
                                              .toJson();
                                          log(data);

                                          var res = await nh.postHTTP(
                                            'http://soaurl.ml/api/create',
                                            data,
                                          );
                                          log(res?.data?.toString() ??
                                              'NO DATA');
                                          // await Future.delayed(
                                          //     Duration(seconds: 5));
                                          if (res?.data == 'success' ?? false) {
                                            setState(() {
                                              isLoading = false;
                                            });
                                            Fluttertoast.showToast(
                                                msg:
                                                    'Link Shortend Successfully',
                                                backgroundColor:
                                                    Colors.green[700]);
                                            Navigator.pop(context);
                                          } else {
                                            setState(() {
                                              isLoading = false;
                                            });
                                            Fluttertoast.showToast(
                                                msg:
                                                    'Something Went Wrong!\n${res?.data}',
                                                backgroundColor:
                                                    Colors.red[700]);
                                          }
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

  Future checkLongUrl() async {
    if (await nh.checkValidUrl(longUrl.text))
      setState(() {
        isLongUrlValid = true;
        longUrl = TextEditingController(
            text: (!longUrl.text.contains('http'))
                ? ('https://' + longUrl.text)
                : longUrl);
      });
    else
      setState(() {
        isLongUrlValid = false;
      });
  }
}
