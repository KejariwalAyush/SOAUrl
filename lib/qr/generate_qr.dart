import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:soaurl/widgets/background_widget.dart';

class GenerateQR extends StatefulWidget {
  @override
  _GenerateQRState createState() => _GenerateQRState();
}

class _GenerateQRState extends State<GenerateQR> {
  String qrData = "https://github.com/KejariwalAyush";
  final qrdataFeed = TextEditingController();
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
                      QrImage(
                        data: qrData,
                        size: 200,
                        foregroundColor: Colors.white,
                      ),
                      SizedBox(height: 20),
                      Text(
                        "Generate QR Code",
                        style: TextStyle(
                            fontSize: 20, color: Colors.white.withOpacity(0.9)),
                      ),

                      SizedBox(height: 20),
                      //TextField for input link
                      TextField(
                        decoration: InputDecoration(
                            labelStyle: TextStyle(color: Colors.white),
                            hintStyle: TextStyle(color: Colors.white),
                            hintText: "Enter your link/text here...",
                            fillColor: Colors.white),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        //Button for generating QR code
                        child: RaisedButton(
                          onPressed: () async {
                            //a little validation for the textfield
                            if (qrdataFeed.text.isEmpty) {
                              setState(() {
                                qrData = "";
                              });
                            } else {
                              setState(() {
                                qrData = qrdataFeed.text;
                              });
                            }
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
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
