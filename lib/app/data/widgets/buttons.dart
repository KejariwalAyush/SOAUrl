import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:velocity_x/velocity_x.dart';
import '../utils/colors.dart';
import '../utils/constants.dart';
import '../utils/styles.dart';

class KbWhiteButton extends StatelessWidget {
  const KbWhiteButton({
    Key key,
    @required this.child,
    @required this.onPressed,
  }) : super(key: key);

  KbWhiteButton.google({Key key, @required this.onPressed})
      : child = Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(FontAwesomeIcons.google),
            16.squareBox,
            Text(
              'Continue with Google',
              style: ktsButton,
            ),
          ],
        ),
        super(key: key);

  final Function() onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: kcWhite,
          borderRadius: kBorderRadius,
          boxShadow: [kShadow],
          border: kBorder,
        ),
        child: child.p12(),
      ),
    );
  }
}

class KBlurButton extends StatelessWidget {
  const KBlurButton({
    Key key,
    @required this.child,
    this.width,
    this.onPressed,
  }) : super(key: key);

  final double width;
  final Widget child;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: kBorderRadius,
      onTap: onPressed ?? null,
      child: ClipRect(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
          child: Container(
            width: width ?? null,
            decoration: BoxDecoration(
              borderRadius: kBorderRadius,
              color: kcBlackShadow.withOpacity(0.3),
              border: kBorder,
              // boxShadow: [kShadow],
            ),
            child: child.p8(),
          ),
        ),
      ),
    );
  }
}
