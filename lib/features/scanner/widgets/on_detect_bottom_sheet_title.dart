import 'package:flutter/material.dart';
import 'package:myproject/core/constants/app_strings.dart';

class OnDetectBottomSheetTitle extends StatelessWidget {
  const OnDetectBottomSheetTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      AppStrings.onDetectBottomSheetTitle,
      style: Theme.of(
        context,
      ).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w700),
    );
  }
}
