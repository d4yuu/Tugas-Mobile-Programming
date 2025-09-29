import 'package:flutter/material.dart';

/// Jenis mode anotasi
enum AnnotationMode { view, marker, draw, erase }

/// Satu coretan bebas (freehand)
class DrawStroke {
  final List<Offset> points;
  final Color color;
  final double width;

  DrawStroke({required this.points, required this.color, required this.width});
}

/// Marker titik tunggal
class MarkerPoint {
  final Offset offset;
  final Color color;
  MarkerPoint(this.offset, this.color);
}
