import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myproject/core/constants/app_colors.dart';
import 'package:myproject/core/utils/border_util.dart';

final class AppElevatedButtonTheme {
  const AppElevatedButtonTheme._();

  static final RoundedRectangleBorder shape = RoundedRectangleBorder(
    borderRadius: BorderUtil.all(16.r),
  );

  static TextStyle textStyle(BuildContext context) {
    return Theme.of(context).textTheme.titleLarge!.copyWith(
      fontSize: 20.r,
      fontWeight: FontWeight.w700,
    );
  }

  static ElevatedButtonThemeData light(BuildContext context) {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 2.r,
        shape: shape,
        enableFeedback: true,
        alignment: Alignment.center,
        backgroundColor: AppColors.lightPrimaryContainer,
        shadowColor: AppColors.shadowColor,
        overlayColor: AppColors.lightOnSurface,
        foregroundColor: AppColors.lightOnPrimaryContainer,
        textStyle: textStyle(context),
      ),
    );
  }

  static ElevatedButtonThemeData dark(BuildContext context) {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 2.r,
        enableFeedback: true,
        shape: shape,
        alignment: Alignment.center,
        backgroundColor: AppColors.darkPrimaryContainer,
        shadowColor: AppColors.shadowColor,
        overlayColor: AppColors.darkOnSurface,
        foregroundColor: AppColors.darkOnPrimaryContainer,
        textStyle: textStyle(context),
      ),
    );
  }
}
