import 'dart:ui';

import 'package:flutter/material.dart';

class DottedCustomPaint extends CustomPainter {
  Color? color;
  double? dottedLength;
  double? dottedSpace;
  double? strokeWidth;
  double? radius;

  DottedCustomPaint({
    this.color,
    this.dottedLength,
    this.dottedSpace,
    this.strokeWidth,
    this.radius,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    final paint = Paint()
      ..isAntiAlias = true
      ..filterQuality = FilterQuality.high
      ..color = color!
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth!;
    Path path = Path();
    path.addRRect(
      RRect.fromLTRBR(
        0,
        0,
        size.width,
        size.height,
        Radius.circular(radius!),
      ),
    );
    Path draw = buildDashPath(path, dottedLength!, dottedSpace!);
    canvas.drawPath(draw, paint);
  }

  Path buildDashPath(Path path, double dottedLength, double space) {
    final Path r = Path();
    for (PathMetric metric in path.computeMetrics()) {
      double start = 0.0;

      while (start < metric.length) {
        double end = start + dottedLength;

        r.addPath(metric.extractPath(start, end), Offset.zero);
      }
    }
    return r;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}
