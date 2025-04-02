import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myproject/core/constants/app_colors.dart';
import 'package:myproject/core/constants/app_strings.dart';
import 'package:myproject/data/cubits/text_form_field/text_form_field_cubit.dart';
import 'package:myproject/data/cubits/theme_switch/theme_switch_cubit.dart';
import 'package:myproject/features/home/controllers/link_text_field_controller.dart';
import 'package:myproject/features/home/controllers/theme_switch_controller.dart';
import 'package:smooth_corner/smooth_corner.dart';

class LinkTextField extends StatelessWidget {
  const LinkTextField({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeSwitchCubit themeSwitchCubit = ThemeSwitchController.watch(
      context,
    );
    final TextFormFieldCubit textFormFieldCubit = LinkTextFieldController.watch(
      context,
    );

    return SmoothContainer(
      width: double.infinity,
      child: TextFormField(
        autovalidateMode: AutovalidateMode.always,
        validator: (value) => LinkTextFieldController.validationText(value!),
        onChanged: (newValue) => textFormFieldCubit.onChanged(newValue),
        onTapOutside: (event) => FocusScope.of(context).unfocus(),
        autofillHints: const [AutofillHints.url],
        autofocus: true,
        enableInteractiveSelection: true,
        enableSuggestions: true,
        autocorrect: true,
        obscureText: false,
        keyboardAppearance:
            themeSwitchCubit.state.isDarkMode
                ? Brightness.dark
                : Brightness.light,
        keyboardType: TextInputType.url,
        maxLines: 1,
        minLines: 1,
        textAlign: TextAlign.start,
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
        decoration: InputDecoration(hintText: AppStrings.linkTextFieldHintText),
      ),
    );
  }
}
