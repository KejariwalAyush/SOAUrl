import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:soaurl/app/data/data.dart';
import 'package:soaurl/app/routes/app_pages.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:websafe_svg/websafe_svg.dart';

class MenuWidget extends StatelessWidget {
  final Function() onItemClick;

  const MenuWidget({Key key, this.onItemClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthService _auth = Get.find<AuthService>();
    return Material(
      child: Container(
        decoration: BoxDecoration(
          gradient: kcgSec,
        ),
        padding: EdgeInsets.only(
            top: Get.mediaQuery.padding.top, right: 10, left: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            20.heightBox,
            SizedBox(
              height: 75,
              width: 75,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Image.network(_auth.fireUser.photoURL)),
            ),
            Column(
              children: [
                _auth.fireUser.displayName.text
                    .textStyle(ktsTitle.copyWith(fontSize: 25))
                    .make(),
                _auth.fireUser.email.text.textStyle(ktsSubHeading).make(),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Column(
              children: [
                sliderItem('Notifications', Icons.notifications,
                    () => Get.toNamed(Routes.NOTIFICATIONS)),
                // sliderItem(
                //     'Profile', Icons.person, () => Get.toNamed(Routes.PROFILE)),
                sliderItem('Share App', Icons.ios_share_rounded, null),
                sliderItem('Settings', Icons.settings,
                    () => Get.toNamed(Routes.SETTINGS)),
                sliderItem('About Us', Icons.info_outline,
                    () => Get.toNamed(Routes.ABOUT_US)),
                sliderItem('Log-out', Icons.logout,
                    () => Get.find<AuthService>().signOut()),
              ],
            ),
            buyMeACoffeeWidget(),
          ],
        ),
      ),
    );
  }

  Widget sliderItem(String title, IconData icons, Function() onTap) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: onTap,
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
  Widget buyMeACoffeeWidget() => Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: () async {
            final urlString = 'https://www.buymeacoffee.com/KejariwalAyush';
            if (await canLaunch(urlString)) {
              await launch(urlString);
            } else {
              throw "BuyMeACoffeeWidget - Something went wrong!";
            }
          },
          child: Container(
            child: Row(
              children: [
                WebsafeSvg.network(
                  "https://cdn.buymeacoffee.com/buttons/bmc-new-btn-logo.svg",
                  width: 25.0,
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Text(
                    'Buy me a coffee',
                    style: GoogleFonts.cookie(
                      color: Colors.white,
                      fontSize: 28.0,
                      letterSpacing: 0.6,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
