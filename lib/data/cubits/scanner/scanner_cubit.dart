import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:myproject/core/utils/bottom_sheet_util.dart';
import 'package:myproject/core/utils/save_data_util.dart';
import 'package:myproject/features/scanner/widgets/on_detect_bottom_sheet/on_detect_bottom_sheet.dart';

part 'scanner_state.dart';

final class ScannerCubit extends Cubit<ScannerState> {
  ScannerCubit() : super(const ScannerInitial());

  void scanningStarted() => emit(const ScannerScanning());

  Future<void> scanningStopped(
    BuildContext context, {
    required String url,
    required MobileScannerController controller,
  }) async {
    await controller.pause();
    await Future.wait([
      showCustomModalBottomSheet(
        context,
        widget: OnDetectBottomSheet(url),
        onDismiss: () => scanningRestarted(context, controller: controller),
      ),
      saveData(url: url, time: DateTime.now(), type: 1),
    ]);
    emit(ScannerScanned(url));
  }

  Future<void> scanningRestarted(
    BuildContext context, {
    required MobileScannerController controller,
  }) async {
    await controller.start();
    emit(const ScannerInitial());
  }
}
