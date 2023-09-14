import 'package:flutter/material.dart';

class EfectoBlurPRLab extends CustomPainter {
  const EfectoBlurPRLab({
    required this.color,
  });
  final Color color;
  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    final gradient = RadialGradient(
      colors: [
        color,
        color.withOpacity(0.1),
      ],
      stops: const [0.4, 1.0],
      radius: 0.7,
    );

    final paint = Paint()
      ..shader = gradient.createShader(rect)
      ..blendMode = BlendMode.srcOver;

    canvas.drawRect(rect, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
