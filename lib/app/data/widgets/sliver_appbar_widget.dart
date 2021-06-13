import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data.dart';

/// For child use Container only
class SliverAppBarSnap extends StatefulWidget {
  final double maxHeight;
  final double minHeight;
  final bool showAd;
  final Widget? child;
  final bool isChildScrollable;
  final Widget? sliverList;
  final Widget appBarContent;

  const SliverAppBarSnap(
      {Key? key,
      this.maxHeight = 500,
      this.minHeight = 180,
      this.showAd = true,
      this.child,
      this.sliverList,
      this.isChildScrollable = false,
      required this.appBarContent})
      : assert(child != null || sliverList != null),
        super(key: key);
  @override
  _SliverAppBarSnapState createState() => _SliverAppBarSnapState();
}

class _SliverAppBarSnapState extends State<SliverAppBarSnap> {
  final _controller = ScrollController();

  double get maxHeight => widget.maxHeight + Get.mediaQuery.padding.top;
  double get minHeight => widget.minHeight + Get.mediaQuery.padding.top;

  @override
  Widget build(BuildContext context) {
    final _ss = Get.find<SettingsService>();
    return Scaffold(
      backgroundColor: kcBlack,
      bottomNavigationBar: !widget.showAd || GetPlatform.isWeb
          ? null
          : Obx(
              () => (_ss.showAd.value) ? BannerAdWidget() : SizedBox.shrink()),
      body: KBackgroundContainer(
        size: Get.mediaQuery.size,
        child: NotificationListener<ScrollEndNotification>(
          onNotification: (_) {
            snapAppbar();
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
                automaticallyImplyLeading: false,
                backgroundColor: Colors.transparent,
                flexibleSpace: widget.appBarContent,
                expandedHeight: maxHeight - Get.mediaQuery.padding.top,
                collapsedHeight: minHeight - Get.mediaQuery.padding.top,
              ),
              if (widget.child != null)
                SliverFillRemaining(
                  hasScrollBody: widget.isChildScrollable,
                  child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      child: widget.child),
                ),
              if (widget.sliverList != null) widget.sliverList!,
              // SliverList(delegate: widget.sliverList),
            ],
          ),
        ),
      ),
    );
  }

  void snapAppbar() {
    final scrollDistance = maxHeight - minHeight;

    if (_controller.offset > 0 && _controller.offset < scrollDistance) {
      final double snapOffset =
          _controller.offset / scrollDistance > 0.5 ? scrollDistance : 0;

      Future.microtask(() => _controller.animateTo(snapOffset,
          duration: Duration(milliseconds: 200), curve: Curves.easeIn));
    }
  }
}
