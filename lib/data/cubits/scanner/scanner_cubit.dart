import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'scanner_state.dart';

class ScannerCubit extends Cubit<ScannerState> {
  ScannerCubit() : super(ScannerInitial());
}
