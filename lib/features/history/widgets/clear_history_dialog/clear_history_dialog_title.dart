import 'package:flutter/material.dart';
import 'package:myproject/core/constants/app_strings.dart';

class ClearHistoryDialogTitle extends StatelessWidget {
  const ClearHistoryDialogTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      AppStrings.historyClearDialogTitle,
      style: Theme.of(
        context,
      ).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w700),
    );
  }
}
