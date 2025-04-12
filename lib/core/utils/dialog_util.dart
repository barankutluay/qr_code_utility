import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myproject/core/constants/app_colors.dart';
import 'package:myproject/core/utils/logger_util.dart';

// TODO: Delete esnasında aç, dönen değere göre işlem yap
Future<void> showCustomDialog(
  BuildContext context, {
  required Widget widget,
  VoidCallback? onDismiss,
}) async {
  try {
    return showDialog<void>(
      context: context,
      barrierColor: AppColors.black50,
      anchorPoint: const Offset(0.5, 0.5),
      builder: (context) {
        return Dialog(
          alignment: Alignment.center,
          backgroundColor: Colors.transparent,
          insetPadding: EdgeInsets.all(20.r),
          child: widget,
        );
      },
    ).then((_) => onDismiss?.call());
  } catch (error, stackTrace) {
    LoggerUtil.error("The dialog couldn't open: $error", error, stackTrace);
    rethrow;
  }
}
