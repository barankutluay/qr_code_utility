import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myproject/core/constants/app_colors.dart';
import 'package:myproject/core/themes/app_text_theme.dart';
import 'package:myproject/core/utils/border_util.dart';

class AppElevatedButtonTheme {
  static ElevatedButtonThemeData light = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 2.r,
      enableFeedback: true,
      backgroundColor: AppColors.lightPrimaryContainer,
      shape: RoundedRectangleBorder(borderRadius: BorderUtil.all(16.r)),
      shadowColor: AppColors.lightShadow,
      overlayColor: AppColors.lightOnSurface,
      foregroundColor: AppColors.lightOnPrimaryContainer,
      textStyle: AppTextTheme.titleLarge.copyWith(fontSize: 20.r, fontWeight: FontWeight.w700),
    ),
  );

  static ElevatedButtonThemeData dark = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 2.r,
      enableFeedback: true,
      backgroundColor: AppColors.darkPrimaryContainer,
      shape: RoundedRectangleBorder(borderRadius: BorderUtil.all(16.r)),
      shadowColor: AppColors.darkShadow,
      overlayColor: AppColors.darkOnSurface,
      foregroundColor: AppColors.darkOnPrimaryContainer,
      textStyle: AppTextTheme.titleLarge.copyWith(fontSize: 20.r, fontWeight: FontWeight.w700),
    ),
  );
}
