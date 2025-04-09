import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myproject/core/constants/app_colors.dart';

final class AppTextTheme {
  const AppTextTheme._();

  static TextStyle _baseTextStyle({
    required double fontSize,
    FontWeight fontWeight = FontWeight.w400,
    double letterSpacingPercent = 0,
    double height = 1.5,
  }) {
    return TextStyle(
      fontSize: fontSize.r,
      fontWeight: fontWeight,
      letterSpacing: fontSize.r * (letterSpacingPercent / 100),
      height: height,
      fontFamily: 'Roboto',
    );
  }

  // * Display styles

  /// Font Size: 57 with screenutil radius ".r".
  static TextStyle get displayLarge {
    return _baseTextStyle(fontSize: 57, letterSpacingPercent: -1, height: 1.2);
  }

  /// Font Size: 45 with screenutil radius ".r".
  static TextStyle get displayMedium {
    return _baseTextStyle(fontSize: 45, letterSpacingPercent: -1, height: 1.2);
  }

  /// Font Size: 36 with screenutil radius ".r".
  static TextStyle get displaySmall {
    return _baseTextStyle(fontSize: 36, letterSpacingPercent: -1, height: 1.2);
  }

  // * Headline styles

  /// Font Size: 32 with screenutil radius ".r".
  static TextStyle get headlineLarge {
    return _baseTextStyle(fontSize: 32, letterSpacingPercent: -1, height: 1.2);
  }

  /// Font Size: 28 with screenutil radius ".r".
  static TextStyle get headlineMedium {
    return _baseTextStyle(fontSize: 28, letterSpacingPercent: -1, height: 1.2);
  }

  /// Font Size: 24 with screenutil radius ".r".
  static TextStyle get headlineSmall {
    return _baseTextStyle(fontSize: 24, letterSpacingPercent: -1, height: 1.2);
  }

  // * Title styles

  /// Font Size: 22 with screenutil radius ".r".
  static TextStyle get titleLarge {
    return _baseTextStyle(fontSize: 22, letterSpacingPercent: -1, height: 1.2);
  }

  /// Font Size: 16 with screenutil radius ".r".
  static TextStyle get titleMedium {
    return _baseTextStyle(fontSize: 16, letterSpacingPercent: -1, height: 1.2);
  }

  /// Font Size: 14 with screenutil radius ".r".
  static TextStyle get titleSmall {
    return _baseTextStyle(fontSize: 14, letterSpacingPercent: -1, height: 1.2);
  }

  // * Label styles

  /// Font Size: 14 with screenutil radius ".r".
  static TextStyle get labelLarge {
    return _baseTextStyle(fontSize: 14, fontWeight: FontWeight.w500);
  }

  /// Font Size: 12 with screenutil radius ".r".
  static TextStyle get labelMedium {
    return _baseTextStyle(fontSize: 12, fontWeight: FontWeight.w500);
  }

  /// Font Size: 11 with screenutil radius ".r".
  static TextStyle get labelSmall {
    return _baseTextStyle(fontSize: 11, fontWeight: FontWeight.w500);
  }

  // * Body styles

  /// Font Size: 16 with screenutil radius ".r".
  static TextStyle get bodyLarge {
    return _baseTextStyle(fontSize: 16);
  }

  /// Font Size: 14 with screenutil radius ".r".
  static TextStyle get bodyMedium {
    return _baseTextStyle(fontSize: 14);
  }

  /// Font Size: 12 with screenutil radius ".r".
  static TextStyle get bodySmall {
    return _baseTextStyle(fontSize: 12);
  }

  /// Complete light text theme for app.
  static TextTheme get light {
    return TextTheme(
      displayLarge: displayLarge,
      displayMedium: displayMedium,
      displaySmall: displaySmall,
      headlineLarge: headlineLarge,
      headlineMedium: headlineMedium,
      headlineSmall: headlineSmall,
      titleLarge: titleLarge,
      titleMedium: titleMedium,
      titleSmall: titleSmall,
      labelLarge: labelLarge,
      labelMedium: labelMedium,
      labelSmall: labelSmall,
      bodyLarge: bodyLarge,
      bodyMedium: bodyMedium,
      bodySmall: bodySmall,
    ).apply(
      fontFamily: 'Roboto',
      bodyColor: AppColors.lightOnSurface,
      displayColor: AppColors.lightOnSurface,
    );
  }

  /// Complete dark text theme for app.
  static TextTheme get dark {
    return TextTheme(
      displayLarge: displayLarge,
      displayMedium: displayMedium,
      displaySmall: displaySmall,
      headlineLarge: headlineLarge,
      headlineMedium: headlineMedium,
      headlineSmall: headlineSmall,
      titleLarge: titleLarge,
      titleMedium: titleMedium,
      titleSmall: titleSmall,
      labelLarge: labelLarge,
      labelMedium: labelMedium,
      labelSmall: labelSmall,
      bodyLarge: bodyLarge,
      bodyMedium: bodyMedium,
      bodySmall: bodySmall,
    ).apply(
      fontFamily: 'Roboto',
      bodyColor: AppColors.darkOnSurface,
      displayColor: AppColors.darkOnSurface,
    );
  }
}
