import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:soaurl/app/data/data.dart';

class KBackgroundContainer extends StatelessWidget {
  /// Contains background with custom images
  const KBackgroundContainer({
    Key? key,
    required this.size,
    required this.child,
  }) : super(key: key);

  final Size size;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      width: size.width,
      height: size.height,
      child: Stack(
        children: [
          Container(
            width: size.width,
            height: size.height,
            decoration: BoxDecoration(
              gradient: kcgMain,
            ),
            child: Stack(
              children: [
                Positioned(
                  right: -100,
                  top: -80,
                  child: Container(
                    child: SvgPicture.asset(
                      'assets/icons/link_large.svg',
                      color: Colors.black.withOpacity(0.08),
                    ),
                  ),
                ),
                Positioned(
                  left: -100,
                  bottom: -50,
                  child: Container(
                    child: SvgPicture.asset(
                      'assets/icons/qr_large.svg',
                      color: Colors.white.withOpacity(0.08),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: size.width,
            height: size.height,
            child: child,
          ),
        ],
      ),
    );
  }
}

class KBackgroundContainerOnlyGradient extends StatelessWidget {
  const KBackgroundContainerOnlyGradient({
    Key? key,
    required this.size,
    required this.child,
  }) : super(key: key);

  final Size size;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      height: size.height,
      decoration: BoxDecoration(
        gradient: kcgMain,
      ),
      child: child,
    );
  }
}
