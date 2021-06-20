import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:soaurl/app/data/data.dart';

class AnalyticsService extends GetxService {
  late FirebaseAnalytics _analytics;

  Future<AnalyticsService> init() async {
    _analytics = FirebaseAnalytics();
    if (kDebugMode && GetPlatform.isWeb) {
      // Force disable Crashlytics collection while doing every day development.
      // Temporarily toggle this to true if you want to test crash reporting in your app.
      await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(false);
    } else {
      await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
      // Handle Crashlytics enabled status when not in Debug,
      // e.g. allow your users to opt-in to crash reporting.
    }
    return this;
  }

  // User properties tells us what the user is
  Future setUserProperties({required String userId, String? userRole}) async {
    await _analytics.setUserId(userId);
    await _analytics.setUserProperty(name: 'user_role', value: userRole);
    // property to indicate if it's a pro paying member
    // property that might tell us it's a regular poster, etc
  }

  Future logLogin() async => await _analytics.logLogin(loginMethod: 'google');
  Future logLogout() async => await _analytics.logEvent(name: 'logout');

  Future logSignUp() async =>
      await _analytics.logSignUp(signUpMethod: 'google');

  Future logAppOpen() async => await _analytics.logAppOpen();

  Future logQRGenerated() async => await _analytics.logEvent(name: 'qr');

  Future logCustomLinkCreated(bool success) async => await _analytics
      .logEvent(name: 'custom_link', parameters: {'success': success});

  Future logQuickLinkCreated(bool success) async => await _analytics
      .logEvent(name: 'quick_link', parameters: {'success': success});

  Future logCheckLinkAvailable(bool success) async => await _analytics
      .logEvent(name: 'check_link', parameters: {'success': success});

  Future logAppShare() async => await _analytics.logShare(
      contentType: 'App Share', itemId: '0', method: 'in_app');

  Future logShare(
          {required String itemName, required bool isScreenshotShare}) async =>
      await _analytics.logShare(
          contentType: isScreenshotShare ? 'screenshot' : 'link',
          itemId: itemName,
          method: 'in_app');

  Future logUnAuthorized({required String link}) async => await _analytics
      .logEvent(name: 'UnAuthorized', parameters: {'link': link});
  Future logApiError({required String message, required String link}) async =>
      await _analytics.logEvent(
          name: 'api_error', parameters: {'message': message, 'link': link});
}
