import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myproject/core/constants/app_colors.dart';
import 'package:myproject/core/utils/border_util.dart';

final class AppIconButtonTheme {
  const AppIconButtonTheme._();

  static final RoundedRectangleBorder shape = RoundedRectangleBorder(
    borderRadius: BorderUtil.all(16.r),
  );

  static final IconButtonThemeData light = IconButtonThemeData(
    style: IconButton.styleFrom(
      elevation: 2.r,
      enableFeedback: true,
      backgroundColor: AppColors.lightPrimaryContainer,
      shadowColor: AppColors.shadowColor,
      overlayColor: AppColors.lightOnSurface,
      shape: shape,
    ),
  );

  static final IconButtonThemeData dark = IconButtonThemeData(
    style: IconButton.styleFrom(
      elevation: 2.r,
      enableFeedback: true,
      backgroundColor: AppColors.darkPrimaryContainer,
      shadowColor: AppColors.shadowColor,
      overlayColor: AppColors.darkOnSurface,
      shape: shape,
    ),
  );
}
