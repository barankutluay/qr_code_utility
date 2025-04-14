import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:qr_code_utility/core/utils/border_util.dart';
import 'package:qr_code_utility/core/utils/padding_util.dart';
import 'package:qr_code_utility/features/history/widgets/clear_history_dialog/clear_history_dialog_cancel_button.dart';
import 'package:qr_code_utility/features/history/widgets/clear_history_dialog/clear_history_dialog_delete_button.dart';
import 'package:qr_code_utility/features/history/widgets/clear_history_dialog/clear_history_dialog_message.dart';
import 'package:qr_code_utility/features/history/widgets/clear_history_dialog/clear_history_dialog_title.dart';
import 'package:qr_code_utility/features/history/widgets/clear_history_dialog/clear_history_dialog_vertical_divider.dart';
import 'package:smooth_corner/smooth_corner.dart';

class ClearHistoryDialog extends StatelessWidget {
  const ClearHistoryDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return SmoothContainer(
      width: double.infinity,
      borderRadius: BorderUtil.all(16.r),
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: PaddingUtil.only(24.r, 12.r, 0, 12.r),
            child: const ClearHistoryDialogTitle(),
          ),
          16.verticalSpacingRadius,
          Padding(
            padding: PaddingUtil.horizontal(12.r),
            child: const ClearHistoryDialogMessage(),
          ),
          16.verticalSpacingRadius,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ClearHistoryDialogCancelButton(
                  onPressed: () => context.pop(false),
                ),
              ),
              const ClearHistoryDialogVerticalDivider(),
              Expanded(
                child: ClearHistoryDialogDeleteButton(
                  onPressed: () => context.pop(true),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
