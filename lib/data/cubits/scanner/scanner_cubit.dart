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

  void scanningStopped(
    BuildContext context,
    String returnValue, {
    required MobileScannerController controller,
  }) {
    controller.pause();
    showCustomModalBottomSheet(
      context,
      widget: OnDetectBottomSheet(returnValue),
      onDismiss: () => scanningRestarted(context, controller: controller),
    );
    emit(ScannerScanned(returnValue));
  }

  void scanningRestarted(
    BuildContext context, {
    required MobileScannerController controller,
  }) {
    controller.start();
    emit(const ScannerInitial());
  }
}
