import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:myproject/features/home/widgets/custom_qr_image_view.dart';

class HistoryGeneratedCardQrImageView extends StatelessWidget {
  const HistoryGeneratedCardQrImageView({
    required this.url,
    required this.repaintKey,
    super.key,
  });

  final String url;
  final GlobalKey repaintKey;

  @override
  Widget build(BuildContext context) {
    return CustomQrImageView(data: url, repaintKey: repaintKey);
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(StringProperty('url', url))
      ..add(
        DiagnosticsProperty<GlobalKey<State<StatefulWidget>>>(
          'repaintKey',
          repaintKey,
        ),
      );
  }
}
