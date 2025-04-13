import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_code_utility/core/constants/app_colors.dart';
import 'package:qr_code_utility/core/constants/app_strings.dart';

class ClearHistoryDialogOkButton extends StatelessWidget {
  const ClearHistoryDialogOkButton({super.key, this.onPressed});

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48.r,
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          AppStrings.historyClearDialogOkText,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
            fontSize: 14.r,
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
