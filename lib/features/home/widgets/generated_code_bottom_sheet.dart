import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myproject/core/constants/app_strings.dart';
import 'package:myproject/core/utils/padding_util.dart';
import 'package:myproject/features/home/controllers/generate_qr_code_controller.dart';
import 'package:myproject/features/home/widgets/open_in_new_button.dart';
import 'package:myproject/features/home/widgets/share_button.dart';
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
  Widget build(BuildContext context) => SmoothContainer(
    width: double.infinity,
    child: Padding(
      padding: PaddingUtil.horizontalAndVertical(20.r, 24.r),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            AppStrings.generatedCodeBottomSheetTitle,
            style: Theme.of(
              context,
            ).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w700),
          ),
          32.verticalSpacingRadius,
          qrImageView,
          64.verticalSpacingRadius,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 16.r,
            children: [
              ShareButton(
                url: url,
                onShareFiles:
                    () async =>
                        GenerateQrCodeController.captureImage(repaintKey),
              ),
              OpenInNewButton(url: url),
            ],
          ),
        ],
      ),
    ),
  );

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
