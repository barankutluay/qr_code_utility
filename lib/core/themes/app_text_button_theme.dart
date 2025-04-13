import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myproject/core/constants/app_colors.dart';
import 'package:myproject/core/utils/border_util.dart';
import 'package:smooth_corner/smooth_corner.dart';

final class AppTextButtonTheme {
  const AppTextButtonTheme._();

  static final SmoothRectangleBorder _shape = SmoothRectangleBorder(
    smoothness: 0.6,
    borderRadius: BorderUtil.all(16.r),
  );

  static TextStyle _textStyle(BuildContext context) {
    return Theme.of(context).textTheme.titleMedium!;
  }

  static TextButtonThemeData light(BuildContext context) {
    return TextButtonThemeData(
      style: TextButton.styleFrom(
        shape: _shape,
        enableFeedback: true,
        alignment: Alignment.center,
        backgroundColor: AppColors.transparent,
        shadowColor: AppColors.lightShadow,
        overlayColor: AppColors.lightOnSurface,
        textStyle: _textStyle(context),
      ),
    );
  }

  static TextButtonThemeData dark(BuildContext context) {
    return TextButtonThemeData(
      style: TextButton.styleFrom(
        shape: _shape,
        enableFeedback: true,
        alignment: Alignment.center,
        backgroundColor: AppColors.transparent,
        shadowColor: AppColors.darkShadow,
        overlayColor: AppColors.darkOnSurface,
        textStyle: _textStyle(context),
      ),
    );
  }
}
