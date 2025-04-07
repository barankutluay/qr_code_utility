import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:myproject/core/enums/icon_enum.dart';
import 'package:myproject/core/extensions/icon_enum_extension.dart';
import 'package:myproject/core/utils/padding_util.dart';
import 'package:smooth_corner/smooth_corner.dart';

class ScanButton extends StatelessWidget {
  const ScanButton({super.key});

  @override
  Widget build(BuildContext context) => SmoothContainer(
    child: SizedBox(
      width: 144.r,
      height: 144.r,
      child: IconButton(
        onPressed: () async => context.pushNamed('scanner'),
        padding: PaddingUtil.zero,
        alignment: Alignment.center,
        style: Theme.of(context).iconButtonTheme.style,
        iconSize: 112.r,
        icon: IconEnum.scanIcon.toSVGWidget(
          width: 112.r,
          height: 112.r,
          color: Theme.of(context).iconTheme.color,
        ),
      ),
    ),
  );
}
