import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_code_utility/core/utils/padding_util.dart';
import 'package:qr_code_utility/features/home/widgets/generated_code_bottom_sheet/generated_code_bottom_sheet_buttons.dart';
import 'package:qr_code_utility/features/home/widgets/generated_code_bottom_sheet/generated_code_bottom_sheet_title.dart';
import 'package:smooth_corner/smooth_corner.dart';

class GeneratedCodeBottomSheet extends StatelessWidget {
  const GeneratedCodeBottomSheet(
    this.qrImageView,
    this.repaintKey,
    this.url, {
    super.key,
  });

  final Widget qrImageView;
  final GlobalKey repaintKey;
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
            const GeneratedCodeBottomSheetTitle(),
            24.verticalSpacingRadius,
            qrImageView,
            48.verticalSpacingRadius,
            GeneratedCodeBottomSheetButtons(repaintKey: repaintKey, url: url),
          ],
        ),
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(
        DiagnosticsProperty<GlobalKey<State<StatefulWidget>>>(
          'repaintKey',
          repaintKey,
        ),
      )
      ..add(StringProperty('url', url));
  }
}
