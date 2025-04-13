import 'package:flutter/material.dart';
import 'package:qr_code_utility/core/constants/app_durations.dart';
import 'package:qr_code_utility/core/utils/logger_util.dart';
import 'package:qr_code_utility/core/utils/padding_util.dart';

Future<void> showCustomModalBottomSheet(
  BuildContext context, {
  required Widget widget,
  VoidCallback? onDismiss,
  bool useSafeArea = true,
  bool isDismissible = true,
  bool isScrollControlled = true,
  bool enableDrag = false,
  bool showDragHandle = false,
}) async {
  try {
    return showModalBottomSheet<void>(
      context: context,
      useSafeArea: useSafeArea,
      isDismissible: isDismissible,
      isScrollControlled: isScrollControlled,
      enableDrag: enableDrag,
      showDragHandle: showDragHandle,
      constraints: const BoxConstraints(),
      sheetAnimationStyle: AnimationStyle(
        curve: Curves.easeOutQuad,
        duration: AppDurations.duration300ms,
        reverseCurve: Curves.easeOutQuad,
        reverseDuration: AppDurations.duration300ms,
      ),
      builder: (context) {
        return Padding(
          padding: PaddingUtil.onlyBottom(
            MediaQuery.of(context).viewInsets.bottom,
          ),
          child: widget,
        );
      },
    ).then((_) => onDismiss?.call());
  } catch (error, stackTrace) {
    LoggerUtil.error(
      "The bottom sheet couldn't open: $error",
      error,
      stackTrace,
    );
    rethrow;
  }
}
