import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:websafe_svg/websafe_svg.dart';

import '../data.dart';

class KAppBar {
  final double _maxHeight;
  final double _minHeight;
  final double expandedHeight;
  final double collapsedHeight;

  KAppBar({required this.expandedHeight, required this.collapsedHeight})
      : this._maxHeight = expandedHeight + Get.mediaQuery.padding.top,
        this._minHeight = collapsedHeight + Get.mediaQuery.padding.top;

  double _calculateExpandRatio(BoxConstraints constraints) {
    var expandRatio =
        (constraints.maxHeight - _minHeight) / (_maxHeight - _minHeight);
    if (expandRatio > 1.0) expandRatio = 1.0;
    if (expandRatio < 0.0) expandRatio = 0.0;
    return expandRatio;
  }

  AlwaysStoppedAnimation<double> getAnimation(BoxConstraints constraints) =>
      AlwaysStoppedAnimation(_calculateExpandRatio(constraints));

  /// Add your widgets with animation here in `child`
  ///
  /// get animation variable by calling getAnimation with LayoutBuilder
  /// ```
  /// KAppBar kappbar = new KAppBar(collapsedHeight: 180, expandedHeight: 500);
  /// LayoutBuilder(
  ///    builder: (context, constraints) {
  ///     final animate = kappbar.getAnimation(constrains);
  ///     return Container(
  ///        padding: EdgeInsets.only(
  ///          bottom: Tween<double>(begin: 0, end: 10).evaluate(animation),
  ///        child: ...
  ///        ),
  ///   },
  /// );
  /// ```
  ///
  Widget appBarContainer(Widget child) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final animation = getAnimation(constraints);

        return Container(
          padding: EdgeInsets.only(
            bottom: Tween<double>(begin: 0, end: 10).evaluate(animation),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(
                  Tween<double>(begin: kBorderRadius.bottomLeft.x, end: 0)
                      .evaluate(animation)),
              bottomRight: Radius.circular(
                  Tween<double>(begin: kBorderRadius.bottomLeft.x, end: 0)
                      .evaluate(animation)),
            ),
            gradient: LinearGradient(
              begin: Alignment(1.0, -1.0),
              end: Alignment(-1.0, 5.0),
              colors: [
                ColorTween(begin: kcMainPink, end: Colors.transparent)
                    .evaluate(animation)!,
                ColorTween(begin: kcMainPurple, end: Colors.transparent)
                    .evaluate(animation)!
              ],
              stops: [0.0, 1.0],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Get.mediaQuery.padding.top.squareBox,
              Container(
                  padding: EdgeInsets.all(20), width: Get.width, child: child),
            ],
          ),
        );
      },
    );
  }
}

class KAppBarContent extends StatelessWidget {
  final AlwaysStoppedAnimation<double> animation;
  final Widget? trailingButton;
  final Widget? mainIcon;
  final String title;
  final String? desc;

  const KAppBarContent(
      {Key? key,
      required this.animation,
      this.trailingButton,
      required this.mainIcon,
      required this.title,
      this.desc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      // alignment:Alignment.,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () => Get.back(),
              radius: 10,
              child: WebsafeSvg.asset(
                'assets/icons/back_arrow.svg',
                fit: BoxFit.fill,
                height: 30,
              ),
            ),
            (trailingButton != null) ? trailingButton! : 50.widthBox,
          ],
        ),
        Align(
          alignment:
              AlignmentTween(begin: Alignment.center, end: Alignment.centerLeft)
                  .evaluate(animation),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Tween<double>(begin: 0, end: 50).evaluate(animation).heightBox,
              if (mainIcon != null)
                Container(
                  height: Tween<double>(begin: 0, end: 125).evaluate(animation),
                  width: Tween<double>(begin: 0, end: 125).evaluate(animation),
                  child: mainIcon,
                ),
              Tween<double>(begin: 0, end: 15).evaluate(animation).heightBox,
              Text(
                title,
                style: TextStyle(
                  fontSize:
                      Tween<double>(begin: 30, end: 36).evaluate(animation),
                  color: Colors.white,
                  shadows: [kShadow],
                  fontWeight: FontWeight.w800,
                ),
              ),
              if (desc != null)
                Text(
                  desc!,
                  style: TextStyle(
                    fontSize:
                        Tween<double>(begin: 0, end: 18).evaluate(animation),
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
