import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myproject/core/constants/app_colors.dart';
import 'package:myproject/core/constants/app_strings.dart';
import 'package:myproject/features/home/controllers/link_text_field_controller.dart';
import 'package:myproject/features/home/controllers/theme_switch_controller.dart';
import 'package:smooth_corner/smooth_corner.dart';

class LinkTextField extends StatelessWidget {
  const LinkTextField({super.key});

  @override
  Widget build(BuildContext context) {
    final themeSwitchCubit = ThemeSwitchController.watch(context);
    final textFormFieldCubit = LinkTextFieldController.watch(context);

    return SmoothContainer(
      width: double.infinity,
      child: TextFormField(
        autovalidateMode: AutovalidateMode.always,
        validator: (value) => LinkTextFieldController.validationText(value!),
        onChanged: textFormFieldCubit.onChanged,
        onTapOutside: (event) => FocusScope.of(context).unfocus(),
        autofillHints: const [AutofillHints.url],
        autofocus: true,
        enableInteractiveSelection: true,
        keyboardAppearance:
            themeSwitchCubit.state.isDarkMode
                ? Brightness.dark
                : Brightness.light,
        keyboardType: TextInputType.url,
        minLines: 1,
        textAlignVertical: TextAlignVertical.center,
        textInputAction: TextInputAction.done,
        style: Theme.of(context).textTheme.bodyLarge,
        showCursor: true,
        cursorOpacityAnimates: true,
        cursorWidth: 2.r,
        cursorHeight: 24.r,
        cursorRadius: Radius.circular(16.r),
        cursorColor:
            themeSwitchCubit.state.isDarkMode
                ? AppColors.darkOnSurface
                : AppColors.lightOnSurface,
        cursorErrorColor: AppColors.error,
        decoration: const InputDecoration(
          hintText: AppStrings.linkTextFieldHintText,
        ),
      ),
    );
  }
}
