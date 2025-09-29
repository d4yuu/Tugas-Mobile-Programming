import 'package:flutter/material.dart';

class DrawPoint {
  final Offset offset;
  final Color color;
  final double stroke;
  final bool isDot;
  final bool breakLine;
  DrawPoint({
    required this.offset,
    required this.color,
    required this.stroke,
    this.isDot = false,
    this.breakLine = false,
  });

  factory DrawPoint.breakLine() =>
      DrawPoint(offset: Offset.zero, color: Colors.transparent, stroke: 0, breakLine: true);
}

class DrawPainter extends CustomPainter {
  final List<DrawPoint> points;
  DrawPainter({required this.points});

  @override
  void paint(Canvas canvas, Size size) {
    for (int i = 0; i < points.length - 1; i++) {
      final p = points[i];
      final next = points[i + 1];
      if (p.breakLine) continue;
      final paint = Paint()
        ..color = p.color
        ..strokeWidth = p.stroke
        ..strokeCap = StrokeCap.round;
      if (p.isDot) {
        canvas.drawCircle(p.offset, p.stroke, paint);
      } else if (!next.breakLine) {
        canvas.drawLine(p.offset, next.offset, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant DrawPainter old) =>
      old.points != points;
}
