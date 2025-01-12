import 'dart:ui';

import 'package:almaqsura/colors_app/colors_app.dart';
import 'package:flutter/material.dart';

class DashedArrowVirticalPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = ColorsApp.greenLight
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    final path = Path();

    // رسم منحنى متعرج
    path.moveTo(size.width / 2, 0); // البداية
    path.quadraticBezierTo(
      size.width / 1.5, // نقطة التحكم الأولى (يمين ويسار)*********
      size.height * 0, // نقطة التحكم الأولى (أعلى وأسفل)*********
      size.width / 1.5, // النهاية
      size.height * 0.6, // النهاية
    );
    path.quadraticBezierTo(
      size.width / 1.5, // نقطة التحكم الثانية*******
      size.height * 1, // نقطة التحكم الثانية*******
      size.width / 2, // النهاية*****
      size.height, // النهاية
    );

    // رسم الخط المتقطع
    double dashWidth = 6, dashSpace = 5;
    Path dashedPath = Path();
    for (PathMetric pathMetric in path.computeMetrics()) {
      double distance = 0.0;
      while (distance < pathMetric.length) {
        dashedPath.addPath(
          pathMetric.extractPath(distance, distance + dashWidth),
          Offset.zero,
        );
        distance += dashWidth + dashSpace;
      }
    }
    canvas.drawPath(dashedPath, paint);

    // رسم الدائرة
    canvas.drawCircle(
      Offset(size.width / 3, 0), // الموقع
      4, // نصف القطر
      Paint()..color = ColorsApp.greenLight,
    );

    // رسم السهم يشير إلى اليسار
    final arrowPath = Path()
      ..moveTo(size.width / 2 - 0, size.height - 5)
      ..lineTo(size.width / 2 - 10, size.height)
      ..lineTo(size.width / 2 - 0, size.height + 5)
      ..close();

    canvas.drawPath(arrowPath, Paint()..color = ColorsApp.greenLight);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
