import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:soaurl/constants.dart';
import 'package:soaurl/home/history.dart';
import 'package:soaurl/home/saved_qr.dart';
import 'package:soaurl/widgets/background_widget.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({
    Key key,
  }) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool _roundedQr = roundedQr;
  bool _qrWithLogo = qrWithLogo;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffffffff),
        body: Container(
          width: size.width,
          height: size.height,
          child: BackgroundWidget(
            size: size,
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
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: SvgPicture.asset(
                          'assets/images/back_arrow.svg',
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                          height: 30,
                        ),
                      ),
                      // IconButton(
                      //   icon: Icon(
                      //     Icons.logout,
                      //     size: 30,
                      //   ),
                      //   onPressed: () {},
                      // ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  alignment: Alignment.centerLeft,
                  child: SvgPicture.asset(
                    'assets/images/profile.svg',
                    width: size.width * 0.4,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  alignment: Alignment.centerLeft,
                  child: Text.rich(
                    TextSpan(
                      style: TextStyle(
                        color: const Color(0xfff2eaff),
                      ),
                      children: [
                        TextSpan(
                          text: '${user.displayName}\n',
                          style: TextStyle(
                            fontSize: 45,
                            fontWeight: FontWeight.w700,
                            shadows: [
                              Shadow(
                                color: const Color(0xa1363636),
                                offset: Offset(0, 3),
                                blurRadius: 6,
                              )
                            ],
                          ),
                        ),
                        TextSpan(
                          text: user.email,
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    textHeightBehavior:
                        TextHeightBehavior(applyHeightToFirstAscent: false),
                    textAlign: TextAlign.start,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // UserExtraDetails(size: size),
                        Container(
                          width: size.width,
                          padding:
                              EdgeInsets.symmetric(horizontal: 20, vertical: 3),
                          child: RaisedButton.icon(
                              color: Colors.white.withOpacity(0.6),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                                side: BorderSide(color: Colors.indigo[900]),
                              ),
                              onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Saved(),
                                  )),
                              icon: Icon(Icons.bookmark_border),
                              label: Text(
                                'Saved QRs',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )),
                        ),
                        Container(
                          width: size.width,
                          padding:
                              EdgeInsets.symmetric(horizontal: 20, vertical: 3),
                          child: RaisedButton.icon(
                              color: Colors.white.withOpacity(0.6),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                                side: BorderSide(color: Colors.indigo[900]),
                              ),
                              onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => History(),
                                  )),
                              icon: Icon(Icons.history_rounded),
                              label: Text(
                                'History',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )),
                        ),
                        Container(
                          width: size.width,
                          padding:
                              EdgeInsets.symmetric(horizontal: 25, vertical: 3),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Text(
                                  'Rounded Qr edges',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ),
                              Switch(
                                value: _roundedQr,
                                onChanged: (value) {
                                  setState(() {
                                    _roundedQr = value;

                                    roundedQr = value;
                                  });
                                },
                                activeTrackColor: Colors.deepPurpleAccent[200],
                                activeColor: Colors.deepPurple[800],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: size.width,
                          padding:
                              EdgeInsets.symmetric(horizontal: 25, vertical: 3),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Text(
                                  'Show Qr with our Logo',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ),
                              Switch(
                                value: _qrWithLogo,
                                onChanged: (value) {
                                  setState(() {
                                    _qrWithLogo = value;

                                    qrWithLogo = value;
                                  });
                                },
                                activeTrackColor: Colors.deepPurpleAccent[200],
                                activeColor: Colors.deepPurple[800],
                              ),
                            ],
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

class UserExtraDetails extends StatelessWidget {
  const UserExtraDetails({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        color: Colors.white.withOpacity(0.45),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: SvgPicture.asset(
                    'assets/images/url.svg',
                    color: Colors.black,
                    height: 50,
                    width: 50,
                    fit: BoxFit.fill,
                  ),
                ),
                Text.rich(
                  TextSpan(
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                    children: [
                      TextSpan(
                        text: '0\n',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      TextSpan(
                        text: 'Links Active',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  textHeightBehavior:
                      TextHeightBehavior(applyHeightToFirstAscent: false),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: SvgPicture.asset(
                    'assets/images/qr_phone.svg',
                    color: Colors.black,
                    height: 50,
                    width: 50,
                    fit: BoxFit.fill,
                  ),
                ),
                Text.rich(
                  TextSpan(
                    style: TextStyle(
                      // fontFamily: 'Sitka Display',
                      fontSize: 16,
                      color: Colors.black,
                    ),
                    children: [
                      TextSpan(
                        text: '0\n',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      TextSpan(
                        text: 'QR Scans',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  textHeightBehavior:
                      TextHeightBehavior(applyHeightToFirstAscent: false),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
