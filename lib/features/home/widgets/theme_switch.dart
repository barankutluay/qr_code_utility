import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myproject/core/constants/app_colors.dart';
import 'package:myproject/data/cubits/theme_switch/theme_switch_cubit.dart';
import 'package:smooth_corner/smooth_corner.dart';

class ThemeSwitch extends StatelessWidget {
  const ThemeSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeSwitchState themeState = context.watch<ThemeSwitchCubit>().state;

    return SmoothContainer(
      child: SizedBox(
        width: 65.r,
        height: 40.r,
        child: Switch(
          value: themeState.isDarkMode,
          onChanged: (_) => context.read<ThemeSwitchCubit>().toggleTheme(),
          activeColor: AppColors.darkPrimaryContainer,
          activeTrackColor: AppColors.darkPrimaryContainer,
          trackOutlineColor: trackOutlineColor(themeState),
          thumbColor: thumbColor(themeState),
          thumbIcon: thumbIcon(themeState, context),
        ),
      ),
    );
  }

  WidgetStateProperty<Icon?> thumbIcon(ThemeSwitchState themeState, BuildContext context) {
    return WidgetStateProperty.all(
      Icon(
        themeState.isDarkMode ? Icons.dark_mode_rounded : Icons.light_mode_rounded,
        size: 16.r,
        color: themeState.isDarkMode ? AppColors.darkSurfaceContainerHighest : AppColors.lightSurfaceContainerHighest,
      ),
    );
  }

  WidgetStateProperty<Color?> thumbColor(ThemeSwitchState themeState) {
    return WidgetStateProperty.all(themeState.isDarkMode ? AppColors.darkOnPrimaryContainer : AppColors.lightOutline);
  }

  WidgetStateProperty<Color?> trackOutlineColor(ThemeSwitchState themeState) {
    return WidgetStateProperty.all(themeState.isDarkMode ? AppColors.transparent : AppColors.lightOutline);
  }
}
