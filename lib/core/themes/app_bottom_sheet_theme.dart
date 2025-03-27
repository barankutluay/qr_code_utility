import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myproject/core/constants/app_colors.dart';
import 'package:myproject/core/utils/border_util.dart';

class AppBottomSheetTheme {
  static final BottomSheetThemeData light = BottomSheetThemeData(
    elevation: 2.r,
    modalElevation: 2.r,
    showDragHandle: false,
    backgroundColor: AppColors.lightSurfaceContainerLow,
    modalBackgroundColor: AppColors.lightSurfaceContainerLow,
    shadowColor: Colors.black,
    modalBarrierColor: Colors.black.withValues(alpha: 0.5),
    shape: RoundedRectangleBorder(borderRadius: BorderUtil.only(topLeft: 16.r, topRight: 16.r)),
  );

  static final BottomSheetThemeData dark = BottomSheetThemeData(
    elevation: 2.r,
    modalElevation: 2.r,
    showDragHandle: false,
    backgroundColor: AppColors.darkSurfaceContainerLow,
    modalBackgroundColor: AppColors.darkSurfaceContainerLow,
    shadowColor: Colors.black,
    modalBarrierColor: Colors.black.withValues(alpha: 0.5),
    shape: RoundedRectangleBorder(borderRadius: BorderUtil.only(topLeft: 16.r, topRight: 16.r)),
  );
}
