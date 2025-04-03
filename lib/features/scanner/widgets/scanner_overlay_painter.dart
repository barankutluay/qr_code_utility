import 'package:flutter/material.dart';
import 'package:myproject/core/constants/app_colors.dart';

class ScannerOverlayPainter extends CustomPainter {
  const ScannerOverlayPainter({
    required this.scanWindow,
    required this.borderRadius,
  });

  final Rect scanWindow;
  final double borderRadius;

  @override
  void paint(Canvas canvas, Size size) {
    final Paint overlayPaint =
        Paint()
          ..color = AppColors.black.withValues(alpha: 0.33)
          ..style = PaintingStyle.fill;

    final Paint clearPaint = Paint()..blendMode = BlendMode.clear;

    final RRect rRect = RRect.fromRectAndRadius(
      scanWindow,
      Radius.circular(borderRadius),
    );

    canvas.saveLayer(Offset.zero & size, Paint());
    canvas.drawRect(Offset.zero & size, overlayPaint);
    canvas.drawRRect(rRect, clearPaint);
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
