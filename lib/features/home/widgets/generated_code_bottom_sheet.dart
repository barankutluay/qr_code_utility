import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myproject/core/utils/padding_util.dart';
import 'package:smooth_corner/smooth_corner.dart';

class GeneratedCodeBottomSheet extends StatelessWidget {
  const GeneratedCodeBottomSheet({super.key, required this.qrImageView});

  final Widget qrImageView;

  @override
  Widget build(BuildContext context) {
    return SmoothContainer(
      width: double.infinity,
      height: 459.r,
      child: Padding(
        padding: PaddingUtil.horizontalAndVertical(20.r, 24.r),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Generated Code",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w700),
            ),
            60.verticalSpacingRadius,
            qrImageView,
          ],
        ),
      ),
    );
  }
}
