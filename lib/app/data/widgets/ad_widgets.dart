import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:soaurl/app/data/data.dart';

class BannerAdWidget extends StatefulWidget {
  const BannerAdWidget({
    Key? key,
  }) : super(key: key);

  @override
  _BannerAdWidgetState createState() => _BannerAdWidgetState();
}

class _BannerAdWidgetState extends State<BannerAdWidget> {
  late AdService _ad;
  late BannerAd _bannerAd;
  bool _isBannerAdReady = false;
  @override
  void initState() {
    super.initState();
    _ad = Get.find<AdService>();
    _bannerAd = _ad.bannerAd(
      onLoaded: () {
        setState(() {
          _isBannerAdReady = true;
        });
      },
      onFailed: () {
        setState(() {
          _isBannerAdReady = false;
        });
      },
    )..load();
  }

  @override
  Widget build(BuildContext context) {
    if (_isBannerAdReady)
      return Container(
        alignment: Alignment.bottomCenter,
        width: _bannerAd.size.width.toDouble(),
        height: _bannerAd.size.height.toDouble(),
        child: AdWidget(ad: _bannerAd),
      );
    else
      return SizedBox.shrink();
    // return FutureBuilder<bool>(
    //   future: _bannerAd.isLoaded(),
    //   builder: (BuildContext context, AsyncSnapshot snapshot) {
    //     if (snapshot.hasData) {
    //       Get.log(snapshot.data.toString());
    //       if (snapshot.data)
    //         return Container(
    //           width: _bannerAd.size.width.toDouble(),
    //           height: _bannerAd.size.height.toDouble(),
    //           child: AdWidget(ad: _bannerAd),
    //         );
    //       else {
    //         print('loading ad...');
    //         return SizedBox.shrink();
    //       }
    //     } else {
    //       print('loading ad...');
    //       return SizedBox.shrink();
    //     }
    //   },
    // );
  }
}
