import 'package:flutter/material.dart';
import 'mode.dart';

class EditorToolbar extends StatelessWidget {
  final EditMode mode;
  final Color color;
  final double stroke;
  final ValueChanged<EditMode> onModeChanged;
  final ValueChanged<Color> onColorSelected;
  final ValueChanged<double> onStrokeChanged;
  final VoidCallback onClear;

  const EditorToolbar({
    super.key,
    required this.mode,
    required this.color,
    required this.stroke,
    required this.onModeChanged,
    required this.onColorSelected,
    required this.onStrokeChanged,
    required this.onClear,
  });

  Widget _modeButton(EditMode m, String label, IconData icon) {
    return Builder(
      builder: (context) => TextButton.icon(
        onPressed: () => onModeChanged(m),
        icon: Icon(icon,
            color: mode == m ? Colors.blue : Colors.grey, size: 20),
        label: Text(label,
            style: TextStyle(
                color: mode == m ? Colors.blue : Colors.grey,
                fontWeight:
                    mode == m ? FontWeight.bold : FontWeight.normal)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.grey[100],
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          children: [
            _modeButton(EditMode.view, 'View', Icons.pan_tool),
            _modeButton(EditMode.marker, 'Marker', Icons.location_on),
            _modeButton(EditMode.draw, 'Draw', Icons.brush),
            _modeButton(EditMode.erase, 'Erase', Icons.delete),
            const SizedBox(width: 16),
            // Warna
            ...[Colors.red, Colors.green, Colors.blue, Colors.yellow, Colors.black, Colors.white]
                .map((c) => IconButton(
                      icon: Icon(Icons.circle, color: c),
                      onPressed: () => onColorSelected(c),
                    )),
            const SizedBox(width: 16),
            const Text('W'),
            Slider(
              min: 1,
              max: 10,
              value: stroke,
              onChanged: onStrokeChanged,
            ),
            IconButton(
              icon: const Icon(Icons.clear),
              onPressed: onClear,
            ),
          ],
        ),
      ),
    );
  }
}
