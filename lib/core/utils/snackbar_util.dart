import 'package:flutter/material.dart';
import 'package:qr_code_utility/core/constants/app_colors.dart';
import 'package:qr_code_utility/core/constants/app_durations.dart';

Future<void> showCustomSnackbar(
  BuildContext context,
  String message, {
  SnackBarEnum type = SnackBarEnum.info,
}) async {
  final isDarkMode = Theme.of(context).brightness == Brightness.dark;

  if (type == SnackBarEnum.error) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor:
            isDarkMode ? AppColors.darkError : AppColors.lightError,
        content: Center(child: Text(message)),
        duration: AppDurations.duration3000ms,
      ),
    );
  }

  if (type == SnackBarEnum.info) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Center(child: Text(message)),
        duration: AppDurations.duration3000ms,
      ),
    );
  }
}

enum SnackBarEnum { info, warning, success, error }
