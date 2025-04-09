import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myproject/core/constants/app_colors.dart';
import 'package:myproject/core/utils/padding_util.dart';
import 'package:myproject/features/home/controllers/theme_switch_controller.dart';

class HistoryLoadingWidget extends StatelessWidget {
  const HistoryLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final themeSwitchCubit = ThemeSwitchController.read(context);

    return Center(
      child: Padding(
        padding: PaddingUtil.onlyBottom(88.r),
        child: CircularProgressIndicator(
          backgroundColor:
              themeSwitchCubit.state.isDarkMode
                  ? AppColors.darkOnSurface.withValues(alpha: 0.025)
                  : AppColors.lightOnSurface.withValues(alpha: 0.025),
        ),
      ),
    );
  }
}
