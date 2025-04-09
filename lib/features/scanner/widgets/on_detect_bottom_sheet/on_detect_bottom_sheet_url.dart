import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class OnDetectBottomSheetUrl extends StatelessWidget {
  const OnDetectBottomSheetUrl({required this.url, super.key});

  final String url;

  @override
  Widget build(BuildContext context) {
    return Text(
      url,
      style: Theme.of(context).textTheme.bodyLarge,
      textAlign: TextAlign.center,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('url', url));
  }
}
