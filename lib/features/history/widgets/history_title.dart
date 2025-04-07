import 'package:flutter/material.dart';
import 'package:myproject/core/constants/app_strings.dart';

class HistoryTitle extends StatelessWidget {
  const HistoryTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      AppStrings.historyTitleText,
      style: Theme.of(
        context,
      ).textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.w700),
      textAlign: TextAlign.center,
    );
  }
}
