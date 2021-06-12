import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';

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

    Size size = MediaQuery.of(context).size;

    return WillPopScope(
      onWillPop: () {
        if (controller.menuKey.currentState.isDrawerOpen) {
          controller.menuKey.currentState.closeDrawer();
          return Future.value(false);
        } else
          return Future.value(true);
      },
      child: SliderMenuContainer(
        hasAppBar: false,
        key: controller.menuKey,
        animationDuration: 300,
        isDraggable: true,
        sliderMenuOpenSize: size.width * 0.6,
        slideDirection: SlideDirection.LEFT_TO_RIGHT,
        sliderMenu: MenuWidget(
          onItemClick: () => controller.menuKey.currentState.closeDrawer(),
        ),
        sliderMain: SliverAppBarSnap(
          maxHeight: 550,
          minHeight: 200,
          appBarContent: LayoutBuilder(
            builder: (context, constraints) => appbar.appBarContainer(
                AppBarContentExtended(
                    animation: appbar.getAnimation(constraints))),
          ),
          sliverList: FutureBuilder<UrlList>(
            future: Get.find<Api>().getUrlList(),
            // initialData: InitialData,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (!snapshot.hasData)
                return SliverFillRemaining(
                  hasScrollBody: false,
                  child: KLoadingWidget(),
                  fillOverscroll: true,
                );
              if (snapshot.data == null)
                return SliverFillRemaining(
                  hasScrollBody: false,
                  child: Center(
                    child: Text(
                      'List is Empty',
                      style: ktsSubHeading,
                    ),
                  ),
                );

              UrlList _urlList = snapshot.data;
              return SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    if (index >= _urlList.urlDetails.length)
                      return 50.heightBox;
                    UrlDetails urlDetails = _urlList.urlDetails[index];
                    return KBlurButton(
                      child: Text(
                        urlDetails.shortUrl,
                        style: ktsTitle,
                      ).p8(),
                    ).px16().py8();
                  },
                  childCount: _urlList.urlDetails.length < 10
                      ? 10
                      : _urlList.urlDetails.length, // must be min 10
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
