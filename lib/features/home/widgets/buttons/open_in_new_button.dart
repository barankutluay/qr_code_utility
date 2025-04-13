import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_code_utility/core/enums/icon_enum.dart';
import 'package:qr_code_utility/core/extensions/icon_enum_extension.dart';
import 'package:qr_code_utility/core/utils/launch_url_util.dart';
import 'package:qr_code_utility/core/utils/padding_util.dart';
import 'package:smooth_corner/smooth_corner.dart';

class OpenInNewButton extends StatelessWidget {
  const OpenInNewButton({required this.url, super.key});

  final String url;

  @override
  Widget build(BuildContext context) {
    return SmoothContainer(
      child: SizedBox(
        width: 72.r,
        height: 48.r,
        child: IconButton(
          onPressed: () => unawaited(customLaunchUrl(url)),
          padding: PaddingUtil.zero,
          alignment: Alignment.center,
          style: Theme.of(context).iconButtonTheme.style,
          iconSize: 36.r,
          icon: IconEnum.openInNew.toSVGWidget(
            context,
            width: 36.r,
            height: 36.r,
          ),
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
