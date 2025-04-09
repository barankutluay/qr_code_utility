import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:myproject/core/utils/build_when_util.dart';
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
    _scannerCubit = ScannerController.read(context);

    _scannerController = ScannerController();
    unawaited(_scannerController.controller.start());
  }

  @override
  void dispose() {
    unawaited(_scannerController.controller.dispose());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<ScannerCubit, ScannerState>(
        buildWhen: buildWhen,
        builder: (context, state) {
          return LayoutBuilder(
            builder: (context, constraints) {
              return MobileScanner(
                controller: _scannerController.controller,
                onDetect: (barcodes) {
                  _scannerController.onDetect(
                    context,
                    barcodes: barcodes,
                    scannerCubit: _scannerCubit,
                  );
                },
                overlayBuilder: (context, constraints) {
                  return ScannerController.overlayBuilder(
                    context,
                    constraints: constraints,
                  );
                },
                placeholderBuilder: (context, _) {
                  return ScannerController.placeholderBuilder(context);
                },
                scanWindow: ScannerController.scanWindow(
                  constraints: constraints,
                ),
                scanWindowUpdateThreshold:
                    ScannerController.scanWindowUpdateThreshold,
              );
            },
          );
        },
      ),
    );
  }
}
