import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myproject/core/constants/app_colors.dart';
import 'package:myproject/core/constants/app_strings.dart';
import 'package:myproject/core/enums/icon_enum.dart';
import 'package:myproject/core/extensions/icon_enum_extension.dart';
import 'package:myproject/core/utils/padding_util.dart';
import 'package:myproject/features/home/controllers/theme_switch_controller.dart';

class HistoryEmptyWidget extends StatelessWidget {
  const HistoryEmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final themeSwitchCubit = ThemeSwitchController.read(context);

    return Padding(
      padding: PaddingUtil.only(0, 20.r, 88.r, 20.r),
      child: Center(
        child: Opacity(
          opacity: 0.5,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconEnum.empty.toSVGWidget(
                width: 150.r,
                height: 150.r,
                color:
                    themeSwitchCubit.state.isDarkMode
                        ? AppColors.darkOnSurface
                        : AppColors.lightOnSurface,
              ),
              Text(
                AppStrings.historyIsEmpty,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontSize: 20.r,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
