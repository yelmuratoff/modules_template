import 'package:flutter/material.dart';

class ArcBorderPainter extends CustomPainter {
  const ArcBorderPainter({
    this.borderRadiusRatio = 0.035,
    this.arcRatio = 0.2332,
  });

  final double arcRatio;
  final double borderRadiusRatio;

  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final arcW = arcRatio * w;
    final arcH = arcRatio * w;
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill
      ..strokeWidth = 0;
    final path = Path()
      ..addArc(
        Rect.fromLTWH(
          (w / 2) - (arcW / 2),
          -arcH / 2,
          arcW,
          arcH,
        ),
        3.14,
        3.15,
      );

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
