import 'package:flutter/material.dart';
import 'package:qr_code_utility/core/constants/app_durations.dart';
import 'package:qr_code_utility/core/utils/logger_util.dart';

Future<bool?> showCustomDialog(
  BuildContext context, {
  required Widget widget,
  VoidCallback? onDismiss,
}) async {
  try {
    return showDialog<bool>(
      context: context,
      anchorPoint: const Offset(0.5, 0.5),
      builder: (context) {
        return Dialog(
          insetAnimationCurve: Curves.easeOutQuad,
          insetAnimationDuration: AppDurations.duration300ms,
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
