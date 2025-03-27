part of 'scanner_cubit.dart';

sealed class ScannerState extends Equatable {
  const ScannerState();

  @override
  List<Object> get props => [];
}

final class ScannerInitial extends ScannerState {
  const ScannerInitial();

  @override
  List<Object> get props => [];
}

final class ScannerScanning extends ScannerState {}

final class ScannerScanned extends ScannerState {}

final class ScannerError extends  ScannerState {}
