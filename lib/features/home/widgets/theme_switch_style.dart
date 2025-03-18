import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myproject/core/constants/app_colors.dart';
import 'package:myproject/data/cubits/theme_switch/theme_switch_cubit.dart';

class ThemeSwitchStyle {
  static WidgetStateProperty<Icon?> thumbIcon(ThemeSwitchState themeState) {
    return WidgetStateProperty.all(
      Icon(
        themeState.isDarkMode ? Icons.dark_mode_rounded : Icons.light_mode_rounded,
        size: 16.r,
        color: themeState.isDarkMode ? AppColors.darkSurfaceContainerHighest : AppColors.lightSurfaceContainerHighest,
      ),
    );
  }

  static WidgetStateProperty<Color?> thumbColor(ThemeSwitchState themeState) {
    return WidgetStateProperty.all(themeState.isDarkMode ? AppColors.darkOnPrimaryContainer : AppColors.lightOutline);
  }

  static WidgetStateProperty<Color?> trackOutlineColor(ThemeSwitchState themeState) {
    return WidgetStateProperty.all(themeState.isDarkMode ? AppColors.transparent : AppColors.lightOutline);
  }
}
