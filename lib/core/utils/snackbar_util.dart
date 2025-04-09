import 'package:flutter/material.dart';
import 'package:myproject/core/constants/app_colors.dart';
import 'package:myproject/core/constants/app_durations.dart';
import 'package:myproject/features/home/controllers/theme_switch_controller.dart';

Future<void> showCustomSnackbar(
  BuildContext context,
  String message, {
  SnackBarEnum type = SnackBarEnum.info,
}) async {
  final themeSwitchCubit = ThemeSwitchController.read(context);

  if (type == SnackBarEnum.error) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor:
            themeSwitchCubit.state.isDarkMode
                ? AppColors.darkError
                : AppColors.lightError,
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
