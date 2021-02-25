import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BackgroundWidget extends StatelessWidget {
  /// It Contains the background Structure of the app
  const BackgroundWidget({
    Key key,
    @required this.size,
    @required this.child,
  }) : super(key: key);

  final Size size;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(1.0, -1.0),
          end: Alignment(-1.0, 1.0),
          colors: [const Color(0xffc651cd), const Color(0xff441d7d)],
          stops: [0.0, 1.0],
        ),
      ),
      child: Stack(
        children: [
          Container(
            width: size.width,
            height: size.height,
            child: child,
          ),
          Positioned(
            right: -100,
            top: -80,
            child: Container(
              child: SvgPicture.asset(
                'assets/images/link_large.svg',
                color: Colors.black.withOpacity(0.1),
              ),
            ),
          ),
          Positioned(
            left: -100,
            bottom: -50,
            child: Container(
              child: SvgPicture.asset(
                'assets/images/qr_large.svg',
                color: Colors.white.withOpacity(0.08),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
