import 'package:flutter/material.dart';
import 'package:myproject/core/constants/app_strings.dart';

class GeneratedCodeBottomSheetTitle extends StatelessWidget {
  const GeneratedCodeBottomSheetTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      AppStrings.generatedCodeBottomSheetTitle,
      style: Theme.of(
        context,
      ).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w700),
    );
  }
}
