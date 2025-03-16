import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myproject/core/animations/app_bottom_sheet_animation.dart';
import 'package:myproject/core/enums/icon_enum.dart';
import 'package:myproject/core/extensions/icon_enum_extension.dart';
import 'package:myproject/core/utils/padding_util.dart';
import 'package:myproject/data/cubits/theme_switch/theme_switch_cubit.dart';
import 'package:smooth_corner/smooth_corner.dart';

class CreateButton extends StatelessWidget {
  const CreateButton({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeSwitchState themeState = context.watch<ThemeSwitchCubit>().state;

    return SmoothContainer(
      child: SizedBox(
        width: 72.r,
        height: 72.r,
        child: IconButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              useSafeArea: true,
              isDismissible: true,
              isScrollControlled: false,
              enableDrag: false,
              sheetAnimationStyle: AppBottomSheetAnimation.animationStyle,
              constraints: BoxConstraints(maxWidth: double.infinity),
              builder: (context) {
                return SmoothContainer(
                  width: double.infinity,
                  height: 235.r,
                  child: Padding(
                    padding: PaddingUtil.only(24.r, 20.r, 32.r, 20.r),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [Text("Deneme")],
                    ),
                  ),
                );
              },
            );
          },
          padding: PaddingUtil.all(18.r),
          style: Theme.of(context).iconButtonTheme.style,
          icon: icon(themeState, context),
          iconSize: 36.r,
        ),
      ),
    );
  }

  Widget icon(ThemeSwitchState themeState, BuildContext context) {
    return IconEnum.create.toSVGWidget(width: 36.r, height: 36.r, color: Theme.of(context).iconTheme.color);
  }
}
