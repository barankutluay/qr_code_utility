import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:myproject/core/utils/bottom_sheet_util.dart';
import 'package:myproject/features/scanner/widgets/on_detect_bottom_sheet.dart';

part 'scanner_state.dart';

final class ScannerCubit extends Cubit<ScannerState> {
  ScannerCubit() : super(const ScannerInitial());

  void scanningStarted() => emit(const ScannerScanning());

  Future<void> scanningStopped(
    BuildContext context,
    String returnValue, {
    required MobileScannerController controller,
  }) async {
    await controller.pause();
    await showCustomModalBottomSheet(
      context,
      widget: OnDetectBottomSheet(returnValue),
      onDismiss: () => scanningRestarted(context, controller: controller),
    );
    emit(ScannerScanned(returnValue));
  }

  Future<void> scanningRestarted(
    BuildContext context, {
    required MobileScannerController controller,
  }) async {
    await controller.start();
    emit(const ScannerInitial());
  }
}
