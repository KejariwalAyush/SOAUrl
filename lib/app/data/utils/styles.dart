import 'package:flutter/material.dart';
import 'colors.dart';

final TextStyle ktsHeading1 = TextStyle(
  fontSize: 65,
  color: kcWhite,
  fontWeight: FontWeight.w700,
  shadows: [
    Shadow(
      color: kcBlackShadow,
      offset: Offset(0, 3),
      blurRadius: 6,
    )
  ],
);

final TextStyle ktsHeading2 = TextStyle(
  fontSize: 45,
  color: kcWhite,
  fontWeight: FontWeight.w600,
  shadows: [
    Shadow(
      color: kcBlackShadow,
      offset: Offset(0, 3),
      blurRadius: 4,
    )
  ],
);

final TextStyle ktsTitle = TextStyle(
  fontSize: 30,
  color: kcWhite,
  fontWeight: FontWeight.w600,
  shadows: [
    Shadow(
      color: const Color(0xa1363636),
      offset: Offset(0, 3),
      blurRadius: 4,
    )
  ],
);

final TextStyle ktsSubHeading = TextStyle(
  fontSize: 15,
  color: kcWhite,
  fontWeight: FontWeight.w600,
);

final TextStyle ktsButton = TextStyle(
  fontSize: 20,
  color: kcBlack,
  fontWeight: FontWeight.w800,
);

final TextStyle ktsButtonBlank = TextStyle(
  fontSize: 15,
  color: kcWhite,
  fontWeight: FontWeight.w600,
);
