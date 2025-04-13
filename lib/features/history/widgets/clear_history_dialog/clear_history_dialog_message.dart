import 'package:flutter/material.dart';
import 'package:myproject/core/constants/app_strings.dart';

class ClearHistoryDialogMessage extends StatelessWidget {
  const ClearHistoryDialogMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      AppStrings.historyClearDialogMessage,
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
        color: Theme.of(
          context,
        ).textTheme.bodyMedium!.color!.withValues(alpha: 0.75),
      ),
    );
  }
}
