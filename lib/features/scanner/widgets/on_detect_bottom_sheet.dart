import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myproject/core/constants/app_strings.dart';
import 'package:myproject/core/utils/padding_util.dart';
import 'package:myproject/features/home/widgets/open_in_new_button.dart';
import 'package:myproject/features/home/widgets/share_button.dart';
import 'package:smooth_corner/smooth_corner.dart';

class OnDetectBottomSheet extends StatelessWidget {
  const OnDetectBottomSheet(this.url, {super.key});

  final String url;

  @override
  Widget build(BuildContext context) {
    return SmoothContainer(
      width: double.infinity,
      child: Padding(
        padding: PaddingUtil.horizontalAndVertical(20.r, 24.r),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              AppStrings.onDetectBottomSheetTitle,
              style: Theme.of(
                context,
              ).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w700),
            ),
            16.verticalSpacingRadius,
            Text(
              url,
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
            32.verticalSpacingRadius,
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 16.r,
              children: [ShareButton(url: url), OpenInNewButton(url: url)],
            ),
          ],
        ),
      ),
    );
  }
}
