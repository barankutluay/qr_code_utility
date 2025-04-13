import 'package:flutter/material.dart';
import 'package:qr_code_utility/core/constants/app_strings.dart';

class GenerateQrCodeBottomSheetTitle extends StatelessWidget {
  const GenerateQrCodeBottomSheetTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      AppStrings.generateQrCodeBottomSheetTitle,
      style: Theme.of(
        context,
      ).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w700),
    );
  }
}
