import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myproject/core/constants/app_colors.dart';
import 'package:myproject/core/utils/border_util.dart';

class AppBottomSheetTheme {
  static final RoundedRectangleBorder shape = RoundedRectangleBorder(
    borderRadius: BorderUtil.only(topLeft: 16.r, topRight: 16.r),
  );

  static final BottomSheetThemeData light = BottomSheetThemeData(
    elevation: 2.r,
    modalElevation: 2.r,
    showDragHandle: false,
    shape: shape,
    backgroundColor: AppColors.lightSurfaceContainerLow,
    modalBackgroundColor: AppColors.lightSurfaceContainerLow,
    shadowColor: AppColors.black,
    modalBarrierColor: AppColors.black50,
  );

  static final BottomSheetThemeData dark = BottomSheetThemeData(
    elevation: 2.r,
    modalElevation: 2.r,
    showDragHandle: false,
    shape: shape,
    backgroundColor: AppColors.darkSurfaceContainerLow,
    modalBackgroundColor: AppColors.darkSurfaceContainerLow,
    shadowColor: AppColors.black,
    modalBarrierColor: AppColors.black50,
  );
}
