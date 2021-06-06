import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:soaurl/app/data/data.dart';
import 'package:velocity_x/velocity_x.dart';

import '../controllers/home_controller.dart';
import 'appbar_content.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: KBackgroundContainer(
          size: size, child: SliverAppBarSnap() //HomeBody(size: size),
          ),
    );
  }
}

class SliverAppBarSnap extends StatefulWidget {
  @override
  _SliverAppBarSnapState createState() => _SliverAppBarSnapState();
}

class _SliverAppBarSnapState extends State<SliverAppBarSnap> {
  final _controller = ScrollController();

  double get maxHeight => 500 + MediaQuery.of(context).padding.top;
  double get minHeight => 180 + MediaQuery.of(context).padding.top;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0C0101),
      body: KBackgroundContainer(
        size: Get.mediaQuery.size,
        child: NotificationListener<ScrollEndNotification>(
          onNotification: (_) {
            _snapAppbar();
            return false;
          },
          child: CustomScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            controller: _controller,
            slivers: [
              SliverAppBar(
                pinned: true,
                stretch: true,
                elevation: 0,
                backgroundColor: Colors.transparent,
                flexibleSpace: AppBarContent(
                  maxHeight: maxHeight,
                  minHeight: minHeight,
                ),
                expandedHeight: maxHeight - MediaQuery.of(context).padding.top,
                collapsedHeight: minHeight - MediaQuery.of(context).padding.top,
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    if (index > 5) return 50.heightBox;
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
              )
            ],
          ),
        ),
      ),
    );
  }

  void _snapAppbar() {
    final scrollDistance = maxHeight - minHeight;

    if (_controller.offset > 0 && _controller.offset < scrollDistance) {
      final double snapOffset =
          _controller.offset / scrollDistance > 0.5 ? scrollDistance : 0;

      Future.microtask(() => _controller.animateTo(snapOffset,
          duration: Duration(milliseconds: 200), curve: Curves.easeIn));
    }
  }
}
