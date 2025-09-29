import 'package:flutter/material.dart';
import 'mode.dart';
import 'painter.dart';
import 'toolbar.dart';

class EditorPage extends StatefulWidget {
  const EditorPage({super.key});

  @override
  State<EditorPage> createState() => _EditorPageState();
}

class _EditorPageState extends State<EditorPage> {
  EditMode _mode = EditMode.view;
  Color _color = Colors.red;
  double _stroke = 4.0;
  final List<DrawPoint> _points = [];

  void _changeMode(EditMode m) => setState(() => _mode = m);
  void _changeColor(Color c) => setState(() => _color = c);
  void _changeStroke(double v) => setState(() => _stroke = v);
  void _clear() => setState(() => _points.clear());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Gallery Zoom & Annotate')),
      body: Column(
        children: [
          EditorToolbar(
            mode: _mode,
            color: _color,
            stroke: _stroke,
            onModeChanged: _changeMode,
            onColorSelected: _changeColor,
            onStrokeChanged: _changeStroke,
            onClear: _clear,
          ),
          Expanded(
            child: InteractiveViewer(
              minScale: 0.5,
              maxScale: 5,
              child: GestureDetector(
                onPanUpdate: (details) {
                  if (_mode == EditMode.draw || _mode == EditMode.marker) {
                    final box = context.findRenderObject() as RenderBox;
                    final point = box.globalToLocal(details.globalPosition);
                    setState(() {
                      _points.add(DrawPoint(
                        offset: point,
                        color: _color,
                        stroke: _stroke,
                        isDot: _mode == EditMode.marker,
                      ));
                    });
                  }
                },
                onPanEnd: (_) => _points.add(DrawPoint.breakLine()),
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Image.asset(
                        'assets/images/image_1.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned.fill(
                      child: CustomPaint(
                        painter: DrawPainter(points: _points),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
