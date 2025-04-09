import 'package:flutter/material.dart';
import 'package:myproject/core/constants/app_strings.dart';

class HistoryGeneratedCardTitle extends StatelessWidget {
  const HistoryGeneratedCardTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.5,
      child: Text(
        AppStrings.historyGeneratedCardTitle,
        style: Theme.of(
          context,
        ).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w700),
      ),
    );
  }
}
