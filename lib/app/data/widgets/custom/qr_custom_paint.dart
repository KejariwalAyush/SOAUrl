import 'package:flutter/material.dart';

class KQRWidget extends StatelessWidget {
  const KQRWidget({
    Key? key,
    this.size = 100,
    this.padding = 10,
    this.color = Colors.black,
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
        painter: _QRCustomPainter(color: color),
      ),
    );
  }
}

class _QRCustomPainter extends CustomPainter {
  final Color color;

  _QRCustomPainter({required this.color});

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
            Rect.fromLTWH(size.width * 0.03333333, size.height * 0.03064262,
                size.width * 0.3604762, size.height * 0.3556295),
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
            Rect.fromLTWH(size.width * 0.1476190, size.height * 0.1437577,
                size.width * 0.1319048, size.height * 0.1293119),
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
            Rect.fromLTWH(size.width * 0.6061905, size.height * 0.03064262,
                size.width * 0.3604762, size.height * 0.3556295),
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
            Rect.fromLTWH(size.width * 0.7204762, size.height * 0.1437577,
                size.width * 0.1319048, size.height * 0.1293119),
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
    canvas.drawLine(Offset(size.width * 0.03333333, size.height * 0.4973735),
        Offset(size.width * 0.9666667, size.height * 0.4973735), paint4Stroke);

    Paint paint5Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.06666667;
    paint5Stroke.color = color;
    paint5Stroke.strokeCap = StrokeCap.round;
    paint5Stroke.strokeJoin = StrokeJoin.round;
    canvas.drawLine(Offset(size.width * 0.5000000, size.height * 0.03064262),
        Offset(size.width * 0.5000000, size.height * 0.3862721), paint5Stroke);

    Paint paint6Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.06666667;
    paint6Stroke.color = color;
    paint6Stroke.strokeCap = StrokeCap.round;
    paint6Stroke.strokeJoin = StrokeJoin.round;
    canvas.drawLine(Offset(size.width * 0.5000000, size.height * 0.6138154),
        Offset(size.width * 0.5000000, size.height * 0.9693574), paint6Stroke);

    Paint paint7Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.06666667;
    paint7Stroke.color = color;
    paint7Stroke.strokeCap = StrokeCap.round;
    paint7Stroke.strokeJoin = StrokeJoin.round;
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.03333333, size.height * 0.6138154,
                size.width * 0.3604762, size.height * 0.3556295),
            bottomRight: Radius.circular(size.width * 0.09523810),
            bottomLeft: Radius.circular(size.width * 0.09523810),
            topLeft: Radius.circular(size.width * 0.09523810),
            topRight: Radius.circular(size.width * 0.09523810)),
        paint7Stroke);

    Paint paint8Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.06666667;
    paint8Stroke.color = color;
    paint8Stroke.strokeCap = StrokeCap.round;
    paint8Stroke.strokeJoin = StrokeJoin.round;
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.1476190, size.height * 0.7269305,
                size.width * 0.1319048, size.height * 0.1293119),
            bottomRight: Radius.circular(size.width * 0.04761905),
            bottomLeft: Radius.circular(size.width * 0.04761905),
            topLeft: Radius.circular(size.width * 0.04761905),
            topRight: Radius.circular(size.width * 0.04761905)),
        paint8Stroke);

    Path path_9 = Path();
    path_9.moveTo(size.width * 0.9666667, size.height * 0.6138154);
    path_9.lineTo(size.width * 0.9666667, size.height * 0.8816319);
    path_9.arcToPoint(Offset(size.width * 0.8714286, size.height * 0.9691823),
        radius: Radius.elliptical(
            size.width * 0.09523810, size.height * 0.08755034),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path_9.lineTo(size.width * 0.6061905, size.height * 0.9691823);

    Paint paint9Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.06666667;
    paint9Stroke.color = color;
    paint9Stroke.strokeCap = StrokeCap.round;
    paint9Stroke.strokeJoin = StrokeJoin.round;
    canvas.drawPath(path_9, paint9Stroke);

    Paint paint10Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.06666667;
    paint10Stroke.color = color;
    paint10Stroke.strokeCap = StrokeCap.round;
    paint10Stroke.strokeJoin = StrokeJoin.round;
    canvas.drawLine(Offset(size.width * 0.6110476, size.height * 0.6350902),
        Offset(size.width * 0.8572381, size.height * 0.6350902), paint10Stroke);

    Paint paint11Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.06666667;
    paint11Stroke.color = color;
    paint11Stroke.strokeCap = StrokeCap.round;
    paint11Stroke.strokeJoin = StrokeJoin.round;
    canvas.drawLine(Offset(size.width * 0.6110476, size.height * 0.7475048),
        Offset(size.width * 0.8572381, size.height * 0.7475048), paint11Stroke);

    Paint paint12Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.06666667;
    paint12Stroke.color = color;
    paint12Stroke.strokeCap = StrokeCap.round;
    paint12Stroke.strokeJoin = StrokeJoin.round;
    canvas.drawLine(Offset(size.width * 0.6110476, size.height * 0.8599195),
        Offset(size.width * 0.8572381, size.height * 0.8599195), paint12Stroke);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
