import 'package:flutter/material.dart';
import 'package:qr_code_utility/core/constants/app_colors.dart';

final class AppTextSelectionTheme {
  const AppTextSelectionTheme._();

  static final TextSelectionThemeData light = TextSelectionThemeData(
    cursorColor: AppColors.lightOnSurface,
    selectionColor: AppColors.lightPrimaryContainer.withValues(alpha: 0.25),
    selectionHandleColor: AppColors.lightPrimaryContainer,
  );

  static final TextSelectionThemeData dark = TextSelectionThemeData(
    cursorColor: AppColors.darkOnSurface,
    selectionColor: AppColors.darkPrimaryContainer.withValues(alpha: 0.25),
    selectionHandleColor: AppColors.darkPrimaryContainer,
  );
}
