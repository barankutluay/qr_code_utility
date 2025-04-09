import 'package:flutter/material.dart';
import 'package:myproject/core/constants/app_strings.dart';

class HistoryScannedCardTitle extends StatelessWidget {
  const HistoryScannedCardTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.5,
      child: Text(
        AppStrings.historyScannedCardTitle,
        style: Theme.of(
          context,
        ).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w700),
      ),
    );
  }
}
