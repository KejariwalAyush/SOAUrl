import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app/data/data.dart';
import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ));
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(MyApp()));
}

initServices() async {
  Get.log('starting services ...');
  await Firebase.initializeApp();

  /// Here is where you put get_storage, hive, shared_pref initialization.
  /// or moor connection, or whatever that's async.
  ///
  if (GetPlatform.isAndroid) {
    await Get.putAsync(() => ReceiveIntentService().init());
    await Get.putAsync(() => RemoteConfigService().init());
    await Get.putAsync(() => AdService().init());
    await Get.putAsync(() => AnalyticsService().init());
    await Get.putAsync(() => FCMService().init());
  }
  await Get.putAsync(() => StorageService().init());
  await Get.putAsync(() => SettingsService().init());
  await Get.putAsync(() => AuthService().init());
  await Get.putAsync(() => Api().init());
  Get.log('All services started...');
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FirebaseAnalytics analytics = FirebaseAnalytics();
    return GetMaterialApp(
      title: 'SOAUrl',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        textTheme: GoogleFonts.cormorantGaramondTextTheme(),
      ),
      transitionDuration: kAnimationDuration,
      defaultTransition: Transition.cupertino,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      navigatorObservers: [
        FirebaseAnalyticsObserver(analytics: analytics),
      ],
      onDispose: onDispose,
    );
  }

  void onDispose() {
    Get.find<ReceiveIntentService>().dispose();
  }
}
