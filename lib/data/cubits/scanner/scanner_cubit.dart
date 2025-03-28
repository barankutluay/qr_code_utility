import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:myproject/core/utils/bottom_sheet_util.dart';
import 'package:myproject/features/scanner/controllers/scanner_controller.dart';
import 'package:myproject/features/scanner/widgets/on_detect_bottom_sheet.dart';

part 'scanner_state.dart';

class ScannerCubit extends Cubit<ScannerState> {
  ScannerCubit() : super(ScannerInitial());

  void scanningStarted() => emit(ScannerScanning());

  void scanningStopped(BuildContext context, String returnValue) {
    ScannerController.controller.pause();
    showCustomModalBottomSheet(
      context,
      widget: OnDetectBottomSheet(returnValue),
      isDismissible: true,
      onDismiss: () => scanningRestarted(context),
    );
    emit(ScannerScanned(returnValue));
  }

  void scanningRestarted(BuildContext context) {
    ScannerController.controller.start();
    emit(ScannerInitial());
  }
}
