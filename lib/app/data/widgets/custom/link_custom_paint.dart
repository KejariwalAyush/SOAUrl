import 'package:flutter/material.dart';

class KLinkWidget extends StatelessWidget {
  const KLinkWidget({
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
        painter: _LinkCustomPainter(color: color),
      ),
    );
  }
}

class _LinkCustomPainter extends CustomPainter {
  final Color color;

  _LinkCustomPainter({required this.color});
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.5099440, size.height * 0.7618943);
    path_0.lineTo(size.width * 0.3451269, size.height * 0.9267114);
    path_0.arcToPoint(Offset(size.width * 0.1777827, size.height * 0.9267114),
        radius:
            Radius.elliptical(size.width * 0.1182288, size.height * 0.1182288),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path_0.lineTo(size.width * 0.07317877, size.height * 0.8223272);
    path_0.arcToPoint(Offset(size.width * 0.07317877, size.height * 0.6548731),
        radius:
            Radius.elliptical(size.width * 0.1183386, size.height * 0.1183386),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path_0.lineTo(size.width * 0.3252390, size.height * 0.4028129);
    path_0.arcToPoint(Offset(size.width * 0.4926931, size.height * 0.4028129),
        radius:
            Radius.elliptical(size.width * 0.1183386, size.height * 0.1183386),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path_0.lineTo(size.width * 0.5566421, size.height * 0.4666520);

    Paint paint0Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.07691462;
    paint0Stroke.color = color;
    paint0Stroke.strokeCap = StrokeCap.round;
    paint0Stroke.strokeJoin = StrokeJoin.round;
    canvas.drawPath(path_0, paint0Stroke);

    Path path_1 = Path();
    path_1.moveTo(size.width * 0.4400615, size.height * 0.5366443);
    path_1.lineTo(size.width * 0.5096143, size.height * 0.6061971);
    path_1.arcToPoint(Offset(size.width * 0.6657510, size.height * 0.6061971),
        radius:
            Radius.elliptical(size.width * 0.1105373, size.height * 0.1105373),
        rotation: 0,
        largeArc: false,
        clockwise: false);
    path_1.lineTo(size.width * 0.9294583, size.height * 0.3424898);
    path_1.arcToPoint(Offset(size.width * 0.9294583, size.height * 0.1864630),
        radius:
            Radius.elliptical(size.width * 0.1098780, size.height * 0.1098780),
        rotation: 0,
        largeArc: false,
        clockwise: false);
    path_1.lineTo(size.width * 0.8130975, size.height * 0.07076145);
    path_1.arcToPoint(Offset(size.width * 0.6570707, size.height * 0.07076145),
        radius:
            Radius.elliptical(size.width * 0.1098780, size.height * 0.1098780),
        rotation: 0,
        largeArc: false,
        clockwise: false);
    path_1.lineTo(size.width * 0.4944512, size.height * 0.2336007);

    Paint paint1Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.07691462;
    paint1Stroke.color = color;
    paint1Stroke.strokeCap = StrokeCap.round;
    paint1Stroke.strokeJoin = StrokeJoin.round;
    canvas.drawPath(path_1, paint1Stroke);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
