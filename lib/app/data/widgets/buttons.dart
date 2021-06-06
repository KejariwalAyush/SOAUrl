import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:velocity_x/velocity_x.dart';
import '../utils/colors.dart';
import '../utils/constants.dart';
import '../utils/styles.dart';

class KbWhiteButton extends StatelessWidget {
  KbWhiteButton({
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
  Widget child;

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
    this.size,
    this.onPressed,
  }) : super(key: key);

  final Size size;
  final Widget child;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed ?? null,
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 15.0, sigmaY: 15.0),
          child: Container(
            width: size.width ?? null,
            height: size.height ?? null,
            decoration: BoxDecoration(
              borderRadius: kBorderRadius,
              color: Colors.transparent,
              border: kBorder,
              boxShadow: [kShadow],
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
