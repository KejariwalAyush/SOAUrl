import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:soaurl/app/data/data.dart';

import '../controllers/notifications_controller.dart';

class NotificationsView extends GetView<NotificationsController> {
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
                mainIcon: Icon(
                  Icons.notifications,
                  size: Tween<double>(begin: 0, end: 125)
                      .evaluate(appbar.getAnimation(constraints)),
                ),
                title: 'Notifications')),
      ),
      // sliverChildBuilderDelegate: ,
      isChildScrollable: true,
      child: Center(
        child: Text(
          'No Notifications Yet',
          style: ktsTitle,
        ),
      ),
    );
  }
}
