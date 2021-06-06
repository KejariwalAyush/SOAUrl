import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:soaurl/app/data/data.dart';
import 'package:soaurl/app/data/services/ad_service.dart';
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

  BannerAd _bannerAd;
  bool _isBannerAdReady = false;

  double get maxHeight => 500 + MediaQuery.of(context).padding.top;
  double get minHeight => 180 + MediaQuery.of(context).padding.top;

  @override
  void initState() {
    super.initState();
    _bannerAd = BannerAd(
      adUnitId: AdService.bannerAdUnitId,
      request: AdRequest(),
      size: AdSize.banner,
      listener: AdListener(
        onAdLoaded: (_) {
          Get.log('Ad Loaded');
          setState(() {
            _isBannerAdReady = true;
          });
        },
        onAdFailedToLoad: (ad, err) {
          Get.log('Failed to load a banner ad: ${err.message}');
          _isBannerAdReady = false;
          ad.dispose();
        },
      ),
    );

    _bannerAd.load();
  }

  @override
  void dispose() {
    _bannerAd.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kcBlack,
      bottomNavigationBar: !(_isBannerAdReady)
          ? null
          : Container(
              width: _bannerAd.size.width.toDouble(),
              height: _bannerAd.size.height.toDouble(),
              child: AdWidget(ad: _bannerAd),
            ),
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
              ),
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
