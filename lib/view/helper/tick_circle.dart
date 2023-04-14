import "package:flutter/material.dart";
import 'package:rent_app/helper/color_package.dart';

class TickCircle extends StatefulWidget {
  const TickCircle({super.key});

  @override
  State<TickCircle> createState() => _TickCircleState();
}

class _TickCircleState extends State<TickCircle> {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: TickCirclePainter(),
      size: const Size(120, 120),
    );
  }
}

class TickCirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint circlePaint = Paint()
      ..color = ColorPackage.primaryTextColor
      ..strokeWidth = 10
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    Paint tickPaint = Paint()
      ..color = ColorPackage.primaryTextColor
      ..strokeWidth = 10
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    double centerX = size.width / 2;
    double centerY = size.height / 2;
    double radius = size.width / 2;

    canvas.drawCircle(Offset(centerX, centerY), radius, circlePaint);

    Path tickPath = Path();
    tickPath.moveTo(centerX - radius / 2, centerY);
    tickPath.lineTo(centerX, centerY + radius / 2);
    tickPath.lineTo(centerX + radius / 2, centerY - radius / 2);

    canvas.drawPath(tickPath, tickPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
