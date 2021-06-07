import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:soaurl/app/data/data.dart';
import 'package:websafe_svg/websafe_svg.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    final double _minHeight = 78.0;
    final double _maxHeight = 275.0;
    final KAppBar appbar =
        new KAppBar(collapsedHeight: _minHeight, expandedHeight: _maxHeight);
    return SliverAppBarSnap(
      maxHeight: _maxHeight,
      minHeight: _minHeight,
      showAd: false,
      appBarContent: LayoutBuilder(
        builder: (context, constraints) =>
            appbar.appBarContainer(KAppBarContent(
                animation: appbar.getAnimation(constraints),
                mainIcon: WebsafeSvg.asset(
                  'assets/icons/profile.svg',
                  fit: BoxFit.fill,
                ),
                title: 'Profile')),
      ),
      isChildScrollable: true,
      child: Text(
        "List is empty",
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
