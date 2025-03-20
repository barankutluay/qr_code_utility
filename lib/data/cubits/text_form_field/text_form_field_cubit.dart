import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'text_form_field_state.dart';

class TextFormFieldCubit extends Cubit<TextFormFieldState> {
  TextFormFieldCubit() : super(TextFormFieldState(value: ''));

  void onChanged(String newValue) {
    emit(TextFormFieldState(value: newValue));
  }
}
