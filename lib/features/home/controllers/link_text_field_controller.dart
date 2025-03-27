import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myproject/data/cubits/text_form_field/text_form_field_cubit.dart';

class LinkTextFieldController {
  static TextFormFieldCubit Function(BuildContext context) watch = (BuildContext context) {
    return context.watch<TextFormFieldCubit>();
  };

  static bool validateLink(BuildContext context, String value) {
    final Uri? uri = Uri.tryParse(value);
    if (value.isEmpty) {
      return false;
    }
    if (uri == null || (!uri.hasScheme || !uri.hasAuthority)) {
      return false;
    }
    return true;
  }

  static String? validationText(String value) {
    final Uri? uri = Uri.tryParse(value);
    if (value.isEmpty) {
      return 'This field cannot be empty';
    }
    if (uri == null || (!uri.hasScheme || !uri.hasAuthority)) {
      return 'Please enter a valid link';
    }
    return null;
  }
}
