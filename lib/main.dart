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
  await Get.putAsync(() => AdService().init());
  await Get.putAsync(() => SettingsService().init());
  await Get.putAsync(() => AuthService().init());
  await Get.putAsync(() => Api().init());
  Get.log('All services started...');
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'SOAUrl',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        textTheme: GoogleFonts.cormorantGaramondTextTheme(),
      ),
      transitionDuration: kaniBase,
      defaultTransition: Transition.cupertino,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,

      // home: Splash(),
    );
  }
}
