import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_code_utility/core/constants/app_strings.dart';

class HomeTitle extends StatelessWidget {
  const HomeTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 169.r,
      child: Text(
        AppStrings.homeTitleText,
        style: Theme.of(
          context,
        ).textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.w700),
        textAlign: TextAlign.center,
      ),
    );
  }
}
