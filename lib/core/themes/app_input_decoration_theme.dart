import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myproject/core/constants/app_colors.dart';
import 'package:myproject/core/utils/border_util.dart';
import 'package:myproject/core/utils/padding_util.dart';

class AppInputDecorationTheme {
  static InputDecorationTheme _buildTheme({
    required BuildContext context,
    required Color fillColor,
    required Color onSurfaceColor,
    required Color outlineColor,
    required Color primaryContainerColor,
  }) {
    final bodyLargeStyle = Theme.of(context).textTheme.bodyLarge!;
    final bodyMediumStyle = Theme.of(context).textTheme.bodyMedium!;
    return InputDecorationTheme(
      isCollapsed: false,
      isDense: true,
      contentPadding: PaddingUtil.all(16.r),
      fillColor: fillColor,
      hintStyle: bodyLargeStyle.copyWith(color: onSurfaceColor.withValues(alpha: 0.5)),
      errorStyle: bodyMediumStyle.copyWith(color: AppColors.error, fontWeight: FontWeight.w500),
      border: OutlineInputBorder(
        borderRadius: BorderUtil.all(16.r),
        borderSide: BorderSide(
          color: outlineColor,
          width: 1.r,
          strokeAlign: BorderSide.strokeAlignInside,
          style: BorderStyle.solid,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderUtil.all(16.r),
        borderSide: BorderSide(
          color: primaryContainerColor,
          width: 2.r,
          strokeAlign: BorderSide.strokeAlignInside,
          style: BorderStyle.solid,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderUtil.all(16.r),
        borderSide: BorderSide(
          color: AppColors.error,
          width: 1.r,
          strokeAlign: BorderSide.strokeAlignInside,
          style: BorderStyle.solid,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderUtil.all(16.r),
        borderSide: BorderSide(
          color: AppColors.error,
          width: 2.r,
          strokeAlign: BorderSide.strokeAlignInside,
          style: BorderStyle.solid,
        ),
      ),
    );
  }

  static InputDecorationTheme light(BuildContext context) {
    return _buildTheme(
      context: context,
      fillColor: AppColors.lightSurfaceContainerLow,
      onSurfaceColor: AppColors.lightOnSurface,
      outlineColor: AppColors.lightOutline,
      primaryContainerColor: AppColors.lightPrimaryContainer,
    );
  }

  static InputDecorationTheme dark(BuildContext context) {
    return _buildTheme(
      context: context,
      fillColor: AppColors.darkSurfaceContainerLow,
      onSurfaceColor: AppColors.darkOnSurface,
      outlineColor: AppColors.darkOutline,
      primaryContainerColor: AppColors.darkPrimaryContainer,
    );
  }
}
