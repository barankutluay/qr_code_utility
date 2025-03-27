import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myproject/core/constants/app_colors.dart';
import 'package:myproject/core/utils/border_util.dart';
import 'package:myproject/core/utils/padding_util.dart';

class AppSnackbarTheme {
  static SnackBarThemeData light(BuildContext context) => SnackBarThemeData(
    behavior: SnackBarBehavior.floating,
    dismissDirection: DismissDirection.horizontal,
    actionBackgroundColor: AppColors.lightOnSurface,
    actionTextColor: AppColors.lightSurface,
    backgroundColor: AppColors.lightOnSurface,
    elevation: 2.r,
    shape: RoundedRectangleBorder(borderRadius: BorderUtil.all(100.r)),
    insetPadding: PaddingUtil.horizontalAndVertical(20.r, 8.r),
    contentTextStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(color: AppColors.lightSurface),
  );

  static SnackBarThemeData dark(BuildContext context) => SnackBarThemeData(
    behavior: SnackBarBehavior.floating,
    dismissDirection: DismissDirection.horizontal,
    actionBackgroundColor: AppColors.darkOnSurface,
    actionTextColor: AppColors.darkSurface,
    backgroundColor: AppColors.darkOnSurface,
    elevation: 2.r,
    shape: RoundedRectangleBorder(borderRadius: BorderUtil.all(100.r)),
    insetPadding: PaddingUtil.horizontalAndVertical(20.r, 8.r),
    contentTextStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(color: AppColors.darkSurface),
  );
}
