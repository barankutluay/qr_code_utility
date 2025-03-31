import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myproject/core/enums/icon_enum.dart';
import 'package:myproject/core/extensions/icon_enum_extension.dart';
import 'package:myproject/core/utils/padding_util.dart';
import 'package:myproject/core/utils/share_util.dart';
import 'package:share_plus/share_plus.dart';
import 'package:smooth_corner/smooth_corner.dart';

class ShareButton extends StatelessWidget {
  const ShareButton({super.key, this.shareText, this.onShareFiles});

  final String? shareText;
  final Future<List<XFile>> Function()? onShareFiles;

  @override
  Widget build(BuildContext context) {
    return SmoothContainer(
      child: SizedBox(
        width: 101.r,
        height: 48.r,
        child: IconButton(
          onPressed: () => share(context, shareText: shareText, onShareFiles: onShareFiles),
          padding: PaddingUtil.zero(),
          alignment: Alignment.center,
          style: Theme.of(context).iconButtonTheme.style,
          icon: _icon(context),
          iconSize: 36.r,
        ),
      ),
    );
  }

  Widget _icon(BuildContext context) {
    return IconEnum.share.toSVGWidget(width: 36.r, height: 36.r, color: Theme.of(context).iconTheme.color);
  }
}
