import 'package:flutter/material.dart';

class HangmanPainter extends CustomPainter {
  final int mistakes;

  HangmanPainter(this.mistakes);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..strokeWidth = 5
      ..color = Colors.white
      ..style = PaintingStyle.stroke;

    canvas.drawLine(
      Offset(50, size.height),
      Offset(50, 20),
      paint,
    );

    canvas.drawLine(
      Offset(50, 20),
      Offset(200, 20),
      paint,
    );

    canvas.drawLine(
      Offset(200, 20),
      Offset(200, 50),
      paint,
    );

    if (mistakes > 0) {
      canvas.drawCircle(
        const Offset(200, 80),
        30,
        paint,
      );
    }

    if (mistakes > 1) {
      canvas.drawLine(
        const Offset(200, 110),
        const Offset(200, 220),
        paint,
      );
    }

    if (mistakes > 2) {
      canvas.drawLine(
        const Offset(200, 140),
        const Offset(160, 180),
        paint,
      );
    }

    if (mistakes > 3) {
      canvas.drawLine(
        const Offset(200, 140),
        const Offset(240, 180),
        paint,
      );
    }

    if (mistakes > 4) {
      canvas.drawLine(
        const Offset(200, 220),
        const Offset(160, 280),
        paint,
      );
    }

    if (mistakes > 5) {
      canvas.drawLine(
        const Offset(200, 220),
        const Offset(240, 280),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}