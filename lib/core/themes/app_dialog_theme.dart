import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_code_utility/core/constants/app_colors.dart';
import 'package:qr_code_utility/core/utils/border_util.dart';
import 'package:qr_code_utility/core/utils/padding_util.dart';
import 'package:smooth_corner/smooth_corner.dart';

final class AppDialogTheme {
  static final DialogThemeData light = DialogThemeData(
    alignment: Alignment.centerRight,
    elevation: 0,
    insetPadding: PaddingUtil.horizontal(40.r),
    backgroundColor: AppColors.transparent,
    shadowColor: AppColors.lightShadow,
    barrierColor: AppColors.black75,
    surfaceTintColor: AppColors.transparent,
    shape: SmoothRectangleBorder(borderRadius: BorderUtil.all(24.r)),
  );

  static final DialogThemeData dark = DialogThemeData(
    alignment: Alignment.centerRight,
    elevation: 0,
    insetPadding: PaddingUtil.horizontal(40.r),
    backgroundColor: AppColors.transparent,
    shadowColor: AppColors.darkShadow,
    barrierColor: AppColors.black75,
    surfaceTintColor: AppColors.transparent,
    shape: SmoothRectangleBorder(borderRadius: BorderUtil.all(24.r)),
  );
}
