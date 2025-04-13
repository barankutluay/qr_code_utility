import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:myproject/core/utils/border_util.dart';
import 'package:myproject/core/utils/padding_util.dart';
import 'package:myproject/features/history/widgets/clear_history_dialog/clear_history_dialog_cancel_button.dart';
import 'package:myproject/features/history/widgets/clear_history_dialog/clear_history_dialog_message.dart';
import 'package:myproject/features/history/widgets/clear_history_dialog/clear_history_dialog_ok_button.dart';
import 'package:myproject/features/history/widgets/clear_history_dialog/clear_history_dialog_title.dart';
import 'package:smooth_corner/smooth_corner.dart';

class ClearHistoryDialog extends StatelessWidget {
  const ClearHistoryDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return SmoothContainer(
      width: double.infinity,
      borderRadius: BorderUtil.all(24.r),
      color: Theme.of(context).scaffoldBackgroundColor,
      padding: PaddingUtil.only(24.r, 12.r, 12.r, 12.r),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const ClearHistoryDialogTitle(),
          16.verticalSpacingRadius,
          const ClearHistoryDialogMessage(),
          16.verticalSpacingRadius,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ClearHistoryDialogCancelButton(
                onPressed: () {
                  context.pop(false);
                },
              ),
              ClearHistoryDialogOkButton(
                onPressed: () {
                  context.pop(true);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
