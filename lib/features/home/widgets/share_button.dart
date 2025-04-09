import 'dart:async';

import 'package:flutter/foundation.dart'
    show DiagnosticPropertiesBuilder, ObjectFlagProperty, StringProperty;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myproject/core/enums/icon_enum.dart';
import 'package:myproject/core/extensions/icon_enum_extension.dart';
import 'package:myproject/core/utils/padding_util.dart';
import 'package:share_plus/share_plus.dart';
import 'package:smooth_corner/smooth_corner.dart';

class ShareButton extends StatelessWidget {
  const ShareButton({
    required this.url,
    required this.onPressed,
    super.key,
    this.onShareFiles,
  });

  final String? url;
  final Future<List<XFile>> Function()? onShareFiles;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SmoothContainer(
      child: SizedBox(
        width: 101.r,
        height: 48.r,
        child: IconButton(
          // onPressed: () {
          //   unawaited(share(context, url: url, onShareFiles: onShareFiles));
          // },
          onPressed: onPressed,
          padding: PaddingUtil.zero,
          alignment: Alignment.center,
          style: Theme.of(context).iconButtonTheme.style,
          iconSize: 36.r,
          icon: IconEnum.share.toSVGWidget(
            width: 36.r,
            height: 36.r,
            color: Theme.of(context).iconTheme.color,
          ),
        ),
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(StringProperty('url', url))
      ..add(
        ObjectFlagProperty<Future<List<XFile>> Function()?>.has(
          'onShareFiles',
          onShareFiles,
        ),
      )
      ..add(ObjectFlagProperty<VoidCallback>.has('onPressed', onPressed));
  }
}
