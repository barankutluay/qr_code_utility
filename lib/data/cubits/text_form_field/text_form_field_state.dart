part of 'text_form_field_cubit.dart';

class TextFormFieldState extends Equatable {
  final String value;

  const TextFormFieldState({required this.value});

  @override
  List<Object> get props => [value];
}
