import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TitleText extends StatelessWidget {
  const TitleText({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 169.r,
      child: Text(
        'QR Code Scanner',
        style: Theme.of(context).textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.w700),
        textAlign: TextAlign.center,
      ),
    );
  }
}
