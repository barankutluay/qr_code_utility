import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_code_utility/core/constants/app_colors.dart';
import 'package:qr_code_utility/core/constants/app_strings.dart';
import 'package:qr_code_utility/core/utils/border_util.dart';
import 'package:smooth_corner/smooth_corner.dart';

class ClearHistoryDialogCancelButton extends StatelessWidget {
  const ClearHistoryDialogCancelButton({super.key, this.onPressed});

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final shape = WidgetStatePropertyAll(
      SmoothRectangleBorder(borderRadius: BorderUtil.only(bottomLeft: 16.r)),
    );

    return Container(
      height: 48.r,
      child: TextButton(
        onPressed: onPressed,
        style: Theme.of(context).textButtonTheme.style!.copyWith(shape: shape),
        child: Text(
          AppStrings.historyClearDialogCancelText,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
            fontSize: 14.r,
            letterSpacing: 0,
            fontWeight: FontWeight.w700,
            color:
                Theme.of(context).brightness == Brightness.dark
                    ? AppColors.darkPrimaryContainer
                    : AppColors.lightPrimaryContainer,
          ),
        ),
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
      ObjectFlagProperty<VoidCallback?>.has('onPressed', onPressed),
    );
  }
}
