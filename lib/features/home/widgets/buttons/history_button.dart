import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_code_utility/core/enums/icon_enum.dart';
import 'package:qr_code_utility/core/extensions/icon_enum_extension.dart';
import 'package:qr_code_utility/core/utils/padding_util.dart';
import 'package:smooth_corner/smooth_corner.dart';

class HistoryButton extends StatelessWidget {
  const HistoryButton({required this.onPressed, super.key});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SmoothContainer(
      child: SizedBox(
        width: 72.r,
        height: 72.r,
        child: IconButton(
          onPressed: onPressed,
          padding: PaddingUtil.zero,
          alignment: Alignment.center,
          style: Theme.of(context).iconButtonTheme.style,
          iconSize: 36.r,
          icon: IconEnum.history.toSVGWidget(
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
    properties.add(
      ObjectFlagProperty<VoidCallback>.has('onPressed', onPressed),
    );
  }
}
