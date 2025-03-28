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

final class ScannerScanning extends ScannerState {
  const ScannerScanning();

  @override
  List<Object> get props => [];
}

final class ScannerScanned extends ScannerState {
  const ScannerScanned(this.returnValue);

  final String returnValue;

  @override
  List<Object> get props => [returnValue];
}

final class ScannerError extends ScannerState {
  const ScannerError();

  @override
  List<Object> get props => [];
}
