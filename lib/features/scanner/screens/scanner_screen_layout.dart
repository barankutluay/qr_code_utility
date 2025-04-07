import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:myproject/data/cubits/scanner/scanner_cubit.dart';
import 'package:myproject/features/scanner/controllers/scanner_controller.dart';

class ScannerScreenLayout extends StatelessWidget {
  const ScannerScreenLayout({super.key, required this.controllerInstance});

  final ScannerController controllerInstance;

  @override
  Widget build(BuildContext context) {
    final ScannerCubit scannerCubit = ScannerController.watch(context);

    return SafeArea(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return MobileScanner(
            controller: controllerInstance.controller,
            onDetect:
                (barcodes) => controllerInstance.onDetect(
                  context,
                  barcodes: barcodes,
                  scannerCubit: scannerCubit,
                ),
            overlayBuilder:
                (context, constraints) => ScannerController.overlayBuilder(
                  context,
                  constraints: constraints,
                ),
            placeholderBuilder:
                (context, _) => ScannerController.placeholderBuilder(context),
            scanWindow: ScannerController.scanWindow(constraints: constraints),
            scanWindowUpdateThreshold:
                ScannerController.scanWindowUpdateThreshold,
          );
        },
      ),
    );
  }
}
