import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GenerateQrButton extends StatelessWidget {
  const GenerateQrButton({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width * 0.40,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        color: Colors.white.withOpacity(0.45),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: SvgPicture.asset(
                'assets/icons/qr_large.svg',
                color: Colors.black,
                height: 100,
                width: 100,
                fit: BoxFit.fill,
              ),
            ),
            Text.rich(
              TextSpan(
                style: TextStyle(
                  // fontFamily: 'Sitka Display',
                  fontSize: 16,
                  color: Colors.black,
                ),
                children: [
                  TextSpan(
                    text: 'Make your own\n',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  TextSpan(
                    text: 'QR Code',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: false),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
