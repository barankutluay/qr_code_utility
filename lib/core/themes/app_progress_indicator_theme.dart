import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_code_utility/core/constants/app_colors.dart';

final class AppProgressIndicatorTheme {
  const AppProgressIndicatorTheme._();

  static final ProgressIndicatorThemeData light = ProgressIndicatorThemeData(
    color: AppColors.lightPrimaryContainer,
    strokeWidth: 6.r,
    strokeAlign: 8.r,
    strokeCap: StrokeCap.round,
  );

  static final ProgressIndicatorThemeData dark = ProgressIndicatorThemeData(
    color: AppColors.darkPrimaryContainer,
    strokeWidth: 6.r,
    strokeAlign: 8.r,
    strokeCap: StrokeCap.round,
  );
}
