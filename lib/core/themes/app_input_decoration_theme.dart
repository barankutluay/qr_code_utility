import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myproject/core/constants/app_colors.dart';
import 'package:myproject/core/utils/border_util.dart';
import 'package:myproject/core/utils/padding_util.dart';

final class AppInputDecorationTheme {
  const AppInputDecorationTheme._();

  static InputDecorationTheme _buildTheme({
    required BuildContext context,
    required Color fillColor,
    required Color onSurfaceColor,
    required Color outlineColor,
    required Color primaryContainerColor,
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
        color: AppColors.error,
        fontWeight: FontWeight.w500,
      ),
      border: _buildBorder(outlineColor, 1.r, borderRadius),
      focusedBorder: _buildBorder(primaryContainerColor, 2.r, borderRadius),
      errorBorder: _buildBorder(AppColors.error, 1.r, borderRadius),
      focusedErrorBorder: _buildBorder(AppColors.error, 2.r, borderRadius),
    );
  }

  static OutlineInputBorder _buildBorder(
    Color color,
    double width,
    BorderRadius borderRadius,
  ) {
    const strokeAlign = BorderSide.strokeAlignInside;
    const borderStyle = BorderStyle.solid;

    return OutlineInputBorder(
      borderRadius: borderRadius,
      borderSide: BorderSide(
        color: color,
        width: width,
        strokeAlign: strokeAlign,
        style: borderStyle,
      ),
    );
  }

  static InputDecorationTheme light(BuildContext context) => _buildTheme(
    context: context,
    fillColor: AppColors.lightSurfaceContainerLow,
    onSurfaceColor: AppColors.lightOnSurface,
    outlineColor: AppColors.lightOutline,
    primaryContainerColor: AppColors.lightPrimaryContainer,
  );

  static InputDecorationTheme dark(BuildContext context) => _buildTheme(
    context: context,
    fillColor: AppColors.darkSurfaceContainerLow,
    onSurfaceColor: AppColors.darkOnSurface,
    outlineColor: AppColors.darkOutline,
    primaryContainerColor: AppColors.darkPrimaryContainer,
  );
}
