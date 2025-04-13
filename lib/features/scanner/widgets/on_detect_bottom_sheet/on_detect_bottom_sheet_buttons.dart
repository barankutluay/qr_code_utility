import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_code_utility/features/home/widgets/buttons/open_in_new_button.dart';
import 'package:qr_code_utility/features/home/widgets/buttons/share_button.dart';
import 'package:qr_code_utility/features/scanner/controllers/scanner_controller.dart';

class OnDetectBottomSheetButtons extends StatelessWidget {
  const OnDetectBottomSheetButtons({required this.url, super.key});

  final String url;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 16.r,
      children: [
        ShareButton(onPressed: () => ScannerController.shareUrl(context, url)),
        OpenInNewButton(url: url),
      ],
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('url', url));
  }
}
