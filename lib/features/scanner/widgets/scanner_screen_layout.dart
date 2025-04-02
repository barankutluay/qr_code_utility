import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:myproject/data/cubits/scanner/scanner_cubit.dart';
import 'package:myproject/features/scanner/controllers/scanner_controller.dart';

class ScannerScreenLayout extends StatelessWidget {
  const ScannerScreenLayout({super.key, required this.controller});

  final MobileScannerController controller;

  @override
  Widget build(BuildContext context) {
    final ScannerCubit scannerCubit = ScannerController.watch(context);

    return SafeArea(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return MobileScanner(
            controller: controller,
            onDetect:
                (barcodes) => ScannerController.onDetect(
                  context,
                  barcodes,
                  scannerCubit,
                  controller: controller,
                ),
            overlayBuilder:
                (context, constraints) =>
                    ScannerController.overlayBuilder(context, constraints),
            placeholderBuilder:
                (context, widget) =>
                    ScannerController.placeholderBuilder(context),
            scanWindow: ScannerController.scanWindow(constraints),
            scanWindowUpdateThreshold:
                ScannerController.scanWindowUpdateThreshold,
          );
        },
      ),
    );
  }
}
