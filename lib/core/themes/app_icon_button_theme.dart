import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myproject/core/constants/app_colors.dart';
import 'package:myproject/core/utils/border_util.dart';

class AppIconButtonTheme {
  static final IconButtonThemeData light = IconButtonThemeData(
    style: IconButton.styleFrom(
      elevation: 2.r,
      enableFeedback: true,
      backgroundColor: AppColors.lightPrimaryContainer,
      shape: RoundedRectangleBorder(borderRadius: BorderUtil.all(16.r)),
      shadowColor: AppColors.lightShadow,
      overlayColor: AppColors.lightOnSurface,
    ),
  );

  static final IconButtonThemeData dark = IconButtonThemeData(
    style: IconButton.styleFrom(
      elevation: 2.r,
      enableFeedback: true,
      backgroundColor: AppColors.darkPrimaryContainer,
      shape: RoundedRectangleBorder(borderRadius: BorderUtil.all(16.r)),
      shadowColor: AppColors.darkShadow,
      overlayColor: AppColors.darkOnSurface,
    ),
  );
}
