import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myproject/data/cubits/text_form_field/text_form_field_cubit.dart';

final class LinkTextFieldController {
  const LinkTextFieldController._();

  static TextFormFieldCubit Function(BuildContext context) read = (context) {
    return context.read<TextFormFieldCubit>();
  };

  static TextFormFieldCubit Function(BuildContext context) watch = (context) {
    return context.watch<TextFormFieldCubit>();
  };

  static bool validateLink(BuildContext context, String value) {
    final uri = Uri.tryParse(value);

    if (value.isEmpty) return false;

    if (uri == null || (!uri.hasScheme || !uri.hasAuthority)) return false;

    return true;
  }

  static String? validationText(String value) {
    final uri = Uri.tryParse(value);

    const emptyMessage = 'This field cannot be empty';
    const notValidMessage = 'Please enter a valid link';

    if (value.isEmpty) return emptyMessage;

    if (uri == null || (!uri.hasScheme || !uri.hasAuthority)) {
      return notValidMessage;
    }

    return null;
  }
}
