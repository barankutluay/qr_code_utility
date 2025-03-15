import 'package:flutter/material.dart';
import 'package:myproject/core/constants/app_colors.dart';
import 'package:myproject/core/themes/app_icon_button_theme.dart';
import 'package:myproject/core/themes/app_icon_theme.dart';
import 'package:myproject/core/themes/app_text_theme.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.lightSurface,

      textTheme: AppTextTheme.light,
      iconButtonTheme: AppIconButtonTheme.light,
      iconTheme: AppIconTheme.light,
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.darkSurface,

      textTheme: AppTextTheme.dark,
      iconButtonTheme: AppIconButtonTheme.dark,
      iconTheme: AppIconTheme.dark,
    );
  }
}
