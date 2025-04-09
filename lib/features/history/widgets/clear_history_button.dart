import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myproject/core/constants/app_colors.dart';
import 'package:myproject/core/enums/icon_enum.dart';
import 'package:myproject/core/extensions/icon_enum_extension.dart';
import 'package:myproject/core/utils/padding_util.dart';
import 'package:myproject/features/home/controllers/theme_switch_controller.dart';
import 'package:smooth_corner/smooth_corner.dart';

class ClearHistoryButton extends StatelessWidget {
  const ClearHistoryButton({required this.onPressed, super.key});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final themeSwitchCubit = ThemeSwitchController.read(context);

    return SmoothContainer(
      child: SizedBox(
        width: 48.r,
        height: 48.r,
        child: IconButton(
          onPressed: onPressed,
          padding: PaddingUtil.zero,
          alignment: Alignment.center,
          style: Theme.of(context).iconButtonTheme.style!.copyWith(
            backgroundColor: WidgetStatePropertyAll(
              themeSwitchCubit.state.isDarkMode
                  ? AppColors.darkErrorContainer
                  : AppColors.lightErrorContainer,
            ),
          ),
          iconSize: 24.r,
          icon: IconEnum.delete.toSVGWidget(
            width: 24.r,
            height: 24.r,
            color: Theme.of(context).iconTheme.color,
          ),
        ),
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
      ObjectFlagProperty<VoidCallback>.has('onPressed', onPressed),
    );
  }
}
