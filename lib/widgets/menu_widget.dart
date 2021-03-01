import 'package:animations/animations.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:soaurl/home/history.dart';
import 'package:soaurl/constants.dart';
import 'package:soaurl/home/Profile.dart';
import 'package:soaurl/home/saved_qr.dart';
import 'package:soaurl/login/LoginRegister.dart';
import 'package:soaurl/services/sign_in_service.dart';

class MenuWidget extends StatelessWidget {
  final Function() onItemClick;

  const MenuWidget({Key key, this.onItemClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: BoxDecoration(
          //color: const Color(0xffc651cd)
          gradient: LinearGradient(
            begin: Alignment(1.0, -1.0),
            end: Alignment(-1.0, 1.0),
            colors: [const Color(0xffc651cd), const Color(0xff441d7d)],
            stops: [0.0, 1.0],
          ),
        ),
        padding: const EdgeInsets.only(top: 30, right: 10, left: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            SizedBox(
              height: 30,
            ),
            RotatedBox(
              quarterTurns: 1,
              child: SvgPicture.asset(
                'assets/images/menu.svg',
                allowDrawingOutsideViewBox: true,
                fit: BoxFit.fill,
                color: Colors.white,
                height: 100,
              ),
            ),
            AutoSizeText(
              user.displayName,
              minFontSize: 24,
              maxFontSize: 28,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                color: Colors.white,
                shadows: [
                  Shadow(
                    color: const Color(0xa1363636),
                    offset: Offset(0, 3),
                    blurRadius: 6,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Column(
              children: [
                sliderItem('Profile', Icons.person, ProfilePage()),
                sliderItem('History', Icons.history, History()),
                sliderItem('Saved', Icons.bookmark, Saved()),
              ],
            ),
            GestureDetector(
              onTap: () => SignInService.signOutGoogle().then((value) =>
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (BuildContext context) => LoginRegister()))),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Row(
                    children: [
                      Icon(
                        Icons.logout,
                        color: Colors.white,
                        size: 30,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Text(
                          'LogOut',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 25),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget sliderItem(String title, IconData icons, Widget destinaton) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: OpenContainer(
          closedBuilder: (context, action) => Row(
            children: [
              Icon(
                icons,
                color: Colors.white,
                size: 30,
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 25),
                ),
              ),
            ],
          ),
          openBuilder: (context, action) => destinaton,
          closedElevation: 0,
          openElevation: 0,
          closedColor: Colors.transparent,
          openColor: Colors.transparent,
        ),
      );
}
