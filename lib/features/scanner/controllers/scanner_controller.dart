import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:myproject/core/constants/app_colors.dart';
import 'package:myproject/core/enums/icon_enum.dart';
import 'package:myproject/core/extensions/icon_enum_extension.dart';
import 'package:myproject/core/utils/border_util.dart';
import 'package:myproject/data/cubits/scanner/scanner_cubit.dart';
import 'package:myproject/features/scanner/widgets/scanner_overlay_painter.dart';
import 'package:smooth_corner/smooth_corner.dart';

class ScannerController {
  static ScannerCubit Function(BuildContext context) read =
      (BuildContext context) => context.read<ScannerCubit>();

  static ScannerCubit Function(BuildContext context) watch =
      (BuildContext context) => context.watch<ScannerCubit>();

  final MobileScannerController controller = MobileScannerController(
    formats: [BarcodeFormat.qrCode],
    detectionTimeoutMs: 300,
    autoStart: false,
  );

  static final double scanWindowUpdateThreshold = 1.r;

  static void onDetect(
    BuildContext context, {
    required BarcodeCapture barcodes,
    required ScannerCubit scannerCubit,
    required MobileScannerController controller,
  }) {
    if (barcodes.barcodes.isNotEmpty) {
      String returnValue = barcodes.barcodes.first.rawValue!;
      scannerCubit.scanningStopped(
        context,
        returnValue,
        controller: controller,
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
            width: 200.r,
            height: 200.r,
            color: AppColors.white,
          ),
        ),
      ),
    );
  }

  static Widget placeholderBuilder(BuildContext context) =>
      Container(color: AppColors.black);

  static Rect scanWindow({required BoxConstraints constraints}) =>
      Rect.fromCenter(
        center: constraints.biggest.center(Offset.zero),
        width: 200.r,
        height: 200.r,
      );
}
