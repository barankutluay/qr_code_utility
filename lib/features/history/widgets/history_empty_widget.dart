import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myproject/core/constants/app_colors.dart';
import 'package:myproject/core/constants/app_strings.dart';
import 'package:myproject/core/enums/icon_enum.dart';
import 'package:myproject/core/extensions/icon_enum_extension.dart';
import 'package:myproject/core/utils/padding_util.dart';

class HistoryEmptyWidget extends StatelessWidget {
  const HistoryEmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: PaddingUtil.only(0, 20.r, 88.r, 20.r),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconEnum.empty.toSVGWidget(
              context,
              width: 150.r,
              height: 150.r,
              color:
                  isDarkMode
                      ? AppColors.darkOnSurface.withValues(alpha: 0.5)
                      : AppColors.lightOnSurface.withValues(alpha: 0.5),
            ),
            Text(
              AppStrings.historyIsEmpty,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontSize: 20.r,
                fontWeight: FontWeight.w500,
                color: Theme.of(
                  context,
                ).textTheme.titleMedium!.color!.withValues(alpha: 0.5),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
