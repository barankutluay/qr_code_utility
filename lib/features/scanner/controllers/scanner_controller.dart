import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:qr_code_utility/core/constants/app_colors.dart';
import 'package:qr_code_utility/core/enums/icon_enum.dart';
import 'package:qr_code_utility/core/extensions/icon_enum_extension.dart';
import 'package:qr_code_utility/core/utils/border_util.dart';
import 'package:qr_code_utility/core/utils/share_util.dart';
import 'package:qr_code_utility/data/cubits/scanner/scanner_cubit.dart';
import 'package:qr_code_utility/features/scanner/widgets/scanner_overlay_painter.dart';
import 'package:smooth_corner/smooth_corner.dart';

final class ScannerController {
  ScannerController();

  static ScannerCubit Function(BuildContext context) read = (context) {
    return context.read<ScannerCubit>();
  };

  static ScannerCubit Function(BuildContext context) watch = (context) {
    return context.watch<ScannerCubit>();
  };

  static final double scanWindowUpdateThreshold = 1.r;

  final MobileScannerController controller = MobileScannerController(
    formats: [BarcodeFormat.qrCode],
    detectionTimeoutMs: 300,
    autoStart: false,
  );

  static void shareUrl(BuildContext context, String url) {
    unawaited(share(context, url: url));
  }

  static void handleOnPressed(BuildContext context) {
    unawaited(context.pushNamed('scanner'));
  }

  void onDetect(
    BuildContext context, {
    required BarcodeCapture barcodes,
    required ScannerCubit scannerCubit,
  }) {
    if (barcodes.barcodes.isNotEmpty) {
      final url = barcodes.barcodes.first.rawValue!;
      unawaited(
        scannerCubit.scanningStopped(context, url: url, controller: controller),
      );
    }
  }

  static Widget overlayBuilder(
    BuildContext context, {
    required BoxConstraints constraints,
  }) {
    final scanWindowRect = Rect.fromCenter(
      center: constraints.biggest.center(Offset.zero),
      width: 200.r,
      height: 200.r,
    );

    return CustomPaint(
      size: Size.infinite,
      willChange: true,
      isComplex: true,
      painter: ScannerOverlayPainter(
        scanWindow: scanWindowRect,
        borderRadius: 16.r,
      ),
      child: Center(
        child: SmoothContainer(
          width: 200.r,
          height: 200.r,
          borderRadius: BorderUtil.all(16.r),
          child: IconEnum.scanFrame.toSVGWidget(
            context,
            width: 200.r,
            height: 200.r,
            color: AppColors.white,
          ),
        ),
      ),
    );
  }

  static Widget placeholderBuilder(BuildContext context) {
    return Container(color: AppColors.black);
  }

  static Rect scanWindow({required BoxConstraints constraints}) {
    return Rect.fromCenter(
      center: constraints.biggest.center(Offset.zero),
      width: 200.r,
      height: 200.r,
    );
  }
}
