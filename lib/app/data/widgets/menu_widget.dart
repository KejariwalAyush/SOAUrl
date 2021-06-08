import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:soaurl/app/data/data.dart';
import 'package:velocity_x/velocity_x.dart';

class MenuWidget extends StatelessWidget {
  final Function() onItemClick;

  const MenuWidget({Key key, this.onItemClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: BoxDecoration(
          //color: const Color(0xffc651cd)
          gradient: kcgSec,
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
                'assets/icons/menu.svg',
                allowDrawingOutsideViewBox: true,
                fit: BoxFit.fill,
                color: kcWhite,
                height: 100,
              ),
            ),
            'user.displayName'.text.textStyle(ktsHeading1).make(),
            SizedBox(
              height: 20,
            ),
            Column(
              children: [
                sliderItem('Profile', Icons.person, null), //ProfilePage(),),
                sliderItem('History', Icons.history, null), //History(),),
                sliderItem('Saved', Icons.bookmark, null), //Saved(),),
              ],
            ),
            GestureDetector(
              // onTap: () => SignInService.signOutGoogle().then((value) =>
              //     Navigator.of(context).pushReplacement(MaterialPageRoute(
              //         builder: (BuildContext context) => LoginRegister()))),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Row(
                    children: [
                      Icon(
                        Icons.logout,
                        color: kcWhite,
                        size: 30,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Text(
                          'LogOut',
                          style: ktsSubHeading,
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
        child: InkWell(
          onTap: () => Get.to(() => destinaton),
          child: Container(
            child: Row(
              children: [
                Icon(
                  icons,
                  color: kcWhite,
                  size: 30,
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Text(
                    title,
                    style: ktsSubHeading,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
