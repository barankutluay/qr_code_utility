import 'package:myproject/core/constants/app_colors.dart';
import 'package:myproject/data/cubits/theme_switch/theme_switch_cubit.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrImageViewStyle {
  static QrDataModuleStyle dataModuleStyle(ThemeSwitchCubit themeSwitchCubit) {
    return QrDataModuleStyle(
      dataModuleShape: QrDataModuleShape.square,
      color: themeSwitchCubit.state.isDarkMode ? AppColors.darkOnSurface : AppColors.lightOnSurface,
    );
  }

  static QrEyeStyle eyeStyle(ThemeSwitchCubit themeSwitchCubit) {
    return QrEyeStyle(
      eyeShape: QrEyeShape.square,
      color: themeSwitchCubit.state.isDarkMode ? AppColors.darkOnSurface : AppColors.lightOnSurface,
    );
  }
}
