import 'package:flutter/material.dart';
import 'package:myproject/core/constants/app_colors.dart';
import 'package:myproject/core/themes/app_bottom_sheet_theme.dart';
import 'package:myproject/core/themes/app_elevated_button_theme.dart';
import 'package:myproject/core/themes/app_icon_button_theme.dart';
import 'package:myproject/core/themes/app_icon_theme.dart';
import 'package:myproject/core/themes/app_input_decoration_theme.dart';
import 'package:myproject/core/themes/app_text_selection_theme.dart';
import 'package:myproject/core/themes/app_text_theme.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.lightSurface,
      indicatorColor: AppColors.lightPrimaryContainer,

      textTheme: AppTextTheme.light,
      iconTheme: AppIconTheme.light,
      iconButtonTheme: AppIconButtonTheme.light,
      elevatedButtonTheme: AppElevatedButtonTheme.light,
      bottomSheetTheme: AppBottomSheetTheme.light,
      inputDecorationTheme: AppInputDecorationTheme.light,
      textSelectionTheme: AppTextSelectionTheme.light,
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.darkSurface,
      indicatorColor: AppColors.darkPrimaryContainer,

      textTheme: AppTextTheme.dark,
      iconTheme: AppIconTheme.dark,
      iconButtonTheme: AppIconButtonTheme.dark,
      elevatedButtonTheme: AppElevatedButtonTheme.dark,
      bottomSheetTheme: AppBottomSheetTheme.dark,
      inputDecorationTheme: AppInputDecorationTheme.dark,
    );
  }
}
