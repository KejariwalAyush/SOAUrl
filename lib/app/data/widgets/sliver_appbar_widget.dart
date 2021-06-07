import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data.dart';

class SliverAppBarSnap extends StatefulWidget {
  final double maxHeight;
  final double minHeight;
  final bool showAd;
  final Widget child;
  final bool isChildScrollable;
  final SliverChildBuilderDelegate sliverChildBuilderDelegate;
  final Widget appBarContent;

  const SliverAppBarSnap(
      {Key key,
      this.maxHeight = 500,
      this.minHeight = 180,
      this.showAd = true,
      this.child,
      this.sliverChildBuilderDelegate,
      this.isChildScrollable = false,
      @required this.appBarContent})
      : assert(child != null || sliverChildBuilderDelegate != null),
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
    return Scaffold(
      backgroundColor: kcBlack,
      bottomNavigationBar: widget.showAd ? BannerAdWidget() : null,
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
                flexibleSpace: widget.appBarContent,
                expandedHeight: maxHeight - Get.mediaQuery.padding.top,
                collapsedHeight: minHeight - Get.mediaQuery.padding.top,
              ),
              if (widget.child != null)
                SliverFillRemaining(
                  hasScrollBody: widget.isChildScrollable,
                  child: widget.child,
                ),
              if (widget.sliverChildBuilderDelegate != null)
                SliverList(delegate: widget.sliverChildBuilderDelegate),
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
