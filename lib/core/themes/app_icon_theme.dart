import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myproject/core/constants/app_colors.dart';

class AppIconTheme {
  static IconThemeData light = IconThemeData(color: AppColors.lightOnPrimaryContainer, size: 24.r, weight: 400.0);

  static IconThemeData dark = IconThemeData(color: AppColors.darkOnPrimaryContainer, size: 24.r, weight: 400.0);
}
