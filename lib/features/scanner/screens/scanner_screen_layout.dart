import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:myproject/features/scanner/controllers/scanner_controller.dart';

class ScannerScreenLayout extends StatelessWidget {
  const ScannerScreenLayout({required this.controllerInstance, super.key});

  final ScannerController controllerInstance;

  @override
  Widget build(BuildContext context) {
    final scannerCubit = ScannerController.watch(context);

    return SafeArea(
      child: LayoutBuilder(
        builder:
            (context, constraints) => MobileScanner(
              controller: controllerInstance.controller,
              onDetect:
                  (barcodes) async => controllerInstance.onDetect(
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
              scanWindow: ScannerController.scanWindow(
                constraints: constraints,
              ),
              scanWindowUpdateThreshold:
                  ScannerController.scanWindowUpdateThreshold,
            ),
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
      DiagnosticsProperty<ScannerController>(
        'controllerInstance',
        controllerInstance,
      ),
    );
  }
}
