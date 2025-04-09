import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myproject/core/constants/app_colors.dart';
import 'package:myproject/core/utils/border_util.dart';
import 'package:myproject/core/utils/padding_util.dart';

final class AppInputDecorationTheme {
  const AppInputDecorationTheme._();

  static InputDecorationTheme _buildTheme(
    BuildContext context, {
    required Color fillColor,
    required Color onSurfaceColor,
    required Color outlineColor,
    required Color primaryContainerColor,
    required Color errorColor,
  }) {
    final textTheme = Theme.of(context).textTheme;
    final padding = PaddingUtil.all(16.r);
    final borderRadius = BorderUtil.all(16.r);

    return InputDecorationTheme(
      isDense: true,
      fillColor: fillColor,
      contentPadding: padding,
      hintStyle: textTheme.bodyLarge!.copyWith(
        color: onSurfaceColor.withValues(alpha: 0.5),
      ),
      errorStyle: textTheme.bodyMedium!.copyWith(
        color: errorColor,
        fontWeight: FontWeight.w500,
      ),
      border: _buildBorder(
        color: outlineColor,
        width: 1.r,
        borderRadius: borderRadius,
      ),
      focusedBorder: _buildBorder(
        color: primaryContainerColor,
        width: 2.r,
        borderRadius: borderRadius,
      ),
      errorBorder: _buildBorder(
        color: errorColor,
        width: 1.r,
        borderRadius: borderRadius,
      ),
      focusedErrorBorder: _buildBorder(
        color: errorColor,
        width: 2.r,
        borderRadius: borderRadius,
      ),
    );
  }

  static OutlineInputBorder _buildBorder({
    required Color color,
    required double width,
    required BorderRadius borderRadius,
  }) {
    return OutlineInputBorder(
      borderRadius: borderRadius,
      borderSide: BorderSide(color: color, width: width),
    );
  }

  static InputDecorationTheme light(BuildContext context) {
    return _buildTheme(
      context,
      fillColor: AppColors.lightSurfaceContainerLow,
      onSurfaceColor: AppColors.lightOnSurface,
      outlineColor: AppColors.lightOutline,
      primaryContainerColor: AppColors.lightPrimaryContainer,
      errorColor: AppColors.lightError,
    );
  }

  static InputDecorationTheme dark(BuildContext context) {
    return _buildTheme(
      context,
      fillColor: AppColors.darkSurfaceContainerLow,
      onSurfaceColor: AppColors.darkOnSurface,
      outlineColor: AppColors.darkOutline,
      primaryContainerColor: AppColors.darkPrimaryContainer,
      errorColor: AppColors.darkError,
    );
  }
}
