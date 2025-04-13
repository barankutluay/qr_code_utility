import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_code_utility/core/utils/padding_util.dart';
import 'package:qr_code_utility/features/scanner/widgets/on_detect_bottom_sheet/on_detect_bottom_sheet_buttons.dart';
import 'package:qr_code_utility/features/scanner/widgets/on_detect_bottom_sheet/on_detect_bottom_sheet_title.dart';
import 'package:qr_code_utility/features/scanner/widgets/on_detect_bottom_sheet/on_detect_bottom_sheet_url.dart';
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
          children: [
            const OnDetectBottomSheetTitle(),
            16.verticalSpacingRadius,
            OnDetectBottomSheetUrl(url: url),
            32.verticalSpacingRadius,
            OnDetectBottomSheetButtons(url: url),
          ],
        ),
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('url', url));
  }
}
