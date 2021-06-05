import 'package:flutter/material.dart';

final Color kcMainPink = const Color(0xffc651cd);
final Color kcMainPurple = const Color(0xff441d7d);

final Color kcWhite = Color(0xfff2eaff);
final Color kcBlack = Color(0xff242424);

final Color kcBlackShadow = Color(0xa1363636);

final LinearGradient kcgMain = LinearGradient(
  begin: Alignment(1.0, -1.0),
  end: Alignment(-1.0, 1.0),
  colors: [kcMainPink, kcMainPurple],
  stops: [0.0, 1.0],
);

final LinearGradient kcgSec = LinearGradient(
  begin: Alignment(1.0, -1.0),
  end: Alignment(-1.0, 1.0),
  colors: [kcMainPink, kcMainPurple],
  stops: [0.0, 1.0],
);
