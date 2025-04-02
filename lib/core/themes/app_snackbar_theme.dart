import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myproject/core/constants/app_colors.dart';
import 'package:myproject/core/utils/border_util.dart';
import 'package:myproject/core/utils/padding_util.dart';

class AppSnackbarTheme {
  static final ShapeBorder shape = RoundedRectangleBorder(
    borderRadius: BorderUtil.all(100.r),
  );

  static final EdgeInsets insetPadding = PaddingUtil.horizontalAndVertical(
    20.r,
    8.r,
  );

  static TextStyle textStyle(BuildContext context, {Color? color}) =>
      Theme.of(context).textTheme.bodyLarge!.copyWith(color: color);

  static SnackBarThemeData light(BuildContext context) => SnackBarThemeData(
    elevation: 2.r,
    shape: shape,
    insetPadding: insetPadding,
    behavior: SnackBarBehavior.floating,
    dismissDirection: DismissDirection.horizontal,
    actionBackgroundColor: AppColors.lightOnSurface,
    actionTextColor: AppColors.lightSurface,
    backgroundColor: AppColors.lightOnSurface,
    contentTextStyle: textStyle(context, color: AppColors.lightSurface),
  );

  static SnackBarThemeData dark(BuildContext context) => SnackBarThemeData(
    elevation: 2.r,
    shape: shape,
    insetPadding: insetPadding,
    behavior: SnackBarBehavior.floating,
    dismissDirection: DismissDirection.horizontal,
    actionBackgroundColor: AppColors.darkOnSurface,
    actionTextColor: AppColors.darkSurface,
    backgroundColor: AppColors.darkOnSurface,
    contentTextStyle: textStyle(context, color: AppColors.darkSurface),
  );
}
