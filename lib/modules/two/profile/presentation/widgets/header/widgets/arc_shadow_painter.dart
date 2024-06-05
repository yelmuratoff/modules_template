import 'package:flutter/material.dart';

class ArcShadowPainter extends CustomPainter {
  ArcShadowPainter({
    this.borderRadiusRatio = 0.035,
    this.arcRatio = 0.2332,
    this.arcPadding = 16.0,
    this.padding = 10.0,
    this.color = Colors.black,
    this.elevation = 10.0,
  });

  ///Width of the arc relative to the width of the widget
  final double arcRatio;
  final double arcPadding;
  final double padding;
  final double borderRadiusRatio;
  final Color color;
  final double elevation;

  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final arcW = arcRatio * w;
    final arcH = arcRatio * w;
    final path = Path()
      ..addArc(
        Rect.fromLTWH(
          (w / 2) - (arcW / 2) - (arcPadding / 2),
          -(arcH + arcPadding) / 2,
          arcW + arcPadding,
          arcH + arcPadding,
        ),
        3.14,
        3.14,
      )
      ..addRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(
            0 - padding,
            0 - padding,
            w + padding,
            size.height + padding,
          ),
          Radius.circular(borderRadiusRatio * w),
        ),
      );
    canvas.drawShadow(
      path,
      color,
      elevation,
      true,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
