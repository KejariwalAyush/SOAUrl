import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:soaurl/home/Profile.dart';

class MenuWidget extends StatelessWidget {
  final Function() onItemClick;

  const MenuWidget({Key key, this.onItemClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
          SizedBox(
            height: 20,
          ),
          Column(
            children: [
              sliderItem('Profile', Icons.person, ProfilePage()),
              sliderItem('History', Icons.history, ProfilePage()),
              sliderItem('Saved', Icons.bookmark, ProfilePage()),
            ],
          ),
          sliderItem('LogOut', Icons.logout, ProfilePage())
        ],
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
