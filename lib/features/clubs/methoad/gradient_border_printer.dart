import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GradientBorderPainter extends CustomPainter {
  final Color startColor;
  final Color endColor;
  final AlignmentGeometry startAlignment;
  final AlignmentGeometry endAlignment;
  final double radius;
  final double stroke;

  GradientBorderPainter(
      {super.repaint,
      required this.startColor,
      required this.endColor,
      required this.startAlignment,
      required this.endAlignment,
      required this.radius,
      required this.stroke,
      });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..shader = LinearGradient(
        colors: [
          startColor,
          endColor,
        ],
        begin: startAlignment,
        end: endAlignment,
      ).createShader(
          Rect.fromLTWH(0, 300, size.width, size.height))
      ..strokeWidth = stroke
      ..style = PaintingStyle.stroke;

    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(0, 0, size.width, size.height),
        Radius.circular(radius),
      ),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
