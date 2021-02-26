import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:soaurl/home/MainScreen.dart';
import 'package:soaurl/Splash.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        textTheme: GoogleFonts.cormorantGaramondTextTheme(),
      ),
      home: MainScreen(),
    );
  }
}
