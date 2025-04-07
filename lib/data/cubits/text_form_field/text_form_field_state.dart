part of 'text_form_field_cubit.dart';

final class TextFormFieldState extends Equatable {
  const TextFormFieldState({required this.value});
  final String value;

  @override
  List<Object> get props => [value];
}
