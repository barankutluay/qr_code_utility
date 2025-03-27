import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myproject/core/constants/app_durations.dart';
import 'package:myproject/core/utils/padding_util.dart';
import 'package:myproject/data/cubits/text_form_field/text_form_field_cubit.dart';

Future<dynamic> showCustomModalBottomSheet(BuildContext context, {required Widget widget}) {
  return showModalBottomSheet(
    context: context,
    useSafeArea: true,
    isDismissible: true,
    isScrollControlled: true,
    enableDrag: false,
    constraints: const BoxConstraints(maxWidth: double.infinity),
    sheetAnimationStyle: AnimationStyle(
      curve: Curves.easeOutQuad,
      duration: AppDurations.duration500ms,
      reverseCurve: Curves.easeOutQuad,
      reverseDuration: AppDurations.duration500ms,
    ),
    builder:
        (context) => BlocProvider(
          create: (context) => TextFormFieldCubit(),
          child: BlocBuilder<TextFormFieldCubit, TextFormFieldState>(
            builder: (context, state) {
              return Padding(padding: PaddingUtil.onlyBottom(MediaQuery.of(context).viewInsets.bottom), child: widget);
            },
          ),
        ),
  );
}
