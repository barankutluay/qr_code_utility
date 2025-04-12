import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myproject/core/constants/app_colors.dart';
import 'package:myproject/core/utils/border_util.dart';

final class AppBottomSheetTheme {
  const AppBottomSheetTheme._();

  static final RoundedRectangleBorder _shape = RoundedRectangleBorder(
    borderRadius: BorderUtil.only(topLeft: 16.r, topRight: 16.r),
  );

  static final BottomSheetThemeData light = BottomSheetThemeData(
    elevation: 2.r,
    modalElevation: 2.r,
    showDragHandle: false,
    shape: _shape,
    backgroundColor: AppColors.lightSurfaceContainerLow,
    modalBackgroundColor: AppColors.lightSurfaceContainerLow,
    shadowColor: AppColors.lightShadow,
    modalBarrierColor: AppColors.black50,
  );

  static final BottomSheetThemeData dark = BottomSheetThemeData(
    elevation: 2.r,
    modalElevation: 2.r,
    showDragHandle: false,
    shape: _shape,
    backgroundColor: AppColors.darkSurfaceContainerLow,
    modalBackgroundColor: AppColors.darkSurfaceContainerLow,
    shadowColor: AppColors.darkShadow,
    modalBarrierColor: AppColors.black50,
  );
}
