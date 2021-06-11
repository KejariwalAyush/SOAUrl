import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:soaurl/app/data/data.dart';
import 'package:websafe_svg/websafe_svg.dart';

import '../controllers/short_controller.dart';

class ShortView extends GetView<ShortController> {
  @override
  Widget build(BuildContext context) {
    final double _minHeight = 78.0;
    final double _maxHeight = 285.0;
    final KAppBar appbar =
        new KAppBar(collapsedHeight: _minHeight, expandedHeight: _maxHeight);
    return SliverAppBarSnap(
      maxHeight: _maxHeight,
      minHeight: _minHeight,
      appBarContent: LayoutBuilder(
        builder: (context, constraints) =>
            appbar.appBarContainer(KAppBarContent(
                animation: appbar.getAnimation(constraints),
                mainIcon: WebsafeSvg.asset(
                  'assets/icons/url.svg',
                  fit: BoxFit.fill,
                  height: Tween<double>(begin: 0, end: 125)
                      .evaluate(appbar.getAnimation(constraints)),
                ),
                title: 'Shorten URL')),
      ),
      isChildScrollable: true,
      child: Center(
        child: Text(
          'ShortView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
