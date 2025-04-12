import 'package:flutter/services.dart';
import 'package:myproject/core/constants/app_colors.dart';

final class CustomSystemUiOverlayStyle {
  const CustomSystemUiOverlayStyle._();

  static void setStyle(bool isDarkMode) {
    SystemChrome.setSystemUIOverlayStyle(
      isDarkMode
          ? SystemUiOverlayStyle.dark.copyWith(
            statusBarBrightness: Brightness.dark,
            statusBarColor: AppColors.transparent,
            statusBarIconBrightness: Brightness.light,
            systemNavigationBarColor: AppColors.transparent,
            systemNavigationBarDividerColor: AppColors.transparent,
            systemNavigationBarIconBrightness: Brightness.light,
          )
          : SystemUiOverlayStyle.light.copyWith(
            statusBarBrightness: Brightness.light,
            statusBarColor: AppColors.transparent,
            statusBarIconBrightness: Brightness.dark,
            systemNavigationBarColor: AppColors.transparent,
            systemNavigationBarDividerColor: AppColors.transparent,
            systemNavigationBarIconBrightness: Brightness.dark,
          ),
    );
  }
}
