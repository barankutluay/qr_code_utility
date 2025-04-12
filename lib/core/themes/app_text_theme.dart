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

  static TextStyle get _displayLarge {
    return _baseTextStyle(fontSize: 57, letterSpacingPercent: -1, height: 1.2);
  }

  static TextStyle get _displayMedium {
    return _baseTextStyle(fontSize: 45, letterSpacingPercent: -1, height: 1.2);
  }

  static TextStyle get _displaySmall {
    return _baseTextStyle(fontSize: 36, letterSpacingPercent: -1, height: 1.2);
  }

  // * Headline styles

  static TextStyle get _headlineLarge {
    return _baseTextStyle(fontSize: 32, letterSpacingPercent: -1, height: 1.2);
  }

  static TextStyle get _headlineMedium {
    return _baseTextStyle(fontSize: 28, letterSpacingPercent: -1, height: 1.2);
  }

  static TextStyle get _headlineSmall {
    return _baseTextStyle(fontSize: 24, letterSpacingPercent: -1, height: 1.2);
  }

  // * Title styles

  static TextStyle get _titleLarge {
    return _baseTextStyle(fontSize: 22, letterSpacingPercent: -1, height: 1.2);
  }

  static TextStyle get _titleMedium {
    return _baseTextStyle(fontSize: 16, letterSpacingPercent: -1, height: 1.2);
  }

  static TextStyle get _titleSmall {
    return _baseTextStyle(fontSize: 14, letterSpacingPercent: -1, height: 1.2);
  }

  // * Label styles

  static TextStyle get _labelLarge {
    return _baseTextStyle(fontSize: 14, fontWeight: FontWeight.w500);
  }

  static TextStyle get _labelMedium {
    return _baseTextStyle(fontSize: 12, fontWeight: FontWeight.w500);
  }

  static TextStyle get _labelSmall {
    return _baseTextStyle(fontSize: 11, fontWeight: FontWeight.w500);
  }

  // * Body styles

  static TextStyle get _bodyLarge {
    return _baseTextStyle(fontSize: 16);
  }

  static TextStyle get _bodyMedium {
    return _baseTextStyle(fontSize: 14);
  }

  static TextStyle get _bodySmall {
    return _baseTextStyle(fontSize: 12);
  }

  static TextTheme get light {
    return TextTheme(
      displayLarge: _displayLarge,
      displayMedium: _displayMedium,
      displaySmall: _displaySmall,
      headlineLarge: _headlineLarge,
      headlineMedium: _headlineMedium,
      headlineSmall: _headlineSmall,
      titleLarge: _titleLarge,
      titleMedium: _titleMedium,
      titleSmall: _titleSmall,
      labelLarge: _labelLarge,
      labelMedium: _labelMedium,
      labelSmall: _labelSmall,
      bodyLarge: _bodyLarge,
      bodyMedium: _bodyMedium,
      bodySmall: _bodySmall,
    ).apply(
      fontFamily: 'Roboto',
      bodyColor: AppColors.lightOnSurface,
      displayColor: AppColors.lightOnSurface,
    );
  }

  static TextTheme get dark {
    return TextTheme(
      displayLarge: _displayLarge,
      displayMedium: _displayMedium,
      displaySmall: _displaySmall,
      headlineLarge: _headlineLarge,
      headlineMedium: _headlineMedium,
      headlineSmall: _headlineSmall,
      titleLarge: _titleLarge,
      titleMedium: _titleMedium,
      titleSmall: _titleSmall,
      labelLarge: _labelLarge,
      labelMedium: _labelMedium,
      labelSmall: _labelSmall,
      bodyLarge: _bodyLarge,
      bodyMedium: _bodyMedium,
      bodySmall: _bodySmall,
    ).apply(
      fontFamily: 'Roboto',
      bodyColor: AppColors.darkOnSurface,
      displayColor: AppColors.darkOnSurface,
    );
  }
}
