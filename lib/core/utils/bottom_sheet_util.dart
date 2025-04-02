import 'package:flutter/material.dart';
import 'package:myproject/core/constants/app_durations.dart';
import 'package:myproject/core/utils/padding_util.dart';

Future<dynamic> showCustomModalBottomSheet(
  BuildContext context, {
  required Widget widget,
  bool useSafeArea = true,
  bool isDismissible = true,
  bool isScrollControlled = true,
  bool enableDrag = false,
  bool showDragHandle = false,
  VoidCallback? onDismiss,
}) async {
  return showModalBottomSheet(
    context: context,
    useSafeArea: useSafeArea,
    isDismissible: isDismissible,
    isScrollControlled: isScrollControlled,
    enableDrag: enableDrag,
    showDragHandle: showDragHandle,
    constraints: const BoxConstraints(maxWidth: double.infinity),
    sheetAnimationStyle: AnimationStyle(
      curve: Curves.easeOutQuad,
      duration: AppDurations.duration500ms,
      reverseCurve: Curves.easeOutQuad,
      reverseDuration: AppDurations.duration500ms,
    ),
    builder:
        (context) => Padding(
          padding: PaddingUtil.onlyBottom(
            MediaQuery.of(context).viewInsets.bottom,
          ),
          child: widget,
        ),
  ).then((_) {
    if (onDismiss != null) onDismiss();
  });
}
