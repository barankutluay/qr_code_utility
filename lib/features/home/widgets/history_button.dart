import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myproject/core/enums/icon_enum.dart';
import 'package:myproject/core/extensions/icon_enum_extension.dart';
import 'package:myproject/core/utils/padding_util.dart';
import 'package:myproject/data/cubits/theme_switch/theme_switch_cubit.dart';
import 'package:smooth_corner/smooth_corner.dart';

class HistoryButton extends StatelessWidget {
  const HistoryButton({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeSwitchState themeState = context.watch<ThemeSwitchCubit>().state;

    return SmoothContainer(
      child: SizedBox(
        width: 72.r,
        height: 72.r,
        child: IconButton(
          onPressed: () {},
          padding: PaddingUtil.all(18.r),
          style: Theme.of(context).iconButtonTheme.style,
          icon: icon(themeState, context),
          iconSize: 36.r,
        ),
      ),
    );
  }

  Widget icon(ThemeSwitchState themeState, BuildContext context) {
    return IconEnum.history.toSVGWidget(width: 36.r, height: 36.r, color: Theme.of(context).iconTheme.color);
  }
}
