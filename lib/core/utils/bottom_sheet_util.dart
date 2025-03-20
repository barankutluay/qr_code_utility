import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myproject/core/animations/app_bottom_sheet_animation.dart';
import 'package:myproject/data/cubits/text_form_field/text_form_field_cubit.dart';

Future<dynamic> showCustomModalBottomSheet(BuildContext context, {required Widget widget}) {
  return showModalBottomSheet(
    context: context,
    useSafeArea: true,
    isDismissible: true,
    isScrollControlled: false,
    enableDrag: false,
    sheetAnimationStyle: AppBottomSheetAnimation.animationStyle,
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
