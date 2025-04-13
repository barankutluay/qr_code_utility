import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myproject/core/constants/app_colors.dart';
import 'package:myproject/core/utils/border_util.dart';
import 'package:smooth_corner/smooth_corner.dart';

final class AppBottomSheetTheme {
  const AppBottomSheetTheme._();

  static final SmoothRectangleBorder _shape = SmoothRectangleBorder(
    smoothness: 0.6,
    borderRadius: BorderUtil.all(16.r),
  );

  static final BottomSheetThemeData light = BottomSheetThemeData(
    elevation: 2.r,
    modalElevation: 2.r,
    showDragHandle: false,
    shape: _shape,
    backgroundColor: AppColors.lightSurfaceContainerLow,
    modalBackgroundColor: AppColors.lightSurfaceContainerLow,
    shadowColor: AppColors.lightShadow,
    modalBarrierColor: AppColors.black75,
  );

  static final BottomSheetThemeData dark = BottomSheetThemeData(
    elevation: 2.r,
    modalElevation: 2.r,
    showDragHandle: false,
    shape: _shape,
    backgroundColor: AppColors.darkSurfaceContainerLow,
    modalBackgroundColor: AppColors.darkSurfaceContainerLow,
    shadowColor: AppColors.darkShadow,
    modalBarrierColor: AppColors.black75,
  );
}
