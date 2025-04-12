import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myproject/core/constants/app_colors.dart';
import 'package:myproject/core/styles/theme_switch_style.dart';
import 'package:myproject/core/utils/border_util.dart';
import 'package:myproject/features/home/controllers/theme_switch_controller.dart';
import 'package:smooth_corner/smooth_corner.dart';

class ThemeSwitch extends StatelessWidget {
  const ThemeSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return SizedBox(
      width: 65.r,
      height: 40.r,
      child: Transform.scale(
        scale: 1.r,
        filterQuality: FilterQuality.low,
        child: SmoothClipRRect(
          borderRadius: BorderUtil.all(100.r),
          child: Switch(
            value: isDarkMode,
            onChanged: (_) => ThemeSwitchController.toggleTheme(context),
            activeColor: AppColors.darkPrimaryContainer,
            activeTrackColor: AppColors.darkPrimaryContainer,
            thumbColor: ThemeSwitchStyle.thumbColor(context),
            thumbIcon: ThemeSwitchStyle.thumbIcon(context),
            trackOutlineColor: ThemeSwitchStyle.trackOutlineColor(context),
            trackOutlineWidth: ThemeSwitchStyle.trackOutlineWidth(context),
          ),
        ),
      ),
    );
  }
}
