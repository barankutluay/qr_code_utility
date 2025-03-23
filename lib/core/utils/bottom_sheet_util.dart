import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myproject/core/constants/app_durations.dart';
import 'package:myproject/data/cubits/text_form_field/text_form_field_cubit.dart';

Future<dynamic> showCustomModalBottomSheet(BuildContext context, {required Widget widget}) {
  return showModalBottomSheet(
    context: context,
    useSafeArea: true,
    isDismissible: true,
    isScrollControlled: false,
    enableDrag: false,
    sheetAnimationStyle: AnimationStyle(
      curve: Curves.easeOutQuad,
      duration: AppDurations.duration300ms,
      reverseCurve: Curves.easeOutQuad,
      reverseDuration: AppDurations.duration300ms,
    ),
    constraints: const BoxConstraints(maxWidth: double.infinity),
    builder:
        (context) => BlocProvider(
          create: (context) => TextFormFieldCubit(),
          child: BlocBuilder<TextFormFieldCubit, TextFormFieldState>(
            builder: (context, state) {
              return widget;
            },
          ),
        ),
  );
}
