import 'package:flutter/material.dart';
import 'package:soaurl/app/data/data.dart';
import 'package:soaurl/app/routes/app_pages.dart';
import 'package:velocity_x/velocity_x.dart';

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
            SizedBox(
              height: 75,
              width: 75,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Image.network(_auth.fireUser.photoURL)),
            ),
            _auth.fireUser.displayName.text
                .textStyle(ktsTitle.copyWith(fontSize: 25))
                .make(),
            SizedBox(
              height: 20,
            ),
            Column(
              children: [
                sliderItem(
                    'Profile', Icons.person, () => Get.toNamed(Routes.PROFILE)),
                sliderItem('Settings', Icons.settings,
                    () => Get.toNamed(Routes.SETTINGS)),
                sliderItem('About Us', Icons.adb_rounded, null),
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
}
