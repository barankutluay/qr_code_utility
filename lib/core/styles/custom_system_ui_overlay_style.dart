import 'package:flutter/services.dart';
import 'package:myproject/core/constants/app_colors.dart';

final class CustomSystemUiOverlayStyle {
  const CustomSystemUiOverlayStyle._();

  static void setStyle(bool isDarkMode) {
    final style =
        isDarkMode
            ? SystemUiOverlayStyle.dark.copyWith(
              statusBarIconBrightness: Brightness.light,
              statusBarBrightness: Brightness.light,
              systemNavigationBarIconBrightness: Brightness.light,
              statusBarColor: AppColors.transparent,
              systemNavigationBarColor: AppColors.transparent,
              systemNavigationBarDividerColor: AppColors.transparent,
            )
            : SystemUiOverlayStyle.light.copyWith(
              statusBarIconBrightness: Brightness.dark,
              statusBarBrightness: Brightness.dark,
              systemNavigationBarIconBrightness: Brightness.dark,
              statusBarColor: AppColors.transparent,
              systemNavigationBarColor: AppColors.transparent,
              systemNavigationBarDividerColor: AppColors.transparent,
            );

    SystemChrome.setSystemUIOverlayStyle(style);
  }
}
