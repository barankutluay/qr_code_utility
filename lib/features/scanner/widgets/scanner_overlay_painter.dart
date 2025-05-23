import 'package:flutter/material.dart';
import 'package:qr_code_utility/core/constants/app_colors.dart';

class ScannerOverlayPainter extends CustomPainter {
  const ScannerOverlayPainter({
    required this.scanWindow,
    required this.borderRadius,
  });

  final Rect scanWindow;
  final double borderRadius;

  @override
  void paint(Canvas canvas, Size size) {
    final overlayPaint =
        Paint()
          ..color = AppColors.black.withValues(alpha: 0.33)
          ..style = PaintingStyle.fill;

    final clearPaint = Paint()..blendMode = BlendMode.clear;

    final rRect = RRect.fromRectAndRadius(
      scanWindow,
      Radius.circular(borderRadius),
    );

    canvas
      ..saveLayer(Offset.zero & size, Paint())
      ..drawRect(Offset.zero & size, overlayPaint)
      ..drawRRect(rRect, clearPaint)
      ..restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
