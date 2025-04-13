import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myproject/core/constants/app_colors.dart';
import 'package:myproject/core/utils/border_util.dart';
import 'package:smooth_corner/smooth_corner.dart';

final class AppIconButtonTheme {
  const AppIconButtonTheme._();

  static final SmoothRectangleBorder _shape = SmoothRectangleBorder(
    smoothness: 0.6,
    borderRadius: BorderUtil.all(16.r),
  );

  static final IconButtonThemeData light = IconButtonThemeData(
    style: IconButton.styleFrom(
      elevation: 2.r,
      enableFeedback: true,
      backgroundColor: AppColors.lightPrimaryContainer,
      shadowColor: AppColors.lightShadow,
      overlayColor: AppColors.lightOnSurface,
      shape: _shape,
    ),
  );

  static final IconButtonThemeData dark = IconButtonThemeData(
    style: IconButton.styleFrom(
      elevation: 2.r,
      enableFeedback: true,
      backgroundColor: AppColors.darkPrimaryContainer,
      shadowColor: AppColors.darkShadow,
      overlayColor: AppColors.darkOnSurface,
      shape: _shape,
    ),
  );
}
