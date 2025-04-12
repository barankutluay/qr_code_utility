import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myproject/core/constants/app_colors.dart';
import 'package:myproject/core/utils/border_util.dart';
import 'package:myproject/core/utils/padding_util.dart';

final class AppSnackbarTheme {
  const AppSnackbarTheme._();

  static final ShapeBorder _shape = RoundedRectangleBorder(
    borderRadius: BorderUtil.all(100.r),
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
