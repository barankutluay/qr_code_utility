import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_code_utility/core/constants/app_colors.dart';
import 'package:qr_code_utility/core/utils/border_util.dart';
import 'package:qr_code_utility/core/utils/padding_util.dart';
import 'package:smooth_corner/smooth_corner.dart';

final class AppSnackbarTheme {
  const AppSnackbarTheme._();

  static final SmoothRectangleBorder _shape = SmoothRectangleBorder(
    smoothness: 0.6,
    borderRadius: BorderUtil.all(16.r),
  );

  static final EdgeInsets _insetPadding = PaddingUtil.horizontalAndVertical(
    20.r,
    8.r,
  );

  static TextStyle _textStyle(BuildContext context, {Color? color}) {
    return Theme.of(context).textTheme.bodyLarge!.copyWith(color: color);
  }

  static SnackBarThemeData light(BuildContext context) {
    return SnackBarThemeData(
      elevation: 2.r,
      shape: _shape,
      insetPadding: _insetPadding,
      behavior: SnackBarBehavior.floating,
      dismissDirection: DismissDirection.horizontal,
      actionBackgroundColor: AppColors.lightOnSurface,
      actionTextColor: AppColors.lightSurface,
      backgroundColor: AppColors.lightOnSurface,
      contentTextStyle: _textStyle(context, color: AppColors.lightSurface),
    );
  }

  static SnackBarThemeData dark(BuildContext context) {
    return SnackBarThemeData(
      elevation: 2.r,
      shape: _shape,
      insetPadding: _insetPadding,
      behavior: SnackBarBehavior.floating,
      dismissDirection: DismissDirection.horizontal,
      actionBackgroundColor: AppColors.darkOnSurface,
      actionTextColor: AppColors.darkSurface,
      backgroundColor: AppColors.darkOnSurface,
      contentTextStyle: _textStyle(context, color: AppColors.darkSurface),
    );
  }
}
