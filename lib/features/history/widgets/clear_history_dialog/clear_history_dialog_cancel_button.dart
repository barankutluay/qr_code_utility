import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myproject/core/constants/app_colors.dart';
import 'package:myproject/core/constants/app_strings.dart';

class ClearHistoryDialogCancelButton extends StatelessWidget {
  const ClearHistoryDialogCancelButton({super.key, this.onPressed});

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48.r,
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          AppStrings.historyClearDialogCancelText,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
            fontSize: 12.r,
            color:
                Theme.of(context).brightness == Brightness.dark
                    ? AppColors.darkError.withValues(alpha: 0.75)
                    : AppColors.lightError.withValues(alpha: 0.75),
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
