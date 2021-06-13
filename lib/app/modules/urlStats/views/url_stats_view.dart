import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:soaurl/app/data/data.dart';
import 'package:soaurl/app/data/widgets/display_qr.dart';

import '../controllers/url_stats_controller.dart';

class UrlStatsView extends GetView<UrlStatsController> {
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
        builder: (context, constraints) => appbar.appBarContainer(
            KAppBarContent(
                animation: appbar.getAnimation(constraints),
                mainIcon: DisplayQR(
                    previewContainer: controller.previewContainer,
                    qrData: 'http://soau.ml/' + Get.parameters.toString()),
                title: 'URL - /${Get.parameters['data']}')),
      ),
      isChildScrollable: true,
      child: Center(
        child: Text(
          'Stats is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
