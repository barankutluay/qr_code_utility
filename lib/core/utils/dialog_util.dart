import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_code_utility/core/constants/app_colors.dart';
import 'package:qr_code_utility/core/constants/app_durations.dart';
import 'package:qr_code_utility/core/utils/logger_util.dart';
import 'package:qr_code_utility/core/utils/padding_util.dart';

Future<bool?> showCustomDialog(
  BuildContext context, {
  required Widget widget,
  VoidCallback? onDismiss,
}) async {
  try {
    return showDialog<bool>(
      context: context,
      barrierColor: AppColors.black75,
      anchorPoint: const Offset(0.5, 0.5),
      builder: (context) {
        return Dialog(
          elevation: 2.r,
          insetAnimationCurve: Curves.easeOutQuad,
          insetAnimationDuration: AppDurations.duration300ms,
          shadowColor: Theme.of(context).shadowColor,
          alignment: Alignment.center,
          insetPadding: PaddingUtil.horizontal(40.r),
          backgroundColor: Colors.transparent,
          child: widget,
        );
      },
    ).then((result) {
      onDismiss?.call();
      return result;
    });
  } catch (error, stackTrace) {
    LoggerUtil.error("The dialog couldn't open: $error", error, stackTrace);
    rethrow;
  }
}
