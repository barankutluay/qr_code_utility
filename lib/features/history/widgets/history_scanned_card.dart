import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myproject/core/constants/app_colors.dart';
import 'package:myproject/core/constants/app_strings.dart';
import 'package:myproject/core/utils/border_util.dart';
import 'package:myproject/core/utils/padding_util.dart';
import 'package:myproject/features/home/widgets/open_in_new_button.dart';
import 'package:myproject/features/home/widgets/share_button.dart';
import 'package:smooth_corner/smooth_corner.dart';

class HistoryScannedCard extends StatelessWidget {
  const HistoryScannedCard({
    required this.dateString,
    required this.url,
    super.key,
  });

  final String dateString;
  final String url;

  @override
  Widget build(BuildContext context) => Padding(
    padding: PaddingUtil.onlyBottom(24.r),
    child: SmoothCard(
      elevation: 2,
      semanticContainer: false,
      borderRadius: BorderUtil.all(16.r),
      shadowColor: AppColors.shadowColor,
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Padding(
        padding: PaddingUtil.vertical(24.r),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Opacity(
              opacity: 0.5,
              child: Text(
                AppStrings.historyScannedCardTitle,
                style: Theme.of(
                  context,
                ).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w700),
              ),
            ),
            16.verticalSpacingRadius,
            Text(
              dateString,
              style: Theme.of(
                context,
              ).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w700),
            ),
            24.verticalSpacingRadius,
            Text(
              'https://www.youtube.com/watch?v=dQw4w9WgXc',
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
            32.verticalSpacingRadius,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 16.r,
              children: [ShareButton(url: url), OpenInNewButton(url: url)],
            ),
          ],
        ),
      ),
    ),
  );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(StringProperty('dateString', dateString))
      ..add(StringProperty('url', url));
  }
}
