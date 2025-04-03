import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myproject/core/constants/app_colors.dart';
import 'package:myproject/core/styles/theme_switch_style.dart';
import 'package:myproject/core/utils/border_util.dart';
import 'package:myproject/data/cubits/theme_switch/theme_switch_cubit.dart';
import 'package:myproject/features/home/controllers/theme_switch_controller.dart';
import 'package:smooth_corner/smooth_corner.dart';

class ThemeSwitch extends StatelessWidget {
  const ThemeSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeSwitchCubit themeSwitchCubit = ThemeSwitchController.watch(
      context,
    );

    return SizedBox(
      width: 65.r,
      height: 40.r,
      child: Transform.scale(
        scale: 1.r,
        child: SmoothClipRRect(
          borderRadius: BorderUtil.all(100.r),
          child: Switch(
            value: themeSwitchCubit.state.isDarkMode,
            onChanged: (_) => ThemeSwitchController.toggleTheme(context),
            activeColor: AppColors.darkPrimaryContainer,
            activeTrackColor: AppColors.darkPrimaryContainer,
            thumbColor: ThemeSwitchStyle.thumbColor(themeSwitchCubit),
            thumbIcon: ThemeSwitchStyle.thumbIcon(themeSwitchCubit),
            trackOutlineColor: ThemeSwitchStyle.trackOutlineColor(
              themeSwitchCubit,
            ),
            trackOutlineWidth: ThemeSwitchStyle.trackOutlineWidth(
              themeSwitchCubit,
            ),
          ),
        ),
      ),
    );
  }
}
