import 'package:flutter/material.dart';
import 'package:qr_code_utility/features/history/controllers/history_controller.dart';
import 'package:qr_code_utility/features/history/widgets/clear_history_dialog/clear_history_dialog_cancel_button.dart';
import 'package:qr_code_utility/features/history/widgets/clear_history_dialog/clear_history_dialog_delete_button.dart';
import 'package:qr_code_utility/features/history/widgets/clear_history_dialog/clear_history_dialog_vertical_divider.dart';

class ClearHistoryDialogButtons extends StatelessWidget {
  const ClearHistoryDialogButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: ClearHistoryDialogCancelButton(
            onPressed: () => HistoryController.cancel(context),
          ),
        ),
        const ClearHistoryDialogVerticalDivider(),
        Expanded(
          child: ClearHistoryDialogDeleteButton(
            onPressed: () => HistoryController.delete(context),
          ),
        ),
      ],
    );
  }
}
