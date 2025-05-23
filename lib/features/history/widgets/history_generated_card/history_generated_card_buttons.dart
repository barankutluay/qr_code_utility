import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_code_utility/features/history/controllers/history_controller.dart';
import 'package:qr_code_utility/features/home/widgets/buttons/open_in_new_button.dart';
import 'package:qr_code_utility/features/home/widgets/buttons/share_button.dart';

class HistoryGeneratedCardButtons extends StatelessWidget {
  const HistoryGeneratedCardButtons({
    required this.repaintKey,
    required this.url,
    super.key,
  });

  final GlobalKey repaintKey;
  final String url;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 16.r,
      children: [
        ShareButton(
          onPressed: () => HistoryController.shareQrCode(context, repaintKey),
        ),
        OpenInNewButton(url: url),
      ],
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
