import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app/data/data.dart';
import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(MyApp()));
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

      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,

      // home: Splash(),
    );
  }
}
