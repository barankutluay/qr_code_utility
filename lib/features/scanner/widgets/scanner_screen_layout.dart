import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:myproject/data/cubits/scanner/scanner_cubit.dart';
import 'package:myproject/features/scanner/controllers/scanner_controller.dart';

class ScannerScreenLayout extends StatelessWidget {
  const ScannerScreenLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final ScannerCubit scannerCubit = ScannerController.watch(context);

    return SafeArea(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return MobileScanner(
            controller: ScannerController.controller,
            onDetect: (barcodes) => ScannerController.onDetect(context, barcodes, scannerCubit),
            overlayBuilder: (context, constraints) => ScannerController.overlayBuilder(context, constraints),
            placeholderBuilder: (context, widget) => ScannerController.placeholderBuilder(context),
            scanWindow: ScannerController.scanWindow(constraints),
            scanWindowUpdateThreshold: ScannerController.scanWindowUpdateThreshold,
          );
        },
      ),
    );
  }
}
