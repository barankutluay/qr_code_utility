import 'package:flutter/material.dart';
import 'package:myproject/core/constants/app_colors.dart';

class AppTextSelectionTheme {
  static TextSelectionThemeData light = TextSelectionThemeData(
    cursorColor: AppColors.lightOnSurface,
    selectionColor: AppColors.lightPrimaryContainer.withValues(alpha: 0.25),
    selectionHandleColor: AppColors.lightPrimaryContainer,
  );

  static TextSelectionThemeData dark = TextSelectionThemeData(
    cursorColor: AppColors.darkOnSurface,
    selectionColor: AppColors.darkPrimaryContainer.withValues(alpha: 0.25),
    selectionHandleColor: AppColors.darkPrimaryContainer,
  );
}
