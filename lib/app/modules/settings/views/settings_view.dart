import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:soaurl/app/data/data.dart';
import 'package:velocity_x/velocity_x.dart';

import '../controllers/settings_controller.dart';

class SettingsView extends GetView<SettingsController> {
  @override
  Widget build(BuildContext context) {
    final double _minHeight = 78.0;
    final double _maxHeight = 285.0;
    final KAppBar appbar =
        new KAppBar(collapsedHeight: _minHeight, expandedHeight: _maxHeight);
    final _ss = Get.find<SettingsService>();
    return SliverAppBarSnap(
      maxHeight: _maxHeight,
      minHeight: _minHeight,
      appBarContent: LayoutBuilder(
        builder: (context, constraints) =>
            appbar.appBarContainer(KAppBarContent(
                animation: appbar.getAnimation(constraints),
                mainIcon: Icon(
                  Icons.settings_outlined,
                  size: Tween<double>(begin: 0, end: 125)
                      .evaluate(appbar.getAnimation(constraints)),
                ),
                title: 'Settings')),
      ),
      isChildScrollable: true,
      child: Column(
        children: [
          Obx(() => CheckboxListTile(
                value: _ss.showAd.value,
                activeColor: kcMainPurple,
                onChanged: (value) async {
                  // Get.dialog(Center(child: KLoadingWidget()),
                  //     barrierDismissible: false);
                  // AdService _ad = Get.find<AdService>();
                  // _ad.fullPageAd(
                  //   onClose: (_ad) {
                  //     // Get.log(_ad.type);
                  //   },
                  // )..load();
                  _ss.toggleShowAd();
                },
                title: 'Show Ads'.text.textStyle(ktsSubHeading).make(),
              )),
          Obx(() => CheckboxListTile(
                value: _ss.showLogoinQR.value,
                activeColor: kcMainPurple,
                onChanged: (value) => _ss.showLogoinQR.toggle(),
                title: 'Show Logo on QR'.text.textStyle(ktsSubHeading).make(),
              )),
        ],
      ),
    );
  }
}
