import 'package:flutter/material.dart';
import 'package:myproject/core/constants/app_strings.dart';

class HistoryGeneratedCardTitle extends StatelessWidget {
  const HistoryGeneratedCardTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      AppStrings.historyGeneratedCardTitle,
      style: Theme.of(context).textTheme.titleMedium!.copyWith(
        fontWeight: FontWeight.w700,
        color: Theme.of(
          context,
        ).textTheme.titleMedium!.color!.withValues(alpha: 0.5),
      ),
    );
  }
}
