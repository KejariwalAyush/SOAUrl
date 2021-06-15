import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({
    Key? key,
    this.size = 100,
    this.padding = 10,
    this.color = const Color(0xff000000),
  }) : super(key: key);

  final double size;
  final double padding;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: CustomPaint(
        size: Size(size, size),
        painter: _LogoCustomPainter(color: color),
      ),
    );
  }
}

//Copy this CustomPainter code to the Bottom of the File
class _LogoCustomPainter extends CustomPainter {
  final Color color;

  _LogoCustomPainter({required this.color});
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.06666667;
    paint0Stroke.color = color;
    paint0Stroke.strokeCap = StrokeCap.round;
    paint0Stroke.strokeJoin = StrokeJoin.round;
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.03333333, size.height * 0.03261579,
                size.width * 0.3604762, size.height * 0.3785295),
            bottomRight: Radius.circular(size.width * 0.09523810),
            bottomLeft: Radius.circular(size.width * 0.09523810),
            topLeft: Radius.circular(size.width * 0.09523810),
            topRight: Radius.circular(size.width * 0.09523810)),
        paint0Stroke);

    Paint paint1Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.06666667;
    paint1Stroke.color = color;
    paint1Stroke.strokeCap = StrokeCap.round;
    paint1Stroke.strokeJoin = StrokeJoin.round;
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.1476190, size.height * 0.1530146,
                size.width * 0.1319048, size.height * 0.1376386),
            bottomRight: Radius.circular(size.width * 0.04761905),
            bottomLeft: Radius.circular(size.width * 0.04761905),
            topLeft: Radius.circular(size.width * 0.04761905),
            topRight: Radius.circular(size.width * 0.04761905)),
        paint1Stroke);

    Paint paint2Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.06666667;
    paint2Stroke.color = color;
    paint2Stroke.strokeCap = StrokeCap.round;
    paint2Stroke.strokeJoin = StrokeJoin.round;
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.6061905, size.height * 0.03261579,
                size.width * 0.3604762, size.height * 0.3785295),
            bottomRight: Radius.circular(size.width * 0.09523810),
            bottomLeft: Radius.circular(size.width * 0.09523810),
            topLeft: Radius.circular(size.width * 0.09523810),
            topRight: Radius.circular(size.width * 0.09523810)),
        paint2Stroke);

    Paint paint3Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.06666667;
    paint3Stroke.color = color;
    paint3Stroke.strokeCap = StrokeCap.round;
    paint3Stroke.strokeJoin = StrokeJoin.round;
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.7204762, size.height * 0.1530146,
                size.width * 0.1319048, size.height * 0.1376386),
            bottomRight: Radius.circular(size.width * 0.04761905),
            bottomLeft: Radius.circular(size.width * 0.04761905),
            topLeft: Radius.circular(size.width * 0.04761905),
            topRight: Radius.circular(size.width * 0.04761905)),
        paint3Stroke);

    Paint paint4Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.06666667;
    paint4Stroke.color = color;
    paint4Stroke.strokeCap = StrokeCap.round;
    paint4Stroke.strokeJoin = StrokeJoin.round;
    canvas.drawLine(Offset(size.width * 0.03333333, size.height * 0.5294008),
        Offset(size.width * 0.9666667, size.height * 0.5294008), paint4Stroke);

    Paint paint5Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.06666667;
    paint5Stroke.color = color;
    paint5Stroke.strokeCap = StrokeCap.round;
    paint5Stroke.strokeJoin = StrokeJoin.round;
    canvas.drawLine(Offset(size.width * 0.5000000, size.height * 0.03261579),
        Offset(size.width * 0.5000000, size.height * 0.4111453), paint5Stroke);

    Path path_6 = Path();
    path_6.moveTo(size.width * 0.3476190, size.height * 0.9673842);
    path_6.lineTo(size.width * 0.1454286, size.height * 0.9673842);
    path_6.arcToPoint(Offset(size.width * 0.04285714, size.height * 0.8666480),
        radius:
            Radius.elliptical(size.width * 0.1026667, size.height * 0.1004566),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path_6.lineTo(size.width * 0.04285714, size.height * 0.7415898);
    path_6.arcToPoint(Offset(size.width * 0.1454286, size.height * 0.6412264),
        radius:
            Radius.elliptical(size.width * 0.1025714, size.height * 0.1003634),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path_6.lineTo(size.width * 0.4545714, size.height * 0.6412264);
    path_6.arcToPoint(Offset(size.width * 0.5571429, size.height * 0.7415898),
        radius:
            Radius.elliptical(size.width * 0.1025714, size.height * 0.1003634),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path_6.lineTo(size.width * 0.5571429, size.height * 0.8182835);

    Paint paint6Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.06666667;
    paint6Stroke.color = color;
    paint6Stroke.strokeCap = StrokeCap.round;
    paint6Stroke.strokeJoin = StrokeJoin.round;
    canvas.drawPath(path_6, paint6Stroke);

    Path path_7 = Path();
    path_7.moveTo(size.width * 0.4428571, size.height * 0.7903271);
    path_7.lineTo(size.width * 0.4428571, size.height * 0.8741963);
    path_7.arcToPoint(Offset(size.width * 0.5380952, size.height * 0.9673842),
        radius: Radius.elliptical(
            size.width * 0.09523810, size.height * 0.09318796),
        rotation: 0,
        largeArc: false,
        clockwise: false);
    path_7.lineTo(size.width * 0.8615238, size.height * 0.9673842);
    path_7.arcToPoint(Offset(size.width * 0.9567619, size.height * 0.8741963),
        radius: Radius.elliptical(
            size.width * 0.09523810, size.height * 0.09318796),
        rotation: 0,
        largeArc: false,
        clockwise: false);
    path_7.lineTo(size.width * 0.9567619, size.height * 0.7347871);
    path_7.arcToPoint(Offset(size.width * 0.8615238, size.height * 0.6415991),
        radius: Radius.elliptical(
            size.width * 0.09523810, size.height * 0.09318796),
        rotation: 0,
        largeArc: false,
        clockwise: false);
    path_7.lineTo(size.width * 0.6615238, size.height * 0.6415991);

    Paint paint7Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.06666667;
    paint7Stroke.color = color;
    paint7Stroke.strokeCap = StrokeCap.round;
    paint7Stroke.strokeJoin = StrokeJoin.round;
    canvas.drawPath(path_7, paint7Stroke);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
