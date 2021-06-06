import 'package:flutter/material.dart';
import 'package:soaurl/app/data/data.dart';
import 'package:soaurl/app/modules/home/controllers/home_controller.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:websafe_svg/websafe_svg.dart';

class AppBarContent extends StatelessWidget {
  final double maxHeight;
  final double minHeight;

  const AppBarContent({Key key, this.maxHeight, this.minHeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeController _hc = Get.find<HomeController>();
    return LayoutBuilder(
      builder: (context, constraints) {
        final expandRatio = _calculateExpandRatio(constraints);
        final animation = AlwaysStoppedAnimation(expandRatio);

        return Container(
          alignment: AlignmentTween(
                  begin: Alignment.bottomCenter, end: Alignment.bottomLeft)
              .evaluate(animation),
          padding: EdgeInsets.only(
            bottom: Tween<double>(begin: 0, end: 10).evaluate(animation),
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(1.0, -1.0),
              end: Alignment(-1.0, 5.0),
              colors: [
                ColorTween(begin: kcMainPink, end: Colors.transparent)
                    .evaluate(animation),
                ColorTween(begin: kcMainPurple, end: Colors.transparent)
                    .evaluate(animation)
              ],
              stops: [0.0, 1.0],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Get.mediaQuery.padding.top.squareBox,
              Container(
                padding: EdgeInsets.all(20),
                width: Get.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: _hc.viewProfile,
                          child: WebsafeSvg.asset(
                            'assets/icons/profile.svg',
                            fit: BoxFit.fill,
                            height: 30,
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Tween<double>(begin: 0, end: 40)
                                .evaluate(animation)
                                .squareBox,
                            WebsafeSvg.asset(
                              'assets/icons/logo.svg',
                              fit: BoxFit.fill,
                              height: Tween<double>(begin: 0, end: 125)
                                  .evaluate(animation),
                            ),
                            Text(
                              "SOAUrl",
                              style: TextStyle(
                                fontSize: Tween<double>(begin: 30, end: 36)
                                    .evaluate(animation),
                                color: Colors.white,
                                shadows: [kShadow],
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            Text(
                              "Shortform Of Any Url",
                              style: TextStyle(
                                fontSize: Tween<double>(begin: 0, end: 18)
                                    .evaluate(animation),
                                color: Colors.white,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ],
                        ),
                        InkWell(
                          onTap: _hc.openDrawer,
                          child: RotatedBox(
                            quarterTurns: 2,
                            child: WebsafeSvg.asset(
                              'assets/icons/menu.svg',
                              fit: BoxFit.fill,
                              height: 30,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Tween<double>(begin: 15, end: 30)
                        .evaluate(animation)
                        .squareBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: KBlurButton(
                            child: 'Quick Shorten'
                                .text
                                .center
                                .textStyle(ktsButtonBlank)
                                .make()
                                .py2(),
                            onPressed: _hc.quickshort,
                          ).px4(),
                        ),
                        Expanded(
                          child: KBlurButton(
                                  child: 'Custom Shorten'
                                      .text
                                      .center
                                      .textStyle(ktsButtonBlank)
                                      .make()
                                      .py2(),
                                  onPressed: _hc.customshort)
                              .px4(),
                        ),
                      ],
                    ),
                    Container(
                      height:
                          Tween<double>(begin: 0, end: 80).evaluate(animation),
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: KBlurButton(
                                    child: 'QR Scan'
                                        .text
                                        .center
                                        .textStyle(ktsButtonBlank)
                                        .make()
                                        .py2(),
                                    onPressed: _hc.scanQR)
                                .px4(),
                          ),
                          Expanded(
                            child: KBlurButton(
                                    child: 'QR Generate'
                                        .text
                                        .center
                                        .textStyle(ktsButtonBlank)
                                        .make()
                                        .py2(),
                                    onPressed: _hc.generateQR)
                                .px4(),
                          ),
                        ],
                      ),
                    ),
                    Tween<double>(begin: 14, end: 20)
                        .evaluate(animation)
                        .squareBox,
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
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  double _calculateExpandRatio(BoxConstraints constraints) {
    var expandRatio =
        (constraints.maxHeight - minHeight) / (maxHeight - minHeight);
    if (expandRatio > 1.0) expandRatio = 1.0;
    if (expandRatio < 0.0) expandRatio = 0.0;
    return expandRatio;
  }
}
