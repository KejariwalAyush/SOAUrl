import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:soaurl/constants.dart';
import 'package:soaurl/home/MainScreen.dart';
import 'package:soaurl/login/verificaton_page.dart';
import 'package:soaurl/services/sign_in_service.dart';
import 'package:soaurl/widgets/background_widget.dart';
import 'package:soaurl/widgets/delayed_animations.dart';
import 'package:url_launcher/url_launcher.dart';

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
                    'assets/icons/logo.svg',
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
                                'assets/icons/google.svg',
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

class WebLandingPage extends StatefulWidget {
  const WebLandingPage({Key key}) : super(key: key);

  @override
  _WebLandingPageState createState() => _WebLandingPageState();
}

class _WebLandingPageState extends State<WebLandingPage>
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
    return Scaffold(
      body: BackgroundWidget(
        size: size,
        child: Container(
          alignment: Alignment.topCenter,
          child: SingleChildScrollView(
            child: Column(
              children: [
                DelayedAnimation(
                  delay: delayedAmount,
                  child: Row(
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
                        onTap: () => SignInService.signInWithGoogle().then(
                            (value) => value == null
                                ? null
                                : Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => WebMainScreen()),
                                    (route) => false)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: AutoSizeText(
                            'Login',
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
                ),
                Scrollbar(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        DelayedAnimation(
                          delay: delayedAmount + 200,
                          child: Wrap(
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
                                  width: size.width > 700
                                      ? size.width * 0.35
                                      : 250,
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(10.0),
                                width: size.width > 700
                                    ? (size.width * 0.5)
                                    : size.width,
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
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        ElevatedButton(
                                          onPressed: () {},
                                          style: ButtonStyle(
                                              padding:
                                                  MaterialStateProperty.all(
                                                      EdgeInsets.all(15)),
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                      Colors.white)),
                                          child: AutoSizeText(
                                            'Download Our App',
                                            maxFontSize: 25,
                                            minFontSize: 18,
                                            style: TextStyle(
                                                // fontSize:
                                                //     size.width > 700 ? 25 : 18,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                          ),
                                        ),
                                        TextButton(
                                          onPressed: () => SignInService
                                                  .signInWithGoogle()
                                              .then((value) => value == null
                                                  ? null
                                                  : Navigator.pushAndRemoveUntil(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              WebMainScreen()),
                                                      (route) => false)),
                                          style: ButtonStyle(
                                            padding: MaterialStateProperty.all(
                                                EdgeInsets.all(15)),
                                            // backgroundColor: MaterialStateProperty.all(
                                            //     Colors.blueGrey[200]),
                                          ),
                                          child: Row(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: SvgPicture.asset(
                                                  'assets/icons/google.svg',
                                                  width: 20,
                                                ),
                                              ),
                                              Text(
                                                'Register Here',
                                                style: TextStyle(
                                                    fontSize: size.width > 700
                                                        ? 22
                                                        : 18,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        DelayedAnimation(
                          delay: delayedAmount + 400,
                          child: Wrap(
                            // alignment: WrapAlignment.center,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            direction: Axis.horizontal,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(10.0),
                                width: size.width > 700
                                    ? (size.width * 0.5)
                                    : size.width,
                                // height: 250, //size.width > 700 ? 250 : 200,
                                alignment: Alignment.center,
                                child: Column(
                                  mainAxisAlignment: size.width > 700
                                      ? MainAxisAlignment.center
                                      : MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    AutoSizeText(
                                      'See your growth!',
                                      maxFontSize: 45,
                                      minFontSize: 30,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    AutoSizeText(
                                      'Get improved absorption of business information. We provide quick access to meaningful business insights. Vizualize Your Growth with help of graphs and pie Charts. Know how users visit your site with multiple platfroms, so that you can reach out more users.',
                                      maxFontSize: 30,
                                      minFontSize: 18,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: size.width > 700 ? 350 : size.width,
                                padding: EdgeInsets.all(10),
                                alignment: Alignment.center,
                                child: SvgPicture.asset(
                                  'assets/images/data_visualization.svg',
                                  width: size.width > 700
                                      ? size.width * 0.35
                                      : 250,
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                            ],
                          ),
                        ),
                        DelayedAnimation(
                          delay: delayedAmount + 600,
                          child: Container(
                            width: size.width,
                            child: Wrap(
                              crossAxisAlignment: WrapCrossAlignment.center,
                              direction: Axis.horizontal,
                              alignment: WrapAlignment.spaceEvenly,
                              runSpacing: 10,
                              spacing: 10,
                              children: [
                                AutoSizeText(
                                  'Made with ❤ for CODEX!',
                                  maxFontSize: 30,
                                  minFontSize: 25,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                Wrap(
                                  alignment: WrapAlignment.spaceEvenly,
                                  // spacing: 10,
                                  // runSpacing: 10,
                                  // runAlignment: WrapAlignment.center,
                                  direction: Axis.horizontal,
                                  // crossAxisAlignment: WrapCrossAlignment.center,
                                  children: [
                                    devProfile(
                                      name: 'Ayush Kejariwal',
                                      imgLink:
                                          'https://avatars.githubusercontent.com/u/53415956?s=460&u=65f4b2ed95fbfb538a2c142a43e0496eb52a5078&v=4',
                                      github:
                                          'https://github.com/kejariwalayush',
                                      instagram:
                                          'https://instagram.com/a_kejariwal',
                                      // linkedIn:
                                      //     'https://linkedin.com/kejariwalayush'
                                    ),
                                    devProfile(
                                      name: 'Rohan Verma',
                                      imgLink:
                                          'https://avatars.githubusercontent.com/u/53369178?s=460&u=c05a342fd4e65cfc308328bb22787b8a25df2336&v=4',
                                      github: 'https://github.com/martyminiac',
                                      instagram:
                                          'https://instagram.com/martyminiac',
                                      // linkedIn: 'https://linkedin.com/kejariwalayush'
                                    ),
                                    devProfile(
                                      name: 'Nishant Choudhary',
                                      imgLink:
                                          'https://avatars.githubusercontent.com/u/35103134?s=460&u=da937d6e2d81bb61854db4ffcae7a32c62eca125&v=4',
                                      github: 'https://github.com/nishantc7',
                                      // instagram: 'https://instagram.com/a_kejariwal',
                                      // linkedIn: 'https://linkedin.com/kejariwalayush'
                                    ),
                                  ],
                                ),
                              ],
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
      ),
    );
  }

  Widget devProfile(
      {String name,
      String imgLink,
      String instagram,
      String github,
      String linkedIn}) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      width: 200,
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: Colors.purple,
            foregroundImage: NetworkImage(imgLink),
            maxRadius: 15,
          ),
          AutoSizeText(
            name,
            maxFontSize: 30,
            minFontSize: 18,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (github != null)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                      icon: FaIcon(FontAwesomeIcons.github),
                      onPressed: () => _launchURL(github)),
                ),
              if (instagram != null)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                      icon: FaIcon(FontAwesomeIcons.instagram),
                      onPressed: () => _launchURL(instagram)),
                ),
              if (linkedIn != null)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                      icon: FaIcon(FontAwesomeIcons.linkedinIn),
                      onPressed: () => _launchURL(linkedIn)),
                ),
            ],
          ),
        ],
      ),
    );
  }

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
