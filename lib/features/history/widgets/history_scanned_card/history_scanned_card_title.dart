import 'package:flutter/material.dart';
import 'package:qr_code_utility/core/constants/app_strings.dart';

class HistoryScannedCardTitle extends StatelessWidget {
  const HistoryScannedCardTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      AppStrings.historyScannedCardTitle,
      style: Theme.of(context).textTheme.titleMedium!.copyWith(
        fontWeight: FontWeight.w700,
        color: Theme.of(
          context,
        ).textTheme.titleMedium!.color!.withValues(alpha: 0.5),
      ),
    );
  }
}
