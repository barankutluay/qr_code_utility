import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:myproject/core/enums/icon_enum.dart';
import 'package:myproject/core/extensions/icon_enum_extension.dart';
import 'package:myproject/core/utils/padding_util.dart';
import 'package:smooth_corner/smooth_corner.dart';

class BackwardButton extends StatelessWidget {
  const BackwardButton({super.key});

  @override
  Widget build(BuildContext context) => SmoothContainer(
    child: SizedBox(
      width: 48.r,
      height: 48.r,
      child: IconButton(
        onPressed: () => context.pop(),
        padding: PaddingUtil.zero,
        alignment: Alignment.center,
        style: Theme.of(context).iconButtonTheme.style,
        iconSize: 24.r,
        icon: IconEnum.chevronBackward.toSVGWidget(
          width: 24.r,
          height: 24.r,
          color: Theme.of(context).iconTheme.color,
        ),
      ),
    ),
  );
}
