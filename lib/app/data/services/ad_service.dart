import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:soaurl/app/data/secret/ad_secrets.dart';

import '../data.dart';

class AdService extends GetxService {
  Future<AdService> init() async {
    if (GetPlatform.isMobile) await MobileAds.instance.initialize();
    print('$runtimeType ready!');
    return this;
  }

  String get bannerAdUnitId {
    if (Platform.isAndroid) {
      if (kDebugMode || kProfileMode)
        return AdSecrets.androidtestBannerAdUnitId;
      else
        return AdSecrets.androidBannerAdUnitId;
    } else {
      throw new UnsupportedError('Unsupported platform');
    }
  }

  String get interstitialAdUnitId {
    if (Platform.isAndroid) {
      if (kDebugMode || kProfileMode)
        return AdSecrets.androidtestInterstitialAdUnitId;
      else
        return AdSecrets.androidInterstitialAdUnitId;
    } else {
      throw new UnsupportedError("Unsupported platform");
    }
  }

  String get rewardedAdUnitId {
    if (Platform.isAndroid) {
      if (kDebugMode || kProfileMode)
        return AdSecrets.androidtestRewardedAdUnitId;
      else
        return AdSecrets.androidRewardedAdUnitId;
    } else {
      throw new UnsupportedError("Unsupported platform");
    }
  }

  BannerAd bannerAd({Function()? onLoaded, Function()? onFailed}) {
    return BannerAd(
      adUnitId: bannerAdUnitId,
      request: AdRequest(),
      size: AdSize.banner,
      listener: AdListener(
        onAdLoaded: (_) {
          Get.log('Banner Ad Loaded');
          if (onLoaded != null) onLoaded();
        },
        onAdFailedToLoad: (ad, err) {
          Get.log('Failed to load a banner ad: ${err.message}');

          ad.dispose();
          if (onFailed != null) onFailed();
        },
      ),
    );
  }

  InterstitialAd fullPageAd({Function(Ad)? onClose}) {
    return InterstitialAd(
        adUnitId: interstitialAdUnitId,
        listener: AdListener(
          onAdLoaded: (_) {
            Get.log('Full page Ad Loaded');
          },
          onAdFailedToLoad: (ad, err) {
            Get.log('Failed to load a Full Page ad: ${err.message}');
            ad.dispose();
          },
          onAdClosed: onClose,
        ),
        request: AdRequest());
  }

  RewardedAd rewardedAd(
      {Function(Ad)? onClose,
      required Function(RewardedAd, RewardItem) onCompleteWatching}) {
    return RewardedAd(
        adUnitId: rewardedAdUnitId,
        listener: AdListener(
            onAdLoaded: (_) {
              Get.log('Reward Ad Loaded');
            },
            onAdFailedToLoad: (ad, err) {
              Get.log('Failed to load a Reward ad: ${err.message}');
              ad.dispose();
            },
            onAdClosed: onClose,
            onRewardedAdUserEarnedReward: onCompleteWatching),
        request: AdRequest());
  }
}
