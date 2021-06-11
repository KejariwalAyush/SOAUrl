import 'package:flutter/material.dart';
import 'package:soaurl/app/data/data.dart';
import 'package:soaurl/app/modules/home/controllers/home_controller.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:websafe_svg/websafe_svg.dart';

class AppBarContentExtended extends StatelessWidget {
  const AppBarContentExtended({
    Key key,
    @required this.animation,
  }) : super(key: key);

  final AlwaysStoppedAnimation<double> animation;

  @override
  Widget build(BuildContext context) {
    HomeController _hc = Get.find<HomeController>();
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: _hc.openDrawer,
              child: WebsafeSvg.asset(
                'assets/icons/menu.svg',
                fit: BoxFit.fill,
                height: 30,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Tween<double>(begin: 0, end: 40).evaluate(animation).squareBox,
                WebsafeSvg.asset(
                  'assets/icons/logo.svg',
                  fit: BoxFit.fill,
                  height: Tween<double>(begin: 0, end: 125).evaluate(animation),
                ),
                Text(
                  "SOAUrl",
                  style: TextStyle(
                    fontSize:
                        Tween<double>(begin: 30, end: 36).evaluate(animation),
                    color: Colors.white,
                    shadows: [kShadow],
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Text(
                  "Shortform Of Any Url",
                  style: TextStyle(
                    fontSize:
                        Tween<double>(begin: 0, end: 18).evaluate(animation),
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
            InkWell(
              onTap: _hc.openProfile,
              child: SizedBox(
                height: 30,
                width: 30,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                        Get.find<AuthService>().fireUser.photoURL)),
              ),
            ),
          ],
        ),
        Tween<double>(begin: 15, end: 30).evaluate(animation).squareBox,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(
                        Tween<double>(begin: 0, end: 4).evaluate(animation)),
                    child: SizedBox(
                      height:
                          Tween<double>(begin: 0, end: 50).evaluate(animation),
                      child: WebsafeSvg.asset(
                        'assets/icons/quick_link.svg',
                        color: Colors.white,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                  'Quick Shorten'.text.xl.center.bold.white.make().p8(),
                ],
              )
                  .onInkTap(_hc.quickshort)
                  .card
                  .roundedSM
                  .color(kcMainPurple.withOpacity(0.2))
                  .make()
                  .p4(),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(
                        Tween<double>(begin: 0, end: 4).evaluate(animation)),
                    child: SizedBox(
                      height:
                          Tween<double>(begin: 0, end: 50).evaluate(animation),
                      child: WebsafeSvg.asset(
                        'assets/icons/url.svg',
                        color: Colors.white,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                  'Custom Shorten'.text.xl.center.bold.white.make().p8(),
                ],
              )
                  .onInkTap(_hc.customshort)
                  .card
                  .roundedSM
                  .color(kcMainPurple.withOpacity(0.2))
                  .make()
                  .p4(),
            ),
          ],
        ),
        Tween<double>(begin: 0, end: 5).evaluate(animation).squareBox,
        if (Tween<double>(begin: 0, end: 80).evaluate(animation) > 60)
          Container(
            height: Tween<double>(begin: 0, end: 70).evaluate(animation),
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: InkWell(
                    onTap: _hc.generateQR,
                    borderRadius: BorderRadius.circular(15),
                    child: Container(
                      decoration: BoxDecoration(
                          color: kcMainPink.withOpacity(0.25),
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: kcMainPurple)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: Tween<double>(begin: 0, end: 50)
                                .evaluate(animation),
                            child: WebsafeSvg.asset(
                              'assets/icons/qr_large.svg',
                              color: Colors.white,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                          'Generate QR'.text.xl3.bold.white.make().p4(),
                        ],
                      ).p8(),
                    ),
                  ).px4(),
                ),
              ],
            ),
          ),
        20.squareBox,
        Text(
          "Your Active Shortened Urls",
          style: TextStyle(
            fontSize: 23,
            color: Colors.white,
            shadows: [kShadow],
            fontWeight: FontWeight.w800,
          ),
        ),
      ],
    );
  }
}
