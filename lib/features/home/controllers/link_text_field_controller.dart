import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myproject/data/cubits/text_form_field/text_form_field_cubit.dart';

class LinkTextFieldController {
  static TextFormFieldCubit Function(BuildContext context) watch = (BuildContext context) {
    return context.watch<TextFormFieldCubit>();
  };
}
