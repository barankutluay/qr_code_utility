import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_code_utility/core/constants/app_colors.dart';

final class ThemeSwitchStyle {
  const ThemeSwitchStyle._();

  static WidgetStateProperty<Icon?> thumbIcon(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return WidgetStateProperty.all(
      Icon(
        isDarkMode ? Icons.dark_mode_rounded : Icons.light_mode_rounded,
        size: 16.r,
        color:
            isDarkMode
                ? AppColors.darkSurfaceContainerHighest
                : AppColors.lightSurfaceContainerHighest,
      ),
    );
  }

  static WidgetStateProperty<Color?> thumbColor(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return WidgetStateProperty.all(
      isDarkMode ? AppColors.darkOnPrimaryContainer : AppColors.lightOutline,
    );
  }

  static WidgetStateProperty<Color?> trackOutlineColor(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return WidgetStateProperty.all(
      isDarkMode ? AppColors.transparent : AppColors.lightOutline,
    );
  }

  static WidgetStateProperty<double?> trackOutlineWidth(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return WidgetStateProperty.all(isDarkMode ? 0 : 2.r);
  }
}
