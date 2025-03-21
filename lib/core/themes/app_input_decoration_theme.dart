import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myproject/core/constants/app_colors.dart';
import 'package:myproject/core/utils/border_util.dart';
import 'package:myproject/core/utils/padding_util.dart';

class AppInputDecorationTheme {
  static InputDecorationTheme light(BuildContext context) {
    return InputDecorationTheme(
      isCollapsed: false,
      isDense: false,
      contentPadding: PaddingUtil.horizontalAndVertical(16.r, 12.r),

      hintStyle: Theme.of(
        context,
      ).textTheme.bodyLarge!.copyWith(color: AppColors.lightOnSurface.withValues(alpha: 0.5)),

      border: OutlineInputBorder(
        borderRadius: BorderUtil.all(16.r),
        borderSide: BorderSide(
          color: AppColors.lightOutline,
          width: 1.r,
          strokeAlign: BorderSide.strokeAlignInside,
          style: BorderStyle.solid,
        ),
      ),

      focusedBorder: OutlineInputBorder(
        borderRadius: BorderUtil.all(16.r),
        borderSide: BorderSide(
          color: AppColors.lightPrimaryContainer,
          width: 2.r,
          strokeAlign: BorderSide.strokeAlignInside,
          style: BorderStyle.solid,
        ),
      ),
    );
  }

  static InputDecorationTheme dark(BuildContext context) {
    return InputDecorationTheme(
      isCollapsed: false,
      isDense: false,
      contentPadding: PaddingUtil.horizontalAndVertical(16.r, 12.r),

      hintStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(color: AppColors.darkOnSurface.withValues(alpha: 0.5)),

      border: OutlineInputBorder(
        borderRadius: BorderUtil.all(16.r),
        borderSide: BorderSide(
          color: AppColors.darkOutline,
          width: 1.r,
          strokeAlign: BorderSide.strokeAlignInside,
          style: BorderStyle.solid,
        ),
      ),

      focusedBorder: OutlineInputBorder(
        borderRadius: BorderUtil.all(16.r),
        borderSide: BorderSide(
          color: AppColors.darkPrimaryContainer,
          width: 2.r,
          strokeAlign: BorderSide.strokeAlignInside,
          style: BorderStyle.solid,
        ),
      ),
    );
  }
}
