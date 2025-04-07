import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:myproject/data/cubits/scanner/scanner_cubit.dart';
import 'package:myproject/features/scanner/controllers/scanner_controller.dart';

class ScannerScreenLayout extends StatefulWidget {
  const ScannerScreenLayout({super.key});

  @override
  State<ScannerScreenLayout> createState() => _ScannerScreenLayoutState();
}

class _ScannerScreenLayoutState extends State<ScannerScreenLayout> {
  late final ScannerCubit _scannerCubit;
  late final ScannerController _scannerController;

  @override
  void initState() {
    super.initState();
    _scannerCubit = context.read<ScannerCubit>();
    _scannerController = ScannerController();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _scannerController.controller.start();
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _scannerController.controller.dispose();
    });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => SafeArea(
    child: BlocBuilder<ScannerCubit, ScannerState>(
      buildWhen: (previous, current) => current != previous,
      builder:
          (context, state) => LayoutBuilder(
            builder:
                (context, constraints) => MobileScanner(
                  controller: _scannerController.controller,
                  onDetect: (barcodes) {
                    WidgetsBinding.instance.addPostFrameCallback((_) async {
                      await _scannerController.onDetect(
                        context,
                        barcodes: barcodes,
                        scannerCubit: _scannerCubit,
                      );
                    });
                  },
                  overlayBuilder:
                      (context, constraints) =>
                          ScannerController.overlayBuilder(
                            context,
                            constraints: constraints,
                          ),
                  placeholderBuilder:
                      (context, _) =>
                          ScannerController.placeholderBuilder(context),
                  scanWindow: ScannerController.scanWindow(
                    constraints: constraints,
                  ),
                  scanWindowUpdateThreshold:
                      ScannerController.scanWindowUpdateThreshold,
                ),
          ),
    ),
  );
}
