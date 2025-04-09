import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myproject/core/constants/app_colors.dart';
import 'package:myproject/data/cubits/theme_switch/theme_switch_cubit.dart';

final class ThemeSwitchStyle {
  const ThemeSwitchStyle._();

  static WidgetStateProperty<Icon?> thumbIcon(
    ThemeSwitchCubit themeSwitchCubit,
  ) {
    return WidgetStateProperty.all(
      Icon(
        size: 16.r,
        themeSwitchCubit.state.isDarkMode
            ? Icons.dark_mode_rounded
            : Icons.light_mode_rounded,
        color:
            themeSwitchCubit.state.isDarkMode
                ? AppColors.darkSurfaceContainerHighest
                : AppColors.lightSurfaceContainerHighest,
      ),
    );
  }

  static WidgetStateProperty<Color?> thumbColor(
    ThemeSwitchCubit themeSwitchCubit,
  ) {
    return WidgetStateProperty.all(
      themeSwitchCubit.state.isDarkMode
          ? AppColors.darkOnPrimaryContainer
          : AppColors.lightOutline,
    );
  }

  static WidgetStateProperty<Color?> trackOutlineColor(
    ThemeSwitchCubit themeSwitchCubit,
  ) {
    return WidgetStateProperty.all(
      themeSwitchCubit.state.isDarkMode
          ? AppColors.transparent
          : AppColors.lightOutline,
    );
  }

  static WidgetStateProperty<double?> trackOutlineWidth(
    ThemeSwitchCubit themeSwitchCubit,
  ) {
    return WidgetStateProperty.all(themeSwitchCubit.state.isDarkMode ? 0 : 2.r);
  }
}
