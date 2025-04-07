import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myproject/core/enums/icon_enum.dart';
import 'package:myproject/core/extensions/icon_enum_extension.dart';
import 'package:myproject/core/utils/launch_url_util.dart';
import 'package:myproject/core/utils/padding_util.dart';
import 'package:smooth_corner/smooth_corner.dart';

class OpenInNewButton extends StatelessWidget {
  const OpenInNewButton({super.key, required this.url});

  final String url;

  @override
  Widget build(BuildContext context) {
    return SmoothContainer(
      child: SizedBox(
        width: 101.r,
        height: 48.r,
        child: IconButton(
          onPressed: () => customLaunchUrl(url),
          padding: PaddingUtil.zero,
          alignment: Alignment.center,
          style: Theme.of(context).iconButtonTheme.style,
          iconSize: 36.r,
          icon: IconEnum.openInNew.toSVGWidget(
            width: 36.r,
            height: 36.r,
            color: Theme.of(context).iconTheme.color,
          ),
        ),
      ),
    );
  }
}
