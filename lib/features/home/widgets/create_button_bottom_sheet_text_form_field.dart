import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myproject/core/constants/app_colors.dart';
import 'package:myproject/data/cubits/theme_switch/theme_switch_cubit.dart';
import 'package:smooth_corner/smooth_corner.dart';

class CreateButtonBottomSheetTextFormField extends StatelessWidget {
  const CreateButtonBottomSheetTextFormField({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeSwitchState themeState = context.watch<ThemeSwitchCubit>().state;

    return SmoothContainer(
      width: double.infinity,
      height: 48.r,
      child: TextFormField(
        autofillHints: const [AutofillHints.url],
        autofocus: true,
        enableInteractiveSelection: true,
        enableSuggestions: true,
        autocorrect: true,
        obscureText: false,
        keyboardAppearance: themeState.isDarkMode ? Brightness.dark : Brightness.light,
        keyboardType: TextInputType.url,
        maxLines: 1,
        minLines: 1,
        onFieldSubmitted: (_) {},
        textAlign: TextAlign.start,
        textAlignVertical: TextAlignVertical.center,
        textInputAction: TextInputAction.done,
        style: Theme.of(context).textTheme.bodyLarge,
        showCursor: true,
        cursorOpacityAnimates: true,
        cursorWidth: 2.r,
        cursorHeight: 24.r,
        cursorRadius: Radius.circular(16.r),
        cursorColor: themeState.isDarkMode ? AppColors.darkOnSurface : AppColors.lightOnSurface,
        cursorErrorColor: AppColors.error,
        decoration: const InputDecoration(hintText: "https://www.youtube.com/watch?v=dQw4w9WgXc"),
      ),
    );
  }
}
