import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'text_form_field_state.dart';

final class TextFormFieldCubit extends Cubit<TextFormFieldState> {
  TextFormFieldCubit() : super(const TextFormFieldState(value: ''));

  void onChanged(String newValue) => emit(TextFormFieldState(value: newValue));
}
