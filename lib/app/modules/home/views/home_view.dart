import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:soaurl/app/data/data.dart';
import 'package:velocity_x/velocity_x.dart';

import '../controllers/home_controller.dart';
import 'appbar_content.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    final KAppBar appbar =
        new KAppBar(collapsedHeight: 200, expandedHeight: 550);

    return SliverAppBarSnap(
      maxHeight: 550,
      minHeight: 200,
      showAd: false,
      appBarContent: LayoutBuilder(
        builder: (context, constraints) => appbar.appBarContainer(
            AppBarContentExtended(animation: appbar.getAnimation(constraints))),
      ),
      sliverChildBuilderDelegate: SliverChildBuilderDelegate(
        (context, index) {
          // if (index > 5) return 50.heightBox;
          return KBlurButton(
            child: Text(
              "Item $index",
              style: ktsTitle,
            ).p8(),
          ).px16().py8();
        },
        //TODO: if card is less than then add blank cards
        childCount: 10, // must be min 10
      ),
    );
  }
}
