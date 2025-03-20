import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myproject/core/utils/padding_util.dart';
import 'package:myproject/features/home/widgets/generate_button.dart';
import 'package:myproject/features/home/widgets/link_text_field.dart';
import 'package:smooth_corner/smooth_corner.dart';

class GenerateQrCodeBottomSheet extends StatelessWidget {
  const GenerateQrCodeBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SmoothContainer(
      width: double.infinity,
      height: 235.r,
      child: Padding(
        padding: PaddingUtil.horizontalAndVertical(20.r, 24.r),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Generate QR Code",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w700),
            ),
            32.verticalSpacingRadius,
            LinkTextField(),
            32.verticalSpacingRadius,
            GenerateButton(),
          ],
        ),
      ),
    );
  }
}
